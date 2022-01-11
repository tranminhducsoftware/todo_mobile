import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:todo_mobile/src/datas/injection.dart';
import 'package:todo_mobile/src/datas/providers/interfaces/access_token_provider.dart';
import 'package:todo_mobile/src/datas/providers/interfaces/application_context_provider.dart';
import 'package:todo_mobile/src/datas/providers/interfaces/data_storage_provider.dart';
import 'package:todo_mobile/src/datas/providers/user_configration_provider.dart';
import 'package:todo_mobile/src/screens/splash/splash_screen.dart';

void main() async {
  await configureDependencies();
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    systemNavigationBarIconBrightness: Brightness.light,
    statusBarIconBrightness: Brightness.light,
  ));
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  initInfo() async {
    // khai bao
    var dataStorageProvider = getIt.get<IDataStorageProvider>();
    var accessTokenProvider = getIt.get<IAccessTokenProvider>();
    var applicationContextProvider = getIt.get<IApplicationContextProvider>();
    var userConfigProvider = UserConfigurationProvider();
    accessTokenProvider.authenticateResult =
    await dataStorageProvider.retrieveAuthenticateResult();
    // gan gia tri
    applicationContextProvider.load(
        await dataStorageProvider.retrieveTenantInfo(),
        await dataStorageProvider.retrieveLoginInfo());
    if (applicationContextProvider.configuration == null) {
      var userConfiguration = await userConfigProvider.getUserConfiguration();
      applicationContextProvider.configuration = userConfiguration;
    }
  }

  @override
  void afterFirstLayout(BuildContext context) => initInfo();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Todo',
      theme: ThemeData(
        brightness: Brightness.light,
        appBarTheme: const AppBarTheme(
          systemOverlayStyle: SystemUiOverlayStyle.light,
        ),
      ),
      home:  SplashScreen(),
    );
  }
}