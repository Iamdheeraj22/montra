import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:montra/app/features/authentication/forget_password/email_sent_screen.dart';
import 'package:montra/app/features/authentication/forget_password/forget_password_screen.dart';
import 'package:montra/app/features/authentication/login/bloc/login_bloc.dart';
import 'package:montra/app/features/authentication/login/login_screen.dart';
import 'package:montra/app/features/authentication/sign_up/bloc/sign_up_bloc.dart';
import 'package:montra/app/features/authentication/sign_up/sign_up_screen.dart';
import 'package:montra/app/features/on_boarding/on_boarding_screen.dart';
import 'package:montra/app/features/splash_screen/splash_screen.dart';

class NavigationRoutes {
  NavigationRoutes._internal();
  static final NavigationRoutes _instance = NavigationRoutes._internal();
  factory NavigationRoutes() => _instance;
  static String previousRoute = '';
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    previousRoute = settings.name ?? '';
    switch (settings.name) {
      case SplashScreen.id:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const SplashScreen(),
        );
      case OnBoardingScreen.id:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const OnBoardingScreen(),
        );
      case LoginScreen.id:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => BlocProvider(
            create: (_) => LoginBloc(),
            child: const LoginScreen(),
          ),
        );
      case SignUpScreen.id:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => BlocProvider(
            create: (_) => SignUpBloc(),
            child: const SignUpScreen(),
          ),
        );
      case ForgetPasswordScreen.id:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const ForgetPasswordScreen(),
        );
      case EmailSentScreen.id:
        final email = settings.arguments as String;
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => EmailSentScreen(
            email: email,
          ),
        );
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}
