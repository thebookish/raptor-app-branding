import 'package:appbranding/features/client/presentation/screens/app_details_form.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'core/dependency/dependency_injection.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupLocator();
  await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: "AIzaSyDgEMLeFM-jLXbHy9qeTiFuAqbSwgMRGeQ",
          authDomain: "raptor-app-branding.firebaseapp.com",
          projectId: "raptor-app-branding",
          storageBucket: "raptor-app-branding.appspot.com",
          messagingSenderId: "498210465236",
          appId: "1:498210465236:web:bcd889d3ca961cb9836241",
          measurementId: "G-YQ99XZN5S6"));
  runApp(ProviderScope(child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
          useMaterial3: true,
        ),
        home: AppDetailsForm());
  }
}
