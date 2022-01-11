import 'package:get_it/get_it.dart';

import 'interfaces/data_storage_provider.dart';
import 'interfaces/permission_manager_provider.dart';

class PermissionManagerProvider implements IPermissionManagerProvider {
  IDataStorageProvider? dataStorageProvider;

  PermissionManagerProvider() {
    var getIt = GetIt.I;
    dataStorageProvider = getIt.get<IDataStorageProvider>();
  }

  @override
  Future<bool> checkPermission(String? permissionName) async {
    var listUserPermission = await dataStorageProvider!.retrievePermissionInfo();
    if (listUserPermission == null ||
        listUserPermission.isEmpty ||
        permissionName == null) return false;

    for (var element in listUserPermission) {
      if (element.name == permissionName) return true;
    }
    return false;
  }
}