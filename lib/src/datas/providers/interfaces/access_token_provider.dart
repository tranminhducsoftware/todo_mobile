import 'package:todo_mobile/src/datas/models/auth/authenticate_model.dart';
import 'package:todo_mobile/src/datas/models/auth/authenticate_result_model.dart';

abstract class IAccessTokenProvider {

  AuthenticateModel? authenticateModel;

  AuthenticateResultModel? authenticateResult;

  String getAccessToken();

  Future<AuthenticateResultModel> loginAsync();

  Future refreshTokenAsync();

  void logout();

  bool isUserLoggedIn();

  bool isTokenExpired();

  bool isRefreshTokenExpired();
}