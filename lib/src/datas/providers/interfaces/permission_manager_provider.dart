abstract class IPermissionManagerProvider {
  Future<bool> checkPermission(String permissionName);
}