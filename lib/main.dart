import 'package:flutter/material.dart';
import 'package:riverpod_sample/screens/home/home_screen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: MaterialApp(
        title: 'Riverpod Sample',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueAccent),
        ),
        home: const HomeScreen(),
      ),
    );
  }
}