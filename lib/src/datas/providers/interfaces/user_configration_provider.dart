
import 'package:todo_mobile/src/datas/models/user/user_configuration.dart';

abstract class IUserConfigurationProvider {
  Future<UserConfiguration> getUserConfiguration();
}