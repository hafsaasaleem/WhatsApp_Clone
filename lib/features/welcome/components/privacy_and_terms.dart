import 'package:flutter/material.dart';
import 'package:whatsapp_clone/common/extension/custom_theme_extension.dart';

class PrivacyAndTerms extends StatelessWidget {
  const PrivacyAndTerms({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        text: "Read our ",
        style: TextStyle(
          height: 1.5,
          color: context.theme.greyColor,
        ),
        children: [
          TextSpan(
            text: "Privacy Policy. ",
            style: TextStyle(
              color: context.theme.blueColor,
            ),
          ),
          const TextSpan(
            text: 'Tap "Agree and continue" to accept the ',
          ),
          TextSpan(
            text: "Terms of Service.",
            style: TextStyle(
              color: context.theme.blueColor,
            ),
          ),
        ],
      ),
    );
  }
}
