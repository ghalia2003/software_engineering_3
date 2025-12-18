
import 'package:flutter_application_12/core/utils/ServerLocater.dart';
import 'package:flutter_application_12/features/AcountInfo/model/AcountInfoModel.dart';
import 'package:flutter_application_12/features/AcountInfo/view/AcounteINfopage.dart';
import 'package:flutter_application_12/features/Auth/view/OtpScreen.dart';

import 'package:flutter_application_12/features/Auth/view/SignUpScreen.dart';
import 'package:flutter_application_12/features/Auth/view/SucssesOtp.dart';
import 'package:flutter_application_12/features/Auth/view/loginscreen.dart';
import 'package:flutter_application_12/features/ticket/controller/cubit/ticket_cubit.dart';
import 'package:flutter_application_12/features/ticket/repo/repo_ticker.dart';
import 'package:flutter_application_12/features/ticket/view/ticket.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:go_router/go_router.dart';


abstract class AppRouter {

static const signuppage='/signuppage';
static const Loginpage='/Loginpage';
static const Otppage='/Otppage';
static const SucessOtppage='/SucessOtppage';
static const CreateTicketpage='/CreateTicketScreen';
  static final router = GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(path: '/', builder: (context, state) => const SignUpscreen()),
         
      GoRoute(
        path: '/account-info',
        builder: (context, state) {
          final acc = state.extra as AccountType;
          return AccountInfoScreen(acc: acc);
        },
      ),
  GoRoute(path: '/Loginpage', builder: (context, state) => const loginscreen()),
  GoRoute(path: '/signuppage', builder: (context, state) => const SignUpscreen()),
    GoRoute(path: '/SucessOtppage', builder: (context, state) => const SuccessView()),
      GoRoute(path: '/Otppage', builder: (context, state) => const OTPscreen()),
GoRoute(
  path: '/CreateTicketScreen',
  builder: (context, state) => BlocProvider(
    create: (_) => CreateTicketCubit(getIt<SupportTicketRepo>()),
    child: const CreateTicketScreen(),
  ),
),

    ],
  );
}
