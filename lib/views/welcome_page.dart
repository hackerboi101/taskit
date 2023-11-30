import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taskit/views/login_page.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(253, 240, 224, 1),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(
              height: 100.0,
            ),
            const Text(
              'Welcome to Taskit',
              style: TextStyle(
                fontSize: 32.0,
                fontWeight: FontWeight.bold,
                color: Color.fromRGBO(254, 95, 73, 1),
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 30.0,
            ),
            const Text(
              'Taskit is a simple task management app that helps you keep track of your tasks.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16.0,
                color: Color.fromRGBO(97, 97, 97, 1),
              ),
            ),
            const SizedBox(
              height: 50.0,
            ),
            Image.asset(
              'assets/images/Hello.jpg',
              height: 300.0,
              fit: BoxFit.fitWidth,
            ),
            const SizedBox(
              height: 50.0,
            ),
            ElevatedButton(
              onPressed: () {
                Get.to(LoginPage());
              },
              style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all(Colors.white),
                backgroundColor: MaterialStateProperty.all(
                  const Color.fromRGBO(41, 171, 226, 1),
                ),
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
              child: const Text('LET\'S GO'),
            ),
          ],
        ),
      ),
    );
  }
}
