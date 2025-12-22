import 'package:flutter/material.dart';
import 'package:flutter_application_12/core/utils/app_router.dart';
import 'package:flutter_application_12/core/wedjet/CustomAppBar.dart';

import 'package:flutter_application_12/features/Recommendations/view/CustomWedjet/custom_list_card.dart';
import 'package:flutter_application_12/features/Recommendations/view/CustomWedjet/customer_recomindation_appbar_icon.dart';
import 'package:flutter_application_12/features/Recommendations/view/CustomWedjet/customer_recomindation_appbar_title.dart';
import 'package:go_router/go_router.dart';


class RecommendationsScreen extends StatelessWidget {
  const RecommendationsScreen({super.key});







  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
                    leading: 
           
                                 CustomAppBar(
              bottomPadding:0,

                onTap: () {
  context.pushReplacement(AppRouter.AcountPage);
},                 ),
        title:CustomerRecomindationAppbarTitle(),
        actions: [
RecomindationAppBarIcon(),
        ],
      ),
      body: listofCard(),
    );
  }
}
