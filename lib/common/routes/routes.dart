import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import '../../features/auth/pages/login_page.dart';
import '../../features/auth/pages/user_info_page.dart';
import '../../features/auth/pages/verification_page.dart';
import '../../features/chat/pages/chat_page.dart';
import '../../features/chat/pages/profile_page.dart';
import '../../features/contact/pages/contact_page.dart';
import '../../features/home/pages/home_page.dart';
import '../../features/welcome/pages/welcome_page.dart';
import '../models/user_model.dart';

class Routes {
  static const String welcome = "Welcome";
  static const String login = "login";
  static const String verification = "verification";
  static const String userinfo = "user-info";
  static const String home = "home";
  static const String contact = "contact";
  static const String chat = "chat";
  static const String profile = "profile";

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case welcome:
        return MaterialPageRoute(
          builder: ((context) => const WelcomePage()),
        );
      case login:
        return MaterialPageRoute(
          builder: ((context) => const LoginPage()),
        );
      case verification:
        final Map args = settings.arguments as Map;
        return MaterialPageRoute(
          builder: ((context) => VerificationPage(
                phoneNumber: args['phoneNumber'],
                smsCodeId: args['smsCodeId'],
              )),
        );
      case userinfo:
        final String? profileImageUrl = settings.arguments as String?;
        return MaterialPageRoute(
          builder: ((context) => UserInfoPage(
                profileImageUrl: profileImageUrl,
              )),
        );
      case home:
        return MaterialPageRoute(
          builder: ((context) => const HomePage()),
        );
      case contact:
        return MaterialPageRoute(
          builder: ((context) => const ContactPage()),
        );
      case chat:
        final UserModel user = settings.arguments as UserModel;
        return MaterialPageRoute(
          builder: ((context) => ChatPage(user: user)),
        );
      case profile:
        final UserModel user = settings.arguments as UserModel;
        return PageTransition(
          child: ProfilePage(user: user),
          type: PageTransitionType.fade,
          duration: const Duration(milliseconds: 800),
        );

      default:
        return MaterialPageRoute(
          builder: ((context) => const Scaffold(
                body: Center(
                  child: Text("No Page Route Provided"),
                ),
              )),
        );
    }
  }
}
