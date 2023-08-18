import 'package:get_it/get_it.dart';
import 'package:test_app_traff_apps/data/database_helper.dart';

final serviceLocator = GetIt.instance;

void setupDependencies() {
  serviceLocator.registerSingleton<DatabaseHelper>(DatabaseHelper.instance);
}
