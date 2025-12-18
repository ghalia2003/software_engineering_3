import 'package:flutter/material.dart';
import 'package:flutter_application_12/core/utils/app_router.dart';

import 'package:flutter_application_12/core/utils/style.dart';

import 'package:flutter_application_12/core/wedjet/CustomAppBar.dart';

import 'package:flutter_application_12/features/ticket/view/ticket_body.dart';

import 'package:go_router/go_router.dart';


class CreateTicketScreen extends StatefulWidget {
  const CreateTicketScreen({super.key});

  @override
  State<CreateTicketScreen> createState() => _CreateTicketScreenState();
}

class _CreateTicketScreenState extends State<CreateTicketScreen> {




  @override
  Widget build(BuildContext context) {


        return 
        Scaffold(
     
          appBar: AppBar(
    
            leading: 
           
                                 CustomAppBar(
              bottomPadding:0,
                     onTap: () {
                context.go(AppRouter.Loginpage);
              },
                                 ),
               title:const  Text('Support Ticket',
                style: Styles.headingLarge),
          
              
               



          ),
          body: TicketBody(),
          
    
                
              
            
          
            
        );

  }
}
