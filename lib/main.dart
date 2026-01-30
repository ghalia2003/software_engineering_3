import 'package:flutter/material.dart';
import 'package:flutter_application_12/core/utils/ServerLocater.dart';
import 'package:flutter_application_12/core/utils/app_router.dart';
import 'package:flutter_application_12/core/utils/local_notification.dart';
import 'package:flutter_application_12/core/utils/notifications/local_notification_observer.dart';
import 'package:flutter_application_12/core/utils/notifications/singlr_servese.dart';

import 'package:flutter_application_12/features/Auth/controller/Otpcubit/otp_cubit.dart';
import 'package:flutter_application_12/features/Auth/controller/SignUpcubit/sign_up_cubit.dart';
import 'package:flutter_application_12/features/Auth/controller/logincubit/login_cubit.dart';
import 'package:flutter_application_12/features/Auth/repo/AuthRepoImp.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  setupServiceLocator();

  await LocalNotificationService().init();

  final sp = await SharedPreferences.getInstance();
  final token = sp.getString('token');


  final notificationService = NotificationService();
  notificationService.subscribe(LocalNotificationObserver());


  if (token != null && token.isNotEmpty) {
    await notificationService.startConnection(token);
  } else {
    print('⚠️ No token found yet. SignalR will start after login.');
  }

  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MultiBlocProvider(
      providers: [
      
        BlocProvider(
          create: (context) => SignupCubit
          (getIt.get<AuthRepoImpl>()),
        ),
        BlocProvider(create: (context) => OtpCubit(getIt.get<AuthRepoImpl>())),

     
   
        BlocProvider(
          create: (context) => LoginCubit(getIt.get<AuthRepoImpl>()),
        ),
      ],
      child:
    MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: AppRouter.router,


       theme: ThemeData(
          scaffoldBackgroundColor: const Color(0xFFF5F5F5),

      
          appBarTheme: const AppBarTheme(
            backgroundColor: Color(0xFFF5F5F5),
            elevation: 0,
            centerTitle: false,
          ),),

    ));
  }
}
