import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:sizer/sizer.dart';
import 'package:smart_hrm/local/prefs.dart';
import 'package:smart_hrm/res/style/app_string.dart';
import 'package:smart_hrm/utils/routes/app_routes.dart';
import 'bindings/all_bindings.dart';

void main() async {
  AllBindings().dependencies();
  runApp(const MyApp());
  WidgetsFlutterBinding.ensureInitialized();
    await MySharedPref.init();
  await Firebase.initializeApp(
      options: FirebaseOptions(
          apiKey: "AIzaSyCP8wo_papnoi_BTcJvKJqJyzeeg9bJoFI",
          appId: "1:181032267041:android:fe45c8d64bfe4377c3a260",
          messagingSenderId: "",
          projectId: "smart-hrm-321e0",
          databaseURL: "https://smart-hrm-321e0.firebaseio.com/"));
  // await Firebase.initializeApp();
  await Firebase.initializeApp(
      options: FirebaseOptions(
    apiKey: "AIzaSyCzFj0plH2lcTA04OIpM3ITWge0IlogPW0",
    appId: "1:1029659283999:android:ee14d4f9d6f27955b2bb2a",
    messagingSenderId: "",
    projectId: "test-6e4aa",
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: AppRoute.initialscreen,
        theme: ThemeData(
          primaryColor: Colors.white,
        ),
        getPages: AppRoute.route,
        title: AppConfig.appName,
        // home: SplashScreen(),
      );
    });
  }
}
