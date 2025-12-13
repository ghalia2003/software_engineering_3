import 'package:flutter/material.dart';

import 'package:flutter_application_12/features/AcountInfo/model/AcountInfoModel.dart';
import 'package:flutter_application_12/features/AcountInfo/view/wedjet/AcountInfoAppBar.dart';
import 'package:flutter_application_12/features/AcountInfo/view/wedjet/AcountInfoButtom.dart';
import 'package:flutter_application_12/features/AcountInfo/view/wedjet/AcountInfoText.dart';



class AccountInfoScreen extends StatefulWidget {
  final AccountType acc; 

  const AccountInfoScreen({super.key, required this.acc});

  @override
  State<AccountInfoScreen> createState() => _AccountInfoScreenState();
}

class _AccountInfoScreenState extends State<AccountInfoScreen> {
  bool agreed = false;

  @override
  Widget build(BuildContext context) {
    final acc = widget.acc;   

    return Scaffold(
   
      body: SingleChildScrollView(
        child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
     
        children: [
          
             CustomAppbarAcountInfo(),
        AcountInfoText(acc: acc,),
         AcountInfoButoom(),
                    ],
                  ),
          ),
          
    );
  }
}
