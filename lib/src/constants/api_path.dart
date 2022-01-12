abstract class ApiPath {
  //land map
  static const String getLandsByFramer = "api/services/app/LandMapPublic/GetLandsByFramer";
  static const String getLandsById = "api/services/app/LandMapPublic/GetLandsById";

  static const String getFarmerInfoByFilter = "api/services/app/LandMapPublic/GetFarmerInfoByFilter";
  static const String getAllInfoFarmerById = "api/services/app/LandMapPublic/GetAllInfoFarmerById";

  static const String getAllCity = "api/services/app/LandMapPublic/GetPagedCities";
  static const String getAllDistrictByCity = "api/services/app/LandMapPublic/GetPagedDistricts";
  static const String getAllWardByDistrict = "api/services/app/LandMapPublic/GetPagedWards";
  // land

  static const String landGetAll ="api/services/app/Land/GetAll";
  static const String getLandForEdit = "api/services/app/Land/GetLandForEdit";

  // farmer
  static const String farmerGetAll = "api/services/app/Farmer/GetAll";
  static const String getFarmerForEdit = "api/services/app/Farmer/GetFarmerForEdit";

  // mapSheet
  static const String mapSheetGetAll = "api/services/app/Dashboard/GetAggregateData";
  static const String getMapSheetForEdit = "api/services/app/MapSheet/GetMapSheetForEdit";

  // abp core
  static const String getCurrentLoginInformation = "api/services/app/Session/GetCurrentLoginInformations";

  static const String updateUserSignInToken = "api/services/app/Session/UpdateUserSignInToken";

  static const String getUserPermissionsForEdit = "api/services/app/User/GetUserPermissionsForEdit";

  static const String abpUserConfigurationGetAll = "AbpUserConfiguration/GetAll";

}