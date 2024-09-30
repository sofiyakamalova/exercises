import 'package:flutter/material.dart';

class Exercise3 extends StatelessWidget {
  const Exercise3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('EX2'),
      ),
      body: Padding(
        padding: EdgeInsets.all(15.0),
        child: Container(),
      ),
    );
  }
}
