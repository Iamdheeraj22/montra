import 'package:flutter/material.dart';
import 'package:montra/app/features/on_boarding/on_boarding_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  static const String id = '/home_page';
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Home Page'),
            TextButton(
                onPressed: () {
                  Navigator.pushNamedAndRemoveUntil(
                      context, OnBoardingScreen.id, (route) => false);
                },
                child: const Text('Logout'))
          ],
        ),
      ),
    );
  }
}
