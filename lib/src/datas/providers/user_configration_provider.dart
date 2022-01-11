
import 'package:todo_mobile/src/constants/api_path.dart';
import 'package:todo_mobile/src/datas/models/common/ajax_response.dart';
import 'package:todo_mobile/src/datas/models/user/user_configuration.dart';
import 'package:todo_mobile/src/utils/http_client_service.dart';

import 'interfaces/user_configration_provider.dart';

class UserConfigurationProvider implements IUserConfigurationProvider {
  @override
  Future<UserConfiguration> getUserConfiguration() async {
    var httpClient = await HttpClientService().createClient();
    var clientResponse = await httpClient.get(ApiPath.abpUserConfigurationGetAll);
    var abpResponse = AjaxResponse<UserConfiguration>.fromJson(
        clientResponse.data,
            (data) => UserConfiguration.fromJson(data as Map<String, dynamic>));
    return abpResponse.result!;
  }
}
