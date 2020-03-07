
import 'package:get_it/get_it.dart';

import 'package:flutter_template_project/core/services/navigation_service.dart';
import 'package:flutter_template_project/core/services/firebase_auth_service.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => NavigationService());
  locator.registerLazySingleton(() => FirebaseAuthService());
}
