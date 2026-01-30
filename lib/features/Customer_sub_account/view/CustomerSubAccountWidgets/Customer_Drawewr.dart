import 'package:flutter/material.dart';
import 'package:flutter_application_12/core/utils/app_router.dart';
import 'package:go_router/go_router.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return   Drawer(
        child: SafeArea(
          child: ListView(
            padding: const EdgeInsets.all(12),
            children: [
              const ListTile(
                title: Text('Menu'),
              ),
              const Divider(),

              ListTile(
                leading: const Icon(Icons.support_agent),
                title: const Text('Support Ticket'),
                onTap: () {
                  Navigator.pop(context); // يغلق الدروار
                  context.go(AppRouter.CreateTicketpage);
                },
              ),

              ListTile(
                leading: const Icon(Icons.auto_awesome),
                title: const Text('Recommendations'),
                onTap: () {
                  Navigator.pop(context);
           context.go(AppRouter.recomindationPage);
                },
              ),
              ListTile(
              leading: const Icon(Icons.auto_awesome),
              title: const Text('Loan'),
              onTap: () {
                Navigator.pop(context);
                context.go(AppRouter.loanPage);
              },
            ),
            ],
          ),
        ),
      );

  }
}