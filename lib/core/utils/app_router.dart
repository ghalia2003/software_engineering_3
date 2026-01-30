
import 'package:flutter_application_12/core/utils/ServerLocater.dart';
import 'package:flutter_application_12/features/AcountInfo/model/AcountInfoModel.dart';
import 'package:flutter_application_12/features/AcountInfo/view/AcounteINfopage.dart';
import 'package:flutter_application_12/features/Auth/view/OtpScreen.dart';

import 'package:flutter_application_12/features/Auth/view/SignUpScreen.dart';
import 'package:flutter_application_12/features/Auth/view/SucssesOtp.dart';
import 'package:flutter_application_12/features/Auth/view/loginscreen.dart';
import 'package:flutter_application_12/features/Customer_sub_account/controller/sub_account_cubit.dart';
import 'package:flutter_application_12/features/Customer_sub_account/repo/sub_account_repo.dart';
import 'package:flutter_application_12/features/Customer_sub_account/view/customer_sub_account_page.dart';
import 'package:flutter_application_12/features/LoanPage/view/loan_form_page.dart';
import 'package:flutter_application_12/features/Recommendations/controller/cubit/recommendations_cubit.dart';
import 'package:flutter_application_12/features/Recommendations/repo/recommendations_repo.dart';
import 'package:flutter_application_12/features/Recommendations/view/recommendations_screen.dart';
import 'package:flutter_application_12/features/ticket/controller/cubit/ticket_cubit.dart';
import 'package:flutter_application_12/features/ticket/repo/repo_ticker.dart';
import 'package:flutter_application_12/features/ticket/view/ticket.dart';
import 'package:flutter_application_12/features/transfer/controller/cubit/transfer_cubit.dart';
import 'package:flutter_application_12/features/transfer/repo/transfer_repo.dart';
import 'package:flutter_application_12/features/transfer/view/transfer.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:go_router/go_router.dart';


abstract class AppRouter {

static const signuppage='/signuppage';
static const Loginpage='/Loginpage';
static const Otppage='/Otppage';
static const SucessOtppage='/SucessOtppage';
static const CreateTicketpage='/CreateTicketScreen';
static const AcountPage='/AcountPage';
static const recomindationPage='/recommendations';
static const loanPage = '/loanPage';
  static final router = GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(path: '/', builder: (context, state) => const loginscreen()),
         
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
GoRoute(
  path: '/AcountPage',
  builder: (context, state) => BlocProvider(
    create: (_) => SubAccountCubit(getIt<SubAccountRepo>())..loadHierarchy(),
    child: const AccountsScreen(),
  ),
),

GoRoute(
  path: '/recommendations',
  builder: (context, state) => BlocProvider(
    create: (_) => RecommendationsCubit(getIt<RecommendationsRepo>()),
    child: const RecommendationsScreen(),
  ),
),
GoRoute(
  path: '/transfer',
  builder: (context, state) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => SubAccountCubit(getIt<SubAccountRepo>())..loadHierarchy(),
        ),
        BlocProvider(
          create: (_) => TransferCubit(getIt<TransferRepo>()),
        ),
      ],
      child: const TransferScreen(),
    );
  },
),

GoRoute(path: loanPage, builder: (context, state) => const LoanFormPage()),
    ],
  );
}
