import 'package:flutter/material.dart';
import 'package:whatsapp_clone/common/extension/custom_theme_extension.dart';
import '../../../common/colors/coloors.dart';
import '../../../common/routes/routes.dart';
import '../../../common/widgets/custom_elevated_button.dart';
import '../components/language_button.dart';
import '../components/privacy_and_terms.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  navigateToLoginPage(context) {
    Navigator.of(context).pushNamedAndRemoveUntil(
      Routes.login,
      (route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              const SizedBox(height: 100),
              const Text(
                "Welcome to WhatsApp",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w900,
                  color: Coloors.greenLight,
                ),
              ),
              const SizedBox(height: 40),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Image.asset(
                  "assets/images/circle.png",
                  color: context.theme.circleImageColor,
                ),
              ),
              const SizedBox(height: 50),
              const PrivacyAndTerms(),
              const SizedBox(height: 15),
              CustomElevatedButton(
                text: "agree and continue",
                onPress: () => navigateToLoginPage(context),
              ),
              const SizedBox(height: 50),
              const LanguageButton(),
              const SizedBox(height: 15),
            ],
          ),
        ),
      ),
    );
  }
}
