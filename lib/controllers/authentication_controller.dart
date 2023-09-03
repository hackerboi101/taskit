import 'package:get/get.dart';
import 'package:pocketbase/pocketbase.dart';
import 'package:taskit/models/user_models.dart';
import 'package:taskit/views/home_page.dart';

class AuthenticationController extends GetxController {
  final pb = PocketBase('http://10.0.2.2:8090');
  Rx<Users?> currentUser = Rx<Users?>(null).obs.value;

  Future<void> signIn(String email, String password) async {
    try {
      await pb.collection('users').authWithPassword(email, password);
      final id = pb.authStore.model.id;
      final record = await pb.collection('users').getOne(id);

      final user = Users.fromPocketbase(record.data);
      currentUser.value = user;
      Get.snackbar(
        'Success',
        'Sign-in successful!',
        snackPosition: SnackPosition.BOTTOM,
      );
      Get.to(const HomePage());
    } catch (error) {
      Get.snackbar(
        'Error',
        'Sign-in failed. Please try again!',
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  void signOut() async {
    try {
      pb.authStore.clear();
      currentUser.value = null;
    } catch (error) {
      Get.snackbar(
        'Error',
        'Sign-out failed. Please try again!',
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }
}
