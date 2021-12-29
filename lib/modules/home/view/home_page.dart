import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  static const routeName = "home";

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              Text("Press the button to navigate to detail page"),
              ElevatedButton(
                onPressed: () {},
                child: Text("Navigate")),
            ],
          ),
        )
      ),
    );
  }
}