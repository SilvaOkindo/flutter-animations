import 'package:animations/staggered_animations.dart';
import 'package:flutter/material.dart';

import 'home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const StaggeredAnimation()
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation animationColor;
  late Animation animationSize;

  @override
  void initState() {
    super.initState();
    animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 2));

    animationColor = ColorTween(begin: Colors.blue, end: Colors.yellow)
        .animate(animationController);
    animationSize =
        Tween<double>(begin: 100, end: 200).animate(animationController);

    animationController.addListener(() {
      setState(() {});
    });

    //animationController.repeat();

    //animationController.forward();

    animationController.repeat(reverse: true);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
      height: animationSize.value,
      width: animationSize.value,
      color: animationColor.value,
    ));
  }
}
