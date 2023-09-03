import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taskit/controllers/authentication_controller.dart';
import 'package:taskit/views/register_page.dart';

class LoginPage extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final RxBool rememberMe = false.obs;
  final RxBool passwordSeen = false.obs;

  final AuthenticationController authController =
      Get.put(AuthenticationController());

  LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(253, 240, 224, 1),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 180),
              const Text(
                'Sign In',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color.fromRGBO(97, 97, 97, 1),
                ),
              ),
              const SizedBox(height: 25),
              TextField(
                controller: emailController,
                decoration: InputDecoration(
                  hintText: 'Email',
                  filled: true,
                  fillColor: Colors.grey[200],
                  border: const OutlineInputBorder(
                    borderSide: BorderSide.none,
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                    vertical: 12.0,
                    horizontal: 12.0,
                  ),
                ),
              ),
              const SizedBox(height: 15),
              Obx(
                () => TextField(
                  controller: passwordController,
                  obscureText: !passwordSeen.value,
                  decoration: InputDecoration(
                    hintText: 'Password',
                    filled: true,
                    fillColor: Colors.grey[200],
                    border: const OutlineInputBorder(
                      borderSide: BorderSide.none,
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                      vertical: 12.0,
                      horizontal: 12.0,
                    ),
                    suffixIcon: IconButton(
                      icon: Icon(
                        passwordSeen.value
                            ? Icons.visibility
                            : Icons.visibility_off,
                      ),
                      onPressed: () => passwordSeen.toggle(),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Obx(
                          () => SizedBox(
                            height: 22,
                            width: 22,
                            child: Checkbox(
                              value: rememberMe.value,
                              onChanged: (value) => rememberMe.value = value!,
                              activeColor: Colors.black,
                            ),
                          ),
                        ),
                        const SizedBox(width: 5),
                        const Text(
                          'Remember me',
                          style: TextStyle(
                            color: Color.fromRGBO(97, 97, 97, 1),
                          ),
                        ),
                      ],
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: const Text(
                        'Forget Password',
                        style: TextStyle(
                          color: Color.fromRGBO(41, 171, 226, 1),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    authController.signIn(
                      emailController.text,
                      passwordController.text,
                    );
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
                  child: const Text(
                    'Sign In',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 120),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Don't have an account?",
                    style: TextStyle(
                      color: Color.fromRGBO(97, 97, 97, 1),
                    ),
                  ),
                  const SizedBox(width: 4),
                  InkWell(
                    onTap: () => Get.to(RegisterPage()),
                    child: const Text(
                      'Sign Up',
                      style: TextStyle(
                        color: Color.fromRGBO(41, 171, 226, 1),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
