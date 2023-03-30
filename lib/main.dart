import 'package:chennai_fab_lite/controllers/util_controllers.dart';
import 'package:chennai_fab_lite/views/login/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'controllers/settings_controller.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) => SettingsController()),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        navigatorKey: navigatorKey,
        title: 'Chennai fab',
        theme: ThemeData(
          primarySwatch: UtilControllers.mainColors,
        ),
        home: LoginScreen());
  }
}
