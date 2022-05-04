import 'package:get_it/get_it.dart';
import 'package:pos/services/app_service.dart';

GetIt dependencyLocator = GetIt.instance;

void setupDependencyLocator() {
  dependencyLocator.registerSingleton<AppService>(AppServiceImpletment());
}
