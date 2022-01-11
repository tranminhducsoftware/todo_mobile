import 'package:todo_mobile/src/datas/models/auth/login_informations.dart';
import 'package:todo_mobile/src/datas/models/permission/permission_info.dart';

abstract class ISessionAppProvider {
  Future<LoginInformations> getCurrentLoginInformations();

  Future<UpdateUserSignInToken> updateUserSignInToken();

  Future<List<PermissionInfo>> getUserPermissionsForEdit(int id);

}
