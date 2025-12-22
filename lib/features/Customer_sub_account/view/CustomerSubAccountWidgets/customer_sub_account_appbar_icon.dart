import 'package:flutter/material.dart';


class CustomerSubAccountAppbarIcon extends StatelessWidget {
  const CustomerSubAccountAppbarIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (ctx) {
        return IconButton(
          icon: const Icon(Icons.menu, color: Colors.white),
          onPressed: () {
            Scaffold.of(ctx).openEndDrawer(); // ✅ فتح السلايدر
          },
        );
      },
    );
}
}
        // showModalBottomSheet(
        //   context: context,
        //   shape: const RoundedRectangleBorder(
        //     borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        //   ),
        //   builder: (context) {
        //     return Padding(
        //       padding: EdgeInsets.all(Static.getwidth(context, 20)),
        //       child:
        //        Column(
        //         mainAxisSize: MainAxisSize.min,
        //         children: [
        //           Text("Add Account", style: Styles.headingMedium),

        //           SizedBox(height: Static.getheight(context, 15)),

        //           // // ⬆️ Add Main Account
        //           // ListTile(
        //           //   leading: Icon(
        //           //     Icons.account_balance,
        //           //     color: ColorsTheme.primaryBlue,
        //           //   ),
        //           //   title: Text("Add Main Account", style: Styles.bodyText),
        //           //   onTap: () {
        //           //     Navigator.pop(context);
        //           //     // TODO: انتقل لواجهة إضافة حساب رئيسي
        //           //   },
        //           // ),

        //           // // ⬇️ Add Sub Account
        //           // ListTile(
        //           //   leading: Icon(
        //           //     Icons.subdirectory_arrow_right,
        //           //     color: ColorsTheme.secondaryBlue,
        //           //   ),
        //           //   title: Text("Add Sub Account", style: Styles.bodyText),
        //           //   onTap: () {
        //           //     Navigator.pop(context);
        //           //     // TODO: افتح واجهة اختيار الحساب الرئيسي ثم إنشاء حساب فرعي
        //           //   },
        //           // ),

        //           SizedBox(height: Static.getheight(context, 5)),
        //         ],
        //       ),
        //     );
        //   },
        // );

