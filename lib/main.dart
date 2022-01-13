import 'package:after_layout/after_layout.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:todo_mobile/src/datas/injection.dart';
import 'package:todo_mobile/src/datas/providers/interfaces/access_token_provider.dart';
import 'package:todo_mobile/src/datas/providers/interfaces/application_context_provider.dart';
import 'package:todo_mobile/src/datas/providers/interfaces/data_storage_provider.dart';
import 'package:todo_mobile/src/datas/providers/user_configration_provider.dart';
import 'package:todo_mobile/src/screens/simple_bloc_observer.dart';
import 'package:todo_mobile/src/screens/splash/splash_screen.dart';
import 'package:todo_mobile/src/utils/localization_helper.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() async {
  await configureDependencies();
  Bloc.observer = SimpleBlocObserver();

  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    systemNavigationBarIconBrightness: Brightness.light,
    statusBarIconBrightness: Brightness.light,
  ));
  runApp(const MyApp());

}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _MyApp();
}


class _MyApp extends State<MyApp> with AfterLayoutMixin<MyApp>  {

  initInfo() async {
    // Khai báo
    var dataStorageProvider = getIt.get<IDataStorageProvider>();
    var accessTokenProvider = getIt.get<IAccessTokenProvider>();
    var applicationContextProvider = getIt.get<IApplicationContextProvider>();
    var userConfigProvider = UserConfigurationProvider();
    accessTokenProvider.authenticateResult = await dataStorageProvider.retrieveAuthenticateResult();
    // Gán giá trị
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
      supportedLocales: const [
        Locale('en', 'US'),
        Locale('vi', ''),
      ],
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      title: 'Todo',
      theme: ThemeData(
        brightness: Brightness.light,
        appBarTheme: const AppBarTheme(
          systemOverlayStyle: SystemUiOverlayStyle.light,
        ),
      ),
      home: SplashScreen(),
    );
  }
}
