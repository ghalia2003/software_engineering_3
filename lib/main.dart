import 'package:flutter/material.dart';
import 'package:flutter_application_12/core/utils/ServerLocater.dart';
import 'package:flutter_application_12/core/utils/app_router.dart';
import 'package:flutter_application_12/features/Auth/controller/Otpcubit/otp_cubit.dart';
import 'package:flutter_application_12/features/Auth/controller/SignUpcubit/sign_up_cubit.dart';
import 'package:flutter_application_12/features/Auth/controller/logincubit/login_cubit.dart';
import 'package:flutter_application_12/features/Auth/repo/AuthRepoImp.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


void main() async {
    setupServiceLocator();  
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

        // BlocProvider(
        //   create: (context) => ResendotpCubit(getIt.get<AuthRepoImpl>()),
        // ),
        BlocProvider(
          create: (context) => LoginCubit(getIt.get<AuthRepoImpl>()),
        ),
      ],
      child:
    MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: AppRouter.router,
    ));
  }
}
