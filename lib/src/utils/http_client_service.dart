
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:todo_mobile/src/config/app_config.dart';
import 'package:todo_mobile/src/datas/providers/interfaces/access_token_provider.dart';
import 'package:todo_mobile/src/datas/providers/interfaces/application_context_provider.dart';
import 'package:todo_mobile/src/datas/providers/interfaces/data_storage_provider.dart';

class HttpClientService {
  IApplicationContextProvider? applicationContextProvider;

  final Dio _dio = Dio();

  HttpClientService() {
    GetIt getIt = GetIt.I;
    applicationContextProvider = getIt.get<IApplicationContextProvider>();
  }

  Future<Dio> createClient() async {
    _dio.options.baseUrl = AbpConfig.hostUrl;
    _dio.options.headers["User-Agent"] = AbpConfig.userAgent;
    _dio.options.headers["X-Requested-With"] = "XMLHttpRequest";
    _dio.interceptors.clear();
    _dio.interceptors.add(CustomInterceptor(_dio));
    return _dio;
  }
}

class CustomInterceptor extends Interceptor {
  IApplicationContextProvider? applicationContextProvider;
  IAccessTokenProvider? accessTokenProvider;
  IDataStorageProvider? dataStorageProvider;
  Dio dio;
  CustomInterceptor(this.dio) {
    GetIt getIt = GetIt.I;
    applicationContextProvider = getIt.get<IApplicationContextProvider>();
    accessTokenProvider = getIt.get<IAccessTokenProvider>();
    dataStorageProvider = getIt.get<IDataStorageProvider>();
  }

  @override
  Future onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    if (applicationContextProvider!.currentTenant != null) {
      options.headers[AbpConfig.tenantResolveKey] =
          applicationContextProvider!.currentTenant!.tenantId;
    }

    if (applicationContextProvider!.currentLanguage != null) {
      options.headers[AbpConfig.languageKey] = "c=" +
          applicationContextProvider!.currentLanguage!.name! +
          '|uic=' +
          applicationContextProvider!.currentLanguage!.name!;
    }

    if (accessTokenProvider != null &&
        accessTokenProvider!.getAccessToken().isNotEmpty) {
      var accessToken = accessTokenProvider!.getAccessToken();
      options.headers[HttpHeaders.authorizationHeader] = "Bearer $accessToken";
    }

    if (accessTokenProvider != null && accessTokenProvider!.getAccessToken().isNotEmpty) {
      if (accessTokenProvider!.isTokenExpired() && !accessTokenProvider!.isRefreshTokenExpired()) {
        try {
          await accessTokenProvider!.refreshTokenAsync();
        } catch (e) {}
      }
      var accessToken = accessTokenProvider!.getAccessToken();
      if (accessToken.isNotEmpty) {
        options.headers[HttpHeaders.authorizationHeader] = "Bearer $accessToken";
      }
    }
    return handler.next(options);
  }
}