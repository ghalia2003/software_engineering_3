
import 'package:flutter_application_12/features/Auth/repo/AuthRepoImp.dart';
import 'package:flutter_application_12/features/ticket/repo/repo_imp_ticket.dart';
import 'package:flutter_application_12/features/ticket/repo/repo_ticker.dart';
import 'package:flutter_application_12/features/ticket/strategy/ticket_submit_strategy.dart.dart';

import 'package:get_it/get_it.dart';


final getIt = GetIt.instance;

void setupServiceLocator() {
getIt.registerSingleton<AuthRepoImpl>(AuthRepoImpl());

  getIt.registerSingleton<SupportTicketRepo>(
    SupportTicketRepoImpl(strategy: FormDataTicketStrategy()),
  );
}
