
import 'package:flutter_application_12/core/utils/local_notification.dart';

import 'package:flutter_application_12/features/Auth/repo/AuthRepoImp.dart';
import 'package:flutter_application_12/features/Customer_sub_account/repo/sub_account_repo.dart';
import 'package:flutter_application_12/features/Customer_sub_account/repo/sub_account_repo_impl.dart';
import 'package:flutter_application_12/features/Recommendations/repo/recommendations_repo.dart';
import 'package:flutter_application_12/features/Recommendations/repo/recommendations_repo_impl.dart';
import 'package:flutter_application_12/features/ticket/repo/repo_imp_ticket.dart';
import 'package:flutter_application_12/features/ticket/repo/repo_ticker.dart';
import 'package:flutter_application_12/features/ticket/strategy/ticket_submit_strategy.dart.dart';
import 'package:flutter_application_12/features/transfer/repo/transfer_repo.dart';
import 'package:flutter_application_12/features/transfer/repo/transfer_repo_impl..dart';

import 'package:get_it/get_it.dart';


final getIt = GetIt.instance;

void setupServiceLocator() {
getIt.registerSingleton<AuthRepoImpl>(AuthRepoImpl());

  getIt.registerSingleton<SupportTicketRepo>(
    SupportTicketRepoImpl(strategy: FormDataTicketStrategy()),
  );
  getIt.registerSingleton<SubAccountRepo>(SubAccountRepoImpl());
getIt.registerSingleton<RecommendationsRepo>(RecommendationsRepoImpl());

  getIt.registerSingleton<LocalNotificationService>(LocalNotificationService());
  getIt.registerLazySingleton<TransferRepo>(
  () => TransferRepoImpl(),
);

  // getIt.registerLazySingleton<TransferRepo>(() => TransferRepoImpl());
  // getIt.registerSingleton<NotificationService>(NotificationService());
}
