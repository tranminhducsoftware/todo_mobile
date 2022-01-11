import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:todo_mobile/src/config/app_config.dart';
import 'package:todo_mobile/src/datas/models/auth/authenticate_result_model.dart';
import 'package:todo_mobile/src/datas/models/auth/login_informations.dart';
import 'package:todo_mobile/src/datas/models/multi_tenancy/tenant_information.dart';
import 'package:todo_mobile/src/datas/models/permission/permission_info.dart';

import 'interfaces/data_storage_provider.dart';


class DataStorageProvider implements IDataStorageProvider {
  final storage = const FlutterSecureStorage();
  final options =
  const IOSOptions(accessibility: IOSAccessibility.first_unlock);

  @override
  Future storeAccessToken(String newAccessToken) async {
    var authenStr = await storage.read(
        key: DataStorageKey.currentSessionTokenInfo, iOptions: options);
    if (authenStr != null) {
      var authenResult =
      AuthenticateResultModel.fromJson(json.decode(authenStr));
      authenResult.accessToken = newAccessToken;
      authenStr = json.encode(authenResult.toJson());
      await storage.write(
          key: DataStorageKey.currentSessionTokenInfo, value: authenStr);
    }
  }

  @override
  Future storeAuthenticateResult(
      AuthenticateResultModel authenResultModel) async {
    await storage.write(
        key: DataStorageKey.currentSessionTokenInfo,
        value: json.encode(authenResultModel.toJson()),
        iOptions: options);
  }

  @override
  Future<AuthenticateResultModel?> retrieveAuthenticateResult() async {
    if (await storage.containsKey(
        key: DataStorageKey.currentSessionTokenInfo)) {
      var storedStr =
      await storage.read(key: DataStorageKey.currentSessionTokenInfo);
      if (storedStr == null) {
        return null;
      }
      return AuthenticateResultModel.fromJson(json.decode(storedStr));
    }
    return null;
  }

  @override
  Future<TenantInformation?> retrieveTenantInfo() async {
    if (await storage.containsKey(
        key: DataStorageKey.currentSessionTenantInfo)) {
      var storedStr = await storage.read(
          key: DataStorageKey.currentSessionTenantInfo, iOptions: options);
      if (storedStr == null) {
        return null;
      }
      return TenantInformation.fromJson(json.decode(storedStr));
    }
    return null;
  }

  @override
  Future<LoginInformations?> retrieveLoginInfo() async {
    if (await storage.containsKey(
        key: DataStorageKey.currentSessionLoginInfo)) {
      var storedStr = await storage.read(
          key: DataStorageKey.currentSessionLoginInfo, iOptions: options);
      if (storedStr == null) {
        return null;
      }
      return LoginInformations.fromJson(json.decode(storedStr));
    }
    return null;
  }

  @override
  Future<List<PermissionInfo>?> retrievePermissionInfo() async {
    if (await storage.containsKey(
        key: DataStorageKey.currentSessionUserPermission)) {
      var storedStr = await storage.read(
          key: DataStorageKey.currentSessionUserPermission, iOptions: options);
      if (storedStr == null) {
        return null;
      }
      var lstPermissionInfoJson = json.decode(storedStr) as List;
      List<PermissionInfo> lstPermissionInfo = lstPermissionInfoJson
          .map((permissionInfo) => PermissionInfo.fromJson(permissionInfo))
          .toList();

      return lstPermissionInfo;
    }
    return null;
  }

  @override
  void clearSessionPeristance() async {
    await storage.delete(key: DataStorageKey.currentSessionTokenInfo);
    await storage.delete(key: DataStorageKey.currentSessionTenantInfo);
    await storage.delete(key: DataStorageKey.currentSessionLoginInfo);
    await storage.delete(key: DataStorageKey.currentSessionUserPermission);
  }

  @override
  Future storeLoginInfomation(LoginInformations input) async {
    await storage.write(
        key: DataStorageKey.currentSessionLoginInfo,
        value: json.encode(input.toJson()),
        iOptions: options);
  }

  @override
  Future storeTenantInfo(TenantInformation input) async {
    await storage.write(
        key: DataStorageKey.currentSessionTenantInfo,
        value: json.encode(input.toJson()),
        iOptions: options);
  }

  @override
  Future storeUserPermissionInfo(List<PermissionInfo> input) async {
    var jsonValue = json.encode(input.map((element) => element.toJson()).toList());
    await storage.write(
        key: DataStorageKey.currentSessionUserPermission,
        value: jsonValue,
        iOptions: options);
  }

}