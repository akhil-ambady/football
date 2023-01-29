import 'package:flutter/material.dart';
import 'package:footballalert/module/home_module/controller/home_controller.dart';
import 'package:footballalert/widgets/custom_appbar.dart';
import 'package:footballalert/widgets/custom_button.dart';
import 'package:footballalert/widgets/floating_call_button.dart';
import 'package:get/get.dart';

class LiveScreen extends StatefulWidget {
  const LiveScreen({super.key, required this.title});
  final String title;

  @override
  State<LiveScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<LiveScreen> {
  HomeController homeController = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
          preferredSize: Size.fromHeight(50), child: HomeAppBar()),
      body: GetBuilder<HomeController>(
        init: HomeController(),
        builder: (_) => Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              CustomButton(
                text: 'General Ad',
                onPressed: () {
                  homeController.sendNotification("Tesla Cars",
                      "Tesla is accelerating the world's transition to sustainable energy with electric cars");
                },
              ),
              CustomButton(
                text: 'Match Started',
                onPressed: () {
                  homeController.sendNotification("Match Started",
                      "Match between HOME vs AWAY has started");
                },
              ),
              CustomButton(
                text: 'Match Goal',
                onPressed: () {
                  homeController.sendNotification("Match goal",
                      "PLAYER has scored for HOME team against AWAY");
                },
              ),
              CustomButton(
                text: 'Match Player Foul',
                onPressed: () {
                  homeController.sendNotification(
                      "Match foul", "PLAYER has received 'Yellow' card");
                },
              ),
              CustomButton(
                text: 'Competition Table',
                onPressed: () {
                  homeController.sendNotification("PL Table update",
                      "HOME team has moved to 3rd place from 6th.");
                },
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: const FloatingCallButton(),
    );
  }
}
