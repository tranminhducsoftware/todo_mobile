class AbpConfig {
  static const hostUrl = "https://todo.368up.com/";
  static const profileHostUrl =
      hostUrl + "Profile/GetProfilePictureByUser?userId=";
  static const userAgent = "AbpApiClient";
  static const tenantResolveKey = "Abp.TenantId";
  static const loginUrlSegment = "api/TokenAuth/Authenticate";
  static const refreshTokenUrlSegment = "api/TokenAuth/RefreshToken";
  static const languageKey = ".AspNetCore.Culture";
  static const appName = "ZeroBase-App";
  static const languageSource = "Zero";
}

class DataStorageKey {
  static const currentSessionTokenInfo = "CurrentSession.TokenInfo";
  static const currentSessionLoginInfo = "CurrentSession.LoginInfo";
  static const currentSessionTenantInfo = "CurrentSession.TenantInfo";
  static const currentSessionUserPermission = "CurrentSession.UserPermission";
}

class Secrets {
  // Add your Google Maps API Key here
  static const API_KEY = 'AIzaSyBnjnTngaW4oyuttaNpI6ekSeMnceoUxPE';
}
