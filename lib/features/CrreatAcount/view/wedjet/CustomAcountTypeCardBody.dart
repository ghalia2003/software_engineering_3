import 'package:flutter/material.dart';
import 'package:flutter_application_12/features/AcountInfo/model/AcountInfoModel.dart';
import 'package:flutter_application_12/features/CrreatAcount/view/wedjet/CustomAccountTypeCard%20.dart';
import 'package:go_router/go_router.dart';

class CustomCardBody extends StatelessWidget {
  const CustomCardBody({super.key});

  @override
  Widget build(BuildContext context) {
    return  Padding(
    padding: const EdgeInsets.all(16.0),
    child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children:[

    AccountTypeCard(
            title: 'Savings Account',
            subtitle: 'Monthly interest, ideal for saving.',
            icon: Icons.savings,
   onTap: () {
  context.push(
    '/account-info',
    extra: AccountType(
      name: "Savings Account",
      subtitle: "Monthly interest, ideal for saving.",
      interestRate: 2.0,
      withdrawLimit: 2000,
      depositLimit: 10000,
      monthlyFee: 10,
      terms: "You must keep minimum balance...\nNo overdraft allowed...",
    ),
  );
},

          ),
    SizedBox(
height: 12,
    ),
          AccountTypeCard(
            title: 'Checking Account',
            subtitle: 'For daily use and payments.',
            icon: Icons.account_balance_wallet,
            onTap: () {
              print("Checking Selected");
            },
          ), 


              SizedBox(
height: 12,
    ),
        AccountTypeCard(
            title: 'Loan Account',
            subtitle: 'Manage loans and installments.',
            icon: Icons.request_quote,
            onTap: () => print("Loan Selected"),
          ),

          SizedBox(height: 12),

          AccountTypeCard(
            title: 'Investment Account',
            subtitle: 'Higher returns with some risks.',
            icon: Icons.trending_up,
            onTap: () => print("Investment Selected"),
          ),
              SizedBox(
height: 12,
    ),
          AccountTypeCard(
            title: 'Checking Account',
            subtitle: 'For daily use and payments.',
            icon: Icons.account_balance_wallet,
            onTap: () {
              print("Checking Selected");
            },
          ), 

      ],
    ),

  );
  }
}