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
                  Text(authController.currentUser.value!.userName.toString()),
              accountEmail:
                  Text(authController.currentUser.value!.email.toString()),
              currentAccountPicture: CircleAvatar(
                backgroundImage: authController.currentUser.value!.avatar ==
                        null
                    ? const NetworkImage(
                        "https://th.bing.com/th/id/R.fa0ca630a6a3de8e33e03a009e406acd?rik=UOMXfynJ2FEiVw&riu=http%3a%2f%2fwww.clker.com%2fcliparts%2ff%2fa%2f0%2fc%2f1434020125875430376profile.png&ehk=73x7A%2fh2HgYZLT1q7b6vWMXl86IjYeDhub59EZ8hF14%3d&risl=&pid=ImgRaw&r=0")
                    : NetworkImage(
                        "http://taskit.pockethost.io/${authController.currentUser.value!.avatar.toString()}"),
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
