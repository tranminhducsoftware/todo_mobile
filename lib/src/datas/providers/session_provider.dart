import 'package:dio/dio.dart';
import 'package:todo_mobile/src/constants/api_path.dart';
import 'package:todo_mobile/src/datas/models/auth/login_informations.dart';
import 'package:todo_mobile/src/datas/models/common/ajax_response.dart';
import 'package:todo_mobile/src/datas/models/permission/permission_info.dart';
import 'package:todo_mobile/src/utils/http_client_service.dart';

import 'interfaces/session_provider.dart';


class SessionAppProvider implements ISessionAppProvider {
  @override
  Future<LoginInformations> getCurrentLoginInformations() async {
    var client = await HttpClientService().createClient();
    var url = ApiPath.getCurrentLoginInformation;
    Response clientResult = await client.get(url);
    var ajaxResponse = AjaxResponse<LoginInformations>.fromJson(
        clientResult.data,
        (data) => LoginInformations.fromJson((data as Map<String, dynamic>)));
    return ajaxResponse.result!;
  }

  @override
  Future<UpdateUserSignInToken> updateUserSignInToken() async {
    var client = await HttpClientService().createClient();
    var clientResult = await client.put(ApiPath.updateUserSignInToken);
    var ajaxResponse = AjaxResponse<UpdateUserSignInToken>.fromJson(
        clientResult.data,
        (data) =>
            UpdateUserSignInToken.fromJson((data as Map<String, dynamic>)));
    return ajaxResponse.result!;
  }

  @override
  Future<List<PermissionInfo>> getUserPermissionsForEdit(int id) async {
    var lstPermission = <PermissionInfo>[];
    var client = await HttpClientService().createClient();
    var clientResult = await client
        .get(ApiPath.getUserPermissionsForEdit, queryParameters: {"id": id});
    var abpResponse = clientResult.data["result"]["permissions"];
    if (abpResponse == null) return lstPermission;

    abpResponse.forEach((data) {
      PermissionInfo permission =
          PermissionInfo.fromJson(data as Map<String, dynamic>);
      lstPermission.add(permission);
    });
    return lstPermission;
  }
}
