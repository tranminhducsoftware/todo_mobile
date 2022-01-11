import 'package:get_it/get_it.dart';

import 'package:todo_mobile/src/datas/models/auth/authenticate_model.dart';
import 'package:todo_mobile/src/datas/models/auth/authenticate_result_model.dart';
import 'package:todo_mobile/src/datas/providers/interfaces/access_token_provider.dart';
import 'package:todo_mobile/src/datas/providers/interfaces/application_context_provider.dart';
import 'package:todo_mobile/src/datas/providers/interfaces/data_storage_provider.dart';
import 'package:todo_mobile/src/datas/providers/interfaces/permission_manager_provider.dart';
import 'package:todo_mobile/src/datas/providers/interfaces/session_provider.dart';

import 'interfaces/account_repository.dart';

class AccountRepository implements IAccountRepository {
  IApplicationContextProvider? applicationContextProvider;
  ISessionAppProvider? sessionAppProvider;
  IAccessTokenProvider? accessTokenProvider;
  IDataStorageProvider? dataStorageProvider;
  IPermissionManagerProvider? permissionManagerProvider;

  AccountRepository({this.authenticateModel}) {
    var getIt = GetIt.I;
    applicationContextProvider = getIt.get<IApplicationContextProvider>();
    sessionAppProvider = getIt.get<ISessionAppProvider>();
    accessTokenProvider = getIt.get<IAccessTokenProvider>();
    dataStorageProvider = getIt.get<IDataStorageProvider>();
    permissionManagerProvider = getIt.get<IPermissionManagerProvider>();
  }

  @override
  AuthenticateModel? authenticateModel;

  @override
  AuthenticateResultModel? authenticateResultModel;

  @override
  Future loginUser() async {
    accessTokenProvider!.authenticateModel = authenticateModel;
    authenticateResultModel = await accessTokenProvider!.loginAsync();
    if (authenticateResultModel!.shouldResetPassword! == true) {
      // TODO: Need to show change password
    }
    if (authenticateResultModel!.requiresTwoFactorVerification! == true) {
      // TODO: Redirect to two factor code view
    }
    await dataStorageProvider!.storeAuthenticateResult(authenticateResultModel!);

    authenticateModel!.password = null;
    var loginInfo = await sessionAppProvider!.getCurrentLoginInformations();
    await dataStorageProvider!.storeLoginInfomation(loginInfo);

    var lstPermission = await sessionAppProvider!.getUserPermissionsForEdit(authenticateResultModel!.userId ?? 0);
    await dataStorageProvider!.storeUserPermissionInfo(lstPermission.toList());
  }

  @override
  Future logout() async {
    accessTokenProvider!.logout();
    applicationContextProvider!.clearLoginInfo();
    dataStorageProvider!.clearSessionPeristance();
  }

  @override
  Future<bool> isUserLoggedIn() async {
    return await dataStorageProvider!.retrieveAuthenticateResult() != null;
  }
}