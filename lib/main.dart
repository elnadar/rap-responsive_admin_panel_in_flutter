import 'package:flutter/material.dart';
import 'package:rap/utils/constants.dart';
import 'package:rap/utils/widget_tree.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'rap - responsive admin panel',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: ThemeColors.purpleDark,
        canvasColor: ThemeColors.purpleLight,
        // useMaterial3: true,
      ),
      home: const WidgetTree(),
    );
  }
}
