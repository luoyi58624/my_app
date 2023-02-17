import 'package:flutter/material.dart';
// import 'config/color_schemes.dart';
import 'router.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Flutter App',
      // theme: ThemeData(
      //   useMaterial3: true,
      //   colorScheme: lightColorScheme,
      // ),
      // darkTheme: ThemeData(
      //   useMaterial3: true,
      //   colorScheme: darkColorScheme,
      // ),
      debugShowCheckedModeBanner: false,
      initialRoute: "/",
      routes: rootRouter,
    );
  }
}
