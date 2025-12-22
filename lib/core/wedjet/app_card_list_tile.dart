import 'package:flutter/material.dart';

class AppCardListTile extends StatelessWidget {
  final Widget? leading;
  final Widget title;
  final Widget? subtitle;
  final Widget? trailing;
  final EdgeInsetsGeometry margin;
  final EdgeInsetsGeometry contentPadding;
  final VoidCallback? onTap;

  const AppCardListTile({
    super.key,
    this.leading,
    required this.title,
    this.subtitle,
    this.trailing,
    this.onTap,
    this.margin = const EdgeInsets.only(bottom: 12),
    this.contentPadding =
        const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: margin,
      child: ListTile(
        contentPadding: contentPadding,
        leading: leading,
        title: title,
        subtitle: subtitle,
        trailing: trailing,
        onTap: onTap,
      ),
    );
  }
}
