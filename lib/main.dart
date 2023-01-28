import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:footballalert/module/navigation_module/view/navigation_bar.dart';
import 'package:footballalert/service/hive_services/storage_service.dart';
import 'package:footballalert/service/notification_service/firebase_messaging.dart';
import 'package:footballalert/service/notification_service/local_notification_service.dart';
import 'package:footballalert/utils/const.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await FootballFirebaseMessaging().init();
  await LocalNotificationService.initialize();
  await StorageService().initStorage();
  await StorageService().initBox('NOTIFICATION');
  // To set the device orientation to portrait mode only
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(const MyApp());
  });
}

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      // template design size, so that the design we make for 1 device will be ok for other also.
      designSize: const Size(375, 812),
      builder: (screenUtilContext, child) => GetMaterialApp(
        navigatorKey: navigatorKey,
        debugShowCheckedModeBanner: false,
        title: '',
        theme: ThemeData(
            primaryColor: Palette.red,
            colorScheme:
                ColorScheme.fromSwatch().copyWith(secondary: Palette.red)),
        home: const HomeNavigationBar(),
      ),
    );
  }
}
