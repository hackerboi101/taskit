import 'package:taskit/views/home_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taskit/controllers/country_controller.dart';
import 'package:pocketbase/pocketbase.dart';

class RegisterController extends GetxController {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final RxBool agreeToTerms = false.obs;
  final RxInt rewardPoint = 0.obs;
  final RxInt cash = 0.obs;
  final RxInt contributionSuccessCount = 0.obs;

  final CountryController countryController = Get.put(CountryController());

  final pb = PocketBase('http://10.0.2.2:8090');

  String? _phoneNumber; // Store the phoneNumber as a class-level variable

  Future<void> registerUser() async {
    try {
      final body = <String, dynamic>{
        "username": userNameController.text,
        "email": emailController.text,
        "emailVisibility": false,
        "password": passwordController.text,
        "passwordConfirm": confirmPasswordController.text,
        "name": nameController.text,
        "number": _phoneNumber,
      };

      await pb.collection('users').create(body: body);
    } catch (e) {
      Get.snackbar(
        'Error',
        'Failed to register user: $e',
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  Future<void> signUp() async {
    try {
      // Get the selected country code and phone number
      _phoneNumber = countryController.selectedCountry.value!.code +
          phoneNumberController.text.trim();

      await registerUser();

      // Clear form fields after successful sign-up
      nameController.clear();
      userNameController.clear();
      emailController.clear();
      passwordController.clear();
      confirmPasswordController.clear();
      phoneNumberController.clear();

      Get.snackbar(
        'Success',
        'Sign-up successful!',
        snackPosition: SnackPosition.BOTTOM,
      );

      Get.to(() => const HomePage());
    } catch (e) {
      Get.snackbar(
        'Error',
        'Sign-up failed. Please try again. $e',
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  @override
  void onClose() {
    // Clean up resources
    nameController.dispose();
    userNameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    phoneNumberController.dispose();
    super.onClose();
  }
}
