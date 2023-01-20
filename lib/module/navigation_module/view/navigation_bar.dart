import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:football/module/following_module/view/cart_screen.dart';
import 'package:football/module/live_module/view/category_screen.dart';
import 'package:football/module/home_module/view/home_screen.dart';
import 'package:football/module/navigation_module/controller/nav_controller.dart';
import 'package:football/module/profile_module/view/profile_screen.dart';
import 'package:football/utils/const.dart';
import 'package:get/get.dart';

class HomeNavigationBar extends StatefulWidget {
  final RemoteMessage message;
  const HomeNavigationBar(this.message, {super.key});

  @override
  State<HomeNavigationBar> createState() => _HomeNavigationBarState();
}

class _HomeNavigationBarState extends State<HomeNavigationBar> {
  final NavController navController = Get.put(NavController());
  final _pageOptions = const [
    HomeScreen(title: 'House of Packaging', message),
    CategoryScreen(title: 'Categories'),
    CartScreen(title: 'Cart'),
    ProfileScreen(title: 'Profile'),
  ];
  @override
  Widget build(BuildContext navContext) {
    return GetBuilder<NavController>(
      builder: ((controller) {
        return Scaffold(
          body: _pageOptions[navController.selectTabIndex],
          bottomNavigationBar: BottomNavigationBar(
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.live_tv),
                label: 'Live',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.games),
                label: 'Matches',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.newspaper),
                label: 'News',
              ),
            ],
            currentIndex: navController.selectTabIndex,
            type: BottomNavigationBarType.fixed,
            selectedItemColor: Palette.black,
            unselectedItemColor: Palette.grey,
            showUnselectedLabels: true,
            onTap: (int index) {
              navController.changeTabIndex(index);
            },
          ),
        );
      }),
    );
  }
}
