
import 'package:todo_mobile/src/datas/models/auth/login_informations.dart';
import 'package:todo_mobile/src/datas/models/localization/language_info.dart';
import 'package:todo_mobile/src/datas/models/multi_tenancy/tenant_information.dart';
import 'package:todo_mobile/src/datas/models/user/user_configuration.dart';

import 'interfaces/application_context_provider.dart';

class ApplicationContextProvider implements IApplicationContextProvider {
  TenantInformation? _currentTenant;

  @override
  TenantInformation? get currentTenant => _currentTenant;

  LoginInformations? _loginInfo;

  @override
  LoginInformations? get loginInfo => _loginInfo;

  @override
  UserConfiguration? configuration;

  @override
  LanguageInfo? currentLanguage;

  @override
  void setAsTenant(int tenantId, String tenancyName) {
    if (tenancyName.isNotEmpty) {
      _currentTenant = TenantInformation(tenantId, tenancyName);
    }
  }

  @override
  void clearLoginInfo() {
    _loginInfo = null;
  }

  @override
  void setLoginInfo(LoginInformations loginInfo) {
    _loginInfo = loginInfo;
  }

  @override
  void setAsHost() {
    _currentTenant = null;
  }

  @override
  void load(TenantInformation? currentTenant, LoginInformations? loginInfo) {
    _currentTenant = currentTenant;
    _loginInfo = loginInfo;
  }

}