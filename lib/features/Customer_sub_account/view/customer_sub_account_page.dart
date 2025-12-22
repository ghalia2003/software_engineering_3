import 'package:flutter/material.dart';
import 'package:flutter_application_12/core/utils/colors_theme.dart';
import 'package:flutter_application_12/features/Customer_sub_account/view/CustomerSubAccountWidgets/Customer_Drawewr.dart';
import 'package:flutter_application_12/features/Customer_sub_account/view/CustomerSubAccountWidgets/customer_sub_account_appbar_icon.dart';
import 'package:flutter_application_12/features/Customer_sub_account/view/CustomerSubAccountWidgets/customer_sub_account_appbar_title.dart';
import 'package:flutter_application_12/features/Customer_sub_account/view/CustomerSubAccountWidgets/customer_sub_account_list.dart';


class AccountsScreen extends StatelessWidget {
  const AccountsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsTheme.backgroundWhite,
      endDrawer: CustomDrawer(),
      appBar: AppBar(
        backgroundColor: ColorsTheme.primaryBlue,
        title: CustomerSubAccountAppbarTitle(),
        actions: [CustomerSubAccountAppbarIcon()],
      ),
      body: CustomerSubAccountList(),
    );
  }
}
