import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Animation',
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  late AnimationController controller;
  bool isActive = false;
  @override
  void initState() {
    controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds:1500));
    super.initState();
  }

  void animationFunc() {
    setState(() {
      isActive = !isActive;
      isActive ? controller.forward() : controller.reverse();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        backgroundColor: Colors.blue.shade200,
      ),
      body: Center(
          child: IconButton(
        iconSize: 150,
        onPressed: animationFunc,
        icon: AnimatedIcon(
            color: Colors.red,
            icon: AnimatedIcons.play_pause,
            progress: controller),
      )),
    );
  }
}
