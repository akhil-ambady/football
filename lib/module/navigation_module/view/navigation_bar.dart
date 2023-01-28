import 'package:flutter/material.dart';
import 'package:footballalert/module/following_module/view/cart_screen.dart';
import 'package:footballalert/module/live_module/view/category_screen.dart';
import 'package:footballalert/module/home_module/view/home_screen.dart';
import 'package:footballalert/module/navigation_module/controller/nav_controller.dart';
import 'package:footballalert/module/profile_module/view/profile_screen.dart';
import 'package:footballalert/utils/const.dart';
import 'package:get/get.dart';

class HomeNavigationBar extends StatefulWidget {
  const HomeNavigationBar({super.key});

  @override
  State<HomeNavigationBar> createState() => _HomeNavigationBarState();
}

class _HomeNavigationBarState extends State<HomeNavigationBar> {
  final NavController navController = Get.put(NavController());
  final _pageOptions = const [
    HomeScreen(title: 'House of Packaging'),
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
