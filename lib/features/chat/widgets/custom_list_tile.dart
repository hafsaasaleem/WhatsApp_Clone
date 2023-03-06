// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:whatsapp_clone/common/extension/custom_theme_extension.dart';

class CustomListTile extends StatelessWidget {
  const CustomListTile({
    Key? key,
    required this.title,
    required this.leading,
    this.subtitle,
    this.trailing,
  }) : super(key: key);

  final String title;
  final IconData leading;
  final String? subtitle;
  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {},
      contentPadding: const EdgeInsets.fromLTRB(25, 5, 10, 5),
      leading: Icon(leading),
      title: Text(title),
      subtitle: subtitle != null
          ? Text(subtitle!,
              style: TextStyle(
                color: context.theme.greyColor,
              ))
          : null,
      trailing: trailing,
    );
  }
}
