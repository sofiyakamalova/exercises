import 'package:exercise1/exercise_2.dart';
import 'package:flutter/material.dart';

class Exercise_1 extends StatelessWidget {
  const Exercise_1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('EX1'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Hello world',
              style: TextStyle(fontSize: 30),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Exercise_2()));
              },
              child: Container(
                // height: 30,
                // width: 100,
                padding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                child: const Text(
                  'EX2',
                  style: TextStyle(fontSize: 20, color: Colors.black),
                ),
              ),
            ),
          ],
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
