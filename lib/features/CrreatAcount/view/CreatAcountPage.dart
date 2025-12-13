import 'package:flutter/material.dart';


import 'package:flutter_application_12/features/CrreatAcount/view/wedjet/CustomAcountTypeCardBody.dart';
import 'package:flutter_application_12/features/CrreatAcount/view/wedjet/CustomAppBar.dart';

class CreatAcountPage extends StatelessWidget {
  const CreatAcountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

body:SingleChildScrollView(
  child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
      children: [
     CustomAppbar(),
CustomCardBody(),
       
      ],),
) ,
    );

  }
}