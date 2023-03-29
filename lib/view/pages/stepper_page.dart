import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StepperPage extends StatefulWidget {
  const StepperPage({Key? key}) : super(key: key);

  @override
  State<StepperPage> createState() => _StepperPageState();
}

class _StepperPageState extends State<StepperPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("This is Stepper Page"),
      ),
    );
  }
}
