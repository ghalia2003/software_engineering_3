
import 'package:flutter_application_12/features/Auth/repo/AuthRepoImp.dart';

import 'package:get_it/get_it.dart';


final getIt = GetIt.instance;

void setupServiceLocator() {
getIt.registerSingleton<AuthRepoImpl>(AuthRepoImpl());


}
