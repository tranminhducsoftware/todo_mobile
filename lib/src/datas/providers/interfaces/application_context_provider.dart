

import 'package:todo_mobile/src/datas/models/auth/login_informations.dart';
import 'package:todo_mobile/src/datas/models/localization/language_info.dart';
import 'package:todo_mobile/src/datas/models/multi_tenancy/tenant_information.dart';
import 'package:todo_mobile/src/datas/models/user/user_configuration.dart';

abstract class IApplicationContextProvider {
  TenantInformation? _currentTenant;

  TenantInformation? get currentTenant => _currentTenant;

  LoginInformations? _loginInfo;

  LoginInformations? get loginInfo => _loginInfo;

  UserConfiguration? configuration;

  LanguageInfo? currentLanguage;


  void clearLoginInfo();

  void setLoginInfo(LoginInformations loginInfo);

  void setAsHost();

  void setAsTenant(int tenantId, String tenancyName);

  void load(TenantInformation? currentTenant, LoginInformations? loginInfo);
}