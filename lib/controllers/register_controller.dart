import 'package:taskit/controllers/authentication_controller.dart';
import 'package:taskit/models/user_models.dart';
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

  final CountryController countryController = Get.put(CountryController());
  final AuthenticationController authController =
      Get.put(AuthenticationController());

  final pb = PocketBase('https://taskit.pockethost.io');

  final RxString id = ''.obs;

  String? _phoneNumber; // Store the phoneNumber as a class-level variable

  Future<void> registerUser() async {
    try {
      final body = <String, dynamic>{
        "username": userNameController.text,
        "email": emailController.text,
        "emailVisibility": true,
        "password": passwordController.text,
        "passwordConfirm": confirmPasswordController.text,
        "name": nameController.text,
        "number": _phoneNumber,
      };

      final RecordModel record =
          await pb.collection('users').create(body: body);

      final user = Users.fromPocketbase(record.data);
      authController.currentUser.value = user;
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
