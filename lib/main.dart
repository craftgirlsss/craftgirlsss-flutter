import 'dart:io';
import 'package:craftgirlsss/src/helpers/certificates/certificate.dart';
import 'package:craftgirlsss/src/mainpage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

Future<void> main() async {
  HttpOverrides.global = CertificateNetwork();
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
  await Supabase.initialize(
    url: 'https://zhfjjcaxzhmrexhkzest.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InpoZmpqY2F4emhtcmV4aGt6ZXN0Iiwicm9sZSI6ImFub24iLCJpYXQiOjE2OTU2Nzg4MDMsImV4cCI6MjAxMTI1NDgwM30.i1m1xAiYvDYOWLN8YuIMGTF2mu9CfsB_etdfwNd2DBE',
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      transitionDuration: const Duration(milliseconds: 500),
      defaultTransition: Transition.rightToLeft,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MainPage(),
    );
  }
}
