import 'package:get_it/get_it.dart';
import 'package:todo_mobile/src/datas/providers/access_token_provider.dart';
import 'package:todo_mobile/src/datas/providers/application_context_provider.dart';
import 'package:todo_mobile/src/datas/providers/dashboard_provider.dart';
import 'package:todo_mobile/src/datas/providers/data_storage_provider.dart';
import 'package:todo_mobile/src/datas/providers/interfaces/access_token_provider.dart';
import 'package:todo_mobile/src/datas/providers/interfaces/application_context_provider.dart';
import 'package:todo_mobile/src/datas/providers/interfaces/dashboard_provider.dart';
import 'package:todo_mobile/src/datas/providers/interfaces/data_storage_provider.dart';
import 'package:todo_mobile/src/datas/providers/interfaces/permission_manager_provider.dart';
import 'package:todo_mobile/src/datas/providers/interfaces/project_provider.dart';
import 'package:todo_mobile/src/datas/providers/interfaces/session_provider.dart';
import 'package:todo_mobile/src/datas/providers/interfaces/user_configration_provider.dart';
import 'package:todo_mobile/src/datas/providers/interfaces/work_provider.dart';
import 'package:todo_mobile/src/datas/providers/permission_manager_provider.dart';
import 'package:todo_mobile/src/datas/providers/project_provider.dart';
import 'package:todo_mobile/src/datas/providers/session_provider.dart';
import 'package:todo_mobile/src/datas/providers/user_configration_provider.dart';
import 'package:todo_mobile/src/datas/providers/work_provider.dart';
import 'package:todo_mobile/src/datas/repositories/account_repository.dart';
import 'package:todo_mobile/src/datas/repositories/dashboard_repository.dart';
import 'package:todo_mobile/src/datas/repositories/interfaces/account_repository.dart';
import 'package:todo_mobile/src/datas/repositories/interfaces/dashboard_repository.dart';
import 'package:todo_mobile/src/datas/repositories/interfaces/project_repository.dart';
import 'package:todo_mobile/src/datas/repositories/interfaces/work_repository.dart';
import 'package:todo_mobile/src/datas/repositories/project_repository.dart';
import 'package:todo_mobile/src/datas/repositories/work_repository.dart';

final getIt = GetIt.instance;

configureDependencies() async {
  // TODO: đăng kí các dependency trong này
  // Provider
  getIt
      .registerLazySingleton<IDataStorageProvider>(() => DataStorageProvider());
  getIt.registerLazySingleton<IApplicationContextProvider>(
      () => ApplicationContextProvider());
  getIt
      .registerLazySingleton<IAccessTokenProvider>(() => AccessTokenProvider());
  getIt.registerLazySingleton<ISessionAppProvider>(() => SessionAppProvider());
  getIt.registerLazySingleton<IUserConfigurationProvider>(
      () => UserConfigurationProvider());
  getIt.registerLazySingleton<IPermissionManagerProvider>(
      () => PermissionManagerProvider());
  getIt.registerLazySingleton<IDashboardProvider>(() => DashboardProvider());
  getIt.registerLazySingleton<IProjectProvider>(() => ProjectProvider());
  getIt.registerLazySingleton<IWorkProvider>(() => WorkProvider());

  // Repository
  getIt.registerFactory<IAccountRepository>(() => AccountRepository());
  getIt.registerFactory<IDashboardRepository>(() => DashboardRepository());
  getIt.registerFactory<IProjectRepository>(() => ProjectRepository());
  getIt.registerFactory<IWorkRepository>(() => WorkRepository());
}
