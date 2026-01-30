import 'package:flutter/material.dart';
import 'package:flutter_application_12/features/Customer_sub_account/controller/sub_account_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class CustomerSubAccountAppbarIcon extends StatelessWidget {
  const CustomerSubAccountAppbarIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
  
        Builder(
          builder: (ctx) {
            return IconButton(
              icon: const Icon(Icons.menu, color: Colors.white),
              onPressed: () {
                Scaffold.of(ctx).openEndDrawer();
              },
            );
          },
        ),

    
        IconButton(
          icon: const Icon(Icons.swap_horiz, color: Colors.white),
          tooltip: 'تحويل',
     onPressed: () async {
  final refreshed = await context.push<bool>('/transfer');

  if (refreshed == true && context.mounted) {
    context.read<SubAccountCubit>().loadHierarchy();  
  }
},

        ),
      ],
    );
  }
}
