import 'package:flutter/material.dart';
import 'package:montra/app/core/routes/navigation_routes.dart';

import 'app/features/splash_screen/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus &&
            currentFocus.focusedChild != null) {
          currentFocus.focusedChild!.unfocus();
        }
      },
      child: MaterialApp(
        title: 'Montra',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        themeMode: ThemeMode.light,
        home: const SplashScreen(),
        onGenerateRoute: NavigationRoutes.onGenerateRoute,
        builder: (context, child) {
          return Scaffold(
            body: child,
          );
        },
      ),
    );
  }
}
