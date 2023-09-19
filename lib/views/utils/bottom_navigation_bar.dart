import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taskit/views/calendar_page.dart';
import 'package:taskit/views/home_page.dart';
import 'package:taskit/views/my_tasks_page.dart';

class BottomNavigationController extends GetxController {
  final RxInt selectedIndex = 0.obs;

  void onItemTapped(int index) {
    selectedIndex.value = index;
    if (index == 0) {
      Get.to(HomePage());
    } else if (index == 1) {
      Get.to(const MyTasksPage());
    } else if (index == 2) {
      Get.to(const CalendarPage());
    }
  }
}

class BottomNavigation extends StatelessWidget {
  final BottomNavigationController controller =
      Get.put(BottomNavigationController());

  BottomNavigation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.0),
          topRight: Radius.circular(20.0),
        ),
        color: Color.fromRGBO(37, 47, 64, 1),
      ),
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20.0),
          topRight: Radius.circular(20.0),
        ),
        child: BottomNavigationBar(
          currentIndex: controller.selectedIndex.value,
          onTap: controller.onItemTapped,
          items: [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home_outlined,
                color: controller.selectedIndex.value == 0
                    ? const Color.fromARGB(255, 43, 114, 105)
                    : const Color.fromRGBO(128, 147, 202, 1),
              ),
              label: 'Home',
              activeIcon: const Icon(
                Icons.home_outlined,
                color: Color.fromARGB(255, 43, 114, 105),
              ),
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.task_outlined,
                color: controller.selectedIndex.value == 1
                    ? const Color.fromARGB(255, 43, 114, 105)
                    : const Color.fromRGBO(128, 147, 202, 1),
              ),
              label: 'My Tasks',
              activeIcon: const Icon(
                Icons.task_outlined,
                color: Color.fromARGB(255, 43, 114, 105),
              ),
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.calendar_month_outlined,
                color: controller.selectedIndex.value == 2
                    ? const Color.fromARGB(255, 43, 114, 105)
                    : const Color.fromRGBO(128, 147, 202, 1),
              ),
              label: 'Calendar',
              activeIcon: const Icon(
                Icons.calendar_month_outlined,
                color: Color.fromARGB(255, 43, 114, 105),
              ),
            ),
          ],
          type: BottomNavigationBarType.fixed,
          backgroundColor: const Color.fromRGBO(37, 47, 64, 1),
          selectedItemColor: const Color.fromARGB(255, 43, 114, 105),
          unselectedItemColor: const Color.fromRGBO(128, 147, 202, 1),
        ),
      ),
    );
  }
}
