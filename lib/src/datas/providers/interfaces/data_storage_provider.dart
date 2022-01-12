import 'package:todo_mobile/src/datas/models/auth/authenticate_result_model.dart';
import 'package:todo_mobile/src/datas/models/auth/login_informations.dart';
import 'package:todo_mobile/src/datas/models/multi_tenancy/tenant_information.dart';
import 'package:todo_mobile/src/datas/models/permission/permission_info.dart';

abstract class IDataStorageProvider {
  Future storeAccessToken(String newAccessToken);

  Future storeAuthenticateResult(AuthenticateResultModel authenResultModel);

  Future<AuthenticateResultModel?> retrieveAuthenticateResult();

  Future<LoginInformations?> retrieveLoginInfo();

  Future<TenantInformation?> retrieveTenantInfo();

  Future<List<PermissionInfo>?> retrievePermissionInfo();

  void clearSessionPeristance();

  Future storeLoginInfomation(LoginInformations input);

  Future storeTenantInfo(TenantInformation input);

  Future storeUserPermissionInfo(List<PermissionInfo> input);
}
