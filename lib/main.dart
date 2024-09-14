import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:montra/app/core/routes/navigation_routes.dart';
import 'package:montra/app/core/user_state/user_state_bloc.dart';
import 'package:montra/firebase_options.dart';

import 'app/features/splash_screen/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
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
      child: BlocProvider(
        create: (context) => UserStateBloc(),
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
      ),
    );
  }
}
