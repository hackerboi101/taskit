import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taskit/views/utils/bottom_navigation_bar.dart';
import 'package:taskit/controllers/authentication_controller.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final AuthenticationController authController =
      Get.put(AuthenticationController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(253, 240, 224, 1),
      appBar: AppBar(
        title: const Text('Home'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () => Scaffold.of(context).openDrawer(),
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName:
                  Text(authController.currentUser.value!.userName!.toString()),
              accountEmail:
                  Text(authController.currentUser.value!.email!.toString()),
              currentAccountPicture: CircleAvatar(
                backgroundImage: NetworkImage(
                    "http://taskit.pockethost.io/${authController.currentUser.value!.avatar!.toString()}"),
              ),
            ),
            ListTile(
              title: const Text('Account'),
              onTap: () {
                Get.toNamed('/account');
              },
            ),
          ],
        ),
      ),
      body: const SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [],
        ),
      ),
      bottomNavigationBar: BottomNavigation(),
    );
  }

  void print() {
    debugPrint(authController.currentUser.value!.avatar.toString());
  }
}
