import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:traveler/provider/places.dart';
import 'package:traveler/screen/detail_screen.dart';

import 'screen/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => Places()),
      ],
      child: MaterialApp(
        title: "Traveler",
        debugShowCheckedModeBanner: false,
        home: const HomeScreen(),
        theme: ThemeData(primaryColor: Colors.white, accentColor: Colors.black),
        routes: {DetailScreen.routeName: (context) => const DetailScreen()},
      ),
    );
  }
}
