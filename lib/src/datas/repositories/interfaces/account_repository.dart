import 'package:todo_mobile/src/datas/models/auth/authenticate_model.dart';
import 'package:todo_mobile/src/datas/models/auth/authenticate_result_model.dart';

abstract class IAccountRepository {
  AuthenticateModel? authenticateModel;
  AuthenticateResultModel? authenticateResultModel;

  Future loginUser();

  Future logout();

  Future<bool> isUserLoggedIn();
}