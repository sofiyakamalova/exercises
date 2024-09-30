import 'package:exercise1/exercise_4.dart';
import 'package:flutter/material.dart';

class Exercise_3 extends StatefulWidget {
  const Exercise_3({super.key});

  @override
  State<Exercise_3> createState() => _Exercise_3State();
}

class _Exercise_3State extends State<Exercise_3> {
  bool _isClicked = false;
  TextEditingController textController = TextEditingController();
  String _displayText = '';

  void _toggle() {
    setState(() {
      _isClicked = !_isClicked;
      if (_isClicked) {
        _displayText = textController.text;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('EX3'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextField(
              controller: textController,
              decoration: InputDecoration(
                hintText: 'Type text...',
                hintStyle: const TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.w400,
                  fontSize: 15,
                ),
                fillColor: Colors.white,
                filled: true,
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.grey),
                  borderRadius: BorderRadius.circular(5),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.deepPurple),
                  borderRadius: BorderRadius.circular(5),
                ),
                //  errorText: errorMsg,
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(
                    _isClicked ? Colors.purpleAccent : Colors.white),
              ),
              onPressed: () {
                _toggle();
              },
              child: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 100),
                child: Text(
                  _isClicked ? 'SENT' : 'SEND',
                  style: TextStyle(
                      fontSize: 25,
                      color: _isClicked ? Colors.white : Colors.black),
                ),
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.maxFinite,
              height: 50,
              child: Text(
                _displayText,
                style: const TextStyle(fontSize: 20, color: Colors.black),
              ),
            ),
            const SizedBox(height: 50),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Exercise_4(
                      received: 'Exercise 4 successfully done!',
                    ),
                  ),
                );
              },
              child: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                child: const Text(
                  'EX4 ->',
                  style: TextStyle(fontSize: 20, color: Colors.black),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
