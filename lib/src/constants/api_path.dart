abstract class ApiPath {

  // mapSheet
  static const String mapSheetGetAll = "api/services/app/Dashboard/GetAggregateData";
  static const String project = "api/services/app/Project/GetAll?filter=&status=&mainAssignId=&year=2022&skipCount=0&maxResultCount=10";
  static const String work = "api/services/app/Work/GetAll";
  static const String projectStep = "api/services/app/ProjectStep/GetAll";

  // abp core
  static const String getCurrentLoginInformation = "api/services/app/Session/GetCurrentLoginInformations";

  static const String updateUserSignInToken = "api/services/app/Session/UpdateUserSignInToken";

  static const String getUserPermissionsForEdit = "api/services/app/User/GetUserPermissionsForEdit";

  static const String abpUserConfigurationGetAll = "AbpUserConfiguration/GetAll";

}