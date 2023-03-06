import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'common/apptheme/dark_theme.dart';
import 'common/apptheme/light_theme.dart';
import 'common/routes/routes.dart';
import 'features/auth/controller/auth_controller.dart';
import 'features/home/pages/home_page.dart';
import 'features/welcome/pages/welcome_page.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: lightTheme(),
      darkTheme: darkTheme(),
      title: 'WhatsApp Me',
      onGenerateRoute: Routes.onGenerateRoute,
      // home: const HomePage(),
      home: ref.watch(userInfoAuthProvider).when(
            data: (user) {
              FlutterNativeSplash.remove();
              if (user == null) return const WelcomePage();
              return const HomePage();
            },
            error: (error, trace) {
              return const Scaffold(
                body: Center(
                  child: Text(
                    "Something wrong happened!",
                  ),
                ),
              );
            },
            loading: () => const SizedBox(),
          ),
    );
  }
}
