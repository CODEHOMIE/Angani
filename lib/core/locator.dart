

import 'constants/export_files.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  //locator.registerLazySingleton(() => NavigationService());
  locator.registerLazySingleton(() => Api());
}