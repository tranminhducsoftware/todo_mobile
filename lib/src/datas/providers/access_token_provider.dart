import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:todo_mobile/src/config/app_config.dart';
import 'package:todo_mobile/src/datas/models/auth/authenticate_model.dart';
import 'package:todo_mobile/src/datas/models/auth/authenticate_result_model.dart';
import 'package:todo_mobile/src/datas/models/auth/refresh_token_result.dart';
import 'package:todo_mobile/src/datas/models/common/ajax_response.dart';

import 'interfaces/access_token_provider.dart';
import 'interfaces/application_context_provider.dart';

class AccessTokenProvider implements IAccessTokenProvider {
  IApplicationContextProvider? applicationContextProvider;

  AccessTokenProvider() {
    applicationContextProvider = GetIt.I.get<IApplicationContextProvider>();
  }

  Dio createApiClient() {
    var _dio = Dio();
    _dio.options.baseUrl = AbpConfig.hostUrl;
    _dio.options.headers["User-Agent"] = AbpConfig.userAgent;
    _dio.options.headers["X-Requested-With"] = "XMLHttpRequest";
    _dio.options.contentType = Headers.jsonContentType;
    if (applicationContextProvider?.currentTenant != null) {
      _dio.options.headers[AbpConfig.tenantResolveKey] =
          applicationContextProvider!.currentTenant!.tenantId;
    }
    return _dio;
  }

  @override
  AuthenticateModel? authenticateModel;

  @override
  AuthenticateResultModel? authenticateResult;

  @override
  String getAccessToken() {
    if (authenticateResult == null) {
      return '';
    }
    return authenticateResult!.accessToken!;
  }

  @override
  bool isTokenExpired() {
    if (authenticateResult == null) {
      return false;
    } else {
      return DateTime.now().isAfter(authenticateResult!.tokenExpireDate!);
    }
  }

  @override
  bool isRefreshTokenExpired() {
    if (authenticateResult == null) {
      return false;
    } else {
      return DateTime.now()
          .isAfter(authenticateResult!.refreshTokenExpireDate!);
    }
  }

  @override
  bool isUserLoggedIn() {
    return authenticateResult != null &&
        authenticateResult!.accessToken != null;
  }

  @override
  Future<AuthenticateResultModel> loginAsync() async {
    if (authenticateModel!.userNameOrEmailAddress!.isEmpty ||
        authenticateModel!.password!.isEmpty) {
      throw UnimplementedError(
          "userNameOrEmailAddress and password cannot be empty");
    }

    var client = createApiClient();

    var clientResponse =
    await client.post(AbpConfig.loginUrlSegment, data: authenticateModel);

    if (clientResponse.statusCode != 200) {
      authenticateResult = null;
      throw UnimplementedError('Login failed');
    }

    var ajaxReponse = AjaxResponse<AuthenticateResultModel>.fromJson(
        clientResponse.data,
            (data) =>
            AuthenticateResultModel.fromJson(data as Map<String, dynamic>));

    if (!ajaxReponse.success) {
      throw UnimplementedError(
          'Login failed' + ajaxReponse.errorInfo!.message!);
    }

    authenticateResult = ajaxReponse.result!;

    if (authenticateResult!.expireInSeconds != null) {
      authenticateResult!.tokenExpireDate = DateTime.now()
          .add(Duration(seconds: authenticateResult!.expireInSeconds!));
    }
    if (authenticateResult!.refreshTokenExpireInSeconds != null) {
      authenticateResult!.refreshTokenExpireDate = DateTime.now().add(
          Duration(seconds: authenticateResult!.refreshTokenExpireInSeconds!));
    }

    return authenticateResult!;
  }

  @override
  void logout() {
    authenticateResult = null;
  }

  @override
  Future refreshTokenAsync() async {
    if (authenticateResult!.refreshToken!.isEmpty) {
      throw Exception("No refresh token!");
    }

    if (isRefreshTokenExpired()) {
      throw Exception('Refresh token expired');
    }

    var client = createApiClient();

    var clientResponse = await client.post(AbpConfig.refreshTokenUrlSegment,
        data: {'refreshToken': authenticateResult!.refreshToken!},
        options: Options(contentType: Headers.formUrlEncodedContentType));

    if (clientResponse.statusCode != 200) {
      authenticateResult = null;
      throw Exception('Refresh token failed');
    }

    var ajaxResponse = AjaxResponse<RefreshTokenResult>.fromJson(
        clientResponse.data,
            (data) => RefreshTokenResult.fromJson(data as Map<String, dynamic>));

    if (!ajaxResponse.success) {
      throw Exception(
          'Refresh token failed' + ajaxResponse.errorInfo!.message!);
    }

    authenticateResult!.accessToken = ajaxResponse.result!.accessToken;
    return ajaxResponse.result!.accessToken;
  }
}