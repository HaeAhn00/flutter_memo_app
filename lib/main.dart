import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_memo_app/home.dart';
import 'package:flutter_memo_app/memo_list_controller.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  MobileAds.instance.initialize();
  await Firebase.initializeApp(
    options: FirebaseOptions(
      apiKey: 'AIzaSyAhgbjSv0eOB_YI4ROvlgDqzkX17LsKs10',
      appId: '1:834373068351:android:6cb6ef1385a7a65601fa8a',
      messagingSenderId: '834373068351',
      projectId: 'flutter-memo-app-188c5',
    ),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialBinding: BindingsBuilder(() {
        Get.put(MemoListController());
      }),
      home: Home(),
    );
  }
}
