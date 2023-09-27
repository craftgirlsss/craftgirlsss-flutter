import 'dart:io';
import 'package:craftgirlsss/src/helpers/certificates/certificate.dart';
import 'package:craftgirlsss/src/views/splashscreen/splashscreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:flutter/scheduler.dart';

Future<void> main() async {
  HttpOverrides.global = CertificateNetwork();
  WidgetsFlutterBinding.ensureInitialized();
  SchedulerBinding.instance.window.platformBrightness == Brightness.light;
  runApp(const MyApp());
  await Supabase.initialize(
    url: 'https://zhfjjcaxzhmrexhkzest.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InpoZmpqY2F4emhtcmV4aGt6ZXN0Iiwicm9sZSI6ImFub24iLCJpYXQiOjE2OTU2Nzg4MDMsImV4cCI6MjAxMTI1NDgwM30.i1m1xAiYvDYOWLN8YuIMGTF2mu9CfsB_etdfwNd2DBE',
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      transitionDuration: const Duration(milliseconds: 500),
      defaultTransition: Transition.rightToLeft,
      title: 'Craftgirlsss',
      darkTheme: ThemeData.dark().copyWith(primaryColor: Colors.red),
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const SplashScreen(),
    );
  }
}
