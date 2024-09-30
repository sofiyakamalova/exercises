import 'dart:convert';

import 'package:exercise1/user_model.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart'; // Добавлен импорт

class Exercise_5 extends StatefulWidget {
  const Exercise_5({super.key});

  @override
  State<Exercise_5> createState() => _Exercise_5State();
}

class _Exercise_5State extends State<Exercise_5> {
  TextEditingController nameController = TextEditingController();
  TextEditingController surnameController = TextEditingController();
  UserModel? user;

  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  Future<void> _loadUserData() async {
    user = await getUserData();
    setState(() {});
  }

  Future<void> _saveUserData() async {
    String name = nameController.text;
    String surname = surnameController.text;
    UserModel newUser = UserModel(name: name, surname: surname);
    await saveUserData(newUser);
    setState(() {
      user = newUser;
    });
  }

  Future<void> saveUserData(UserModel user) async {
    final prefs = await SharedPreferences.getInstance();
    String userJson = jsonEncode(user.toJson());
    await prefs.setString('user_data', userJson);
  }

  Future<UserModel?> getUserData() async {
    final prefs = await SharedPreferences.getInstance();
    String? userJson = prefs.getString('user_data');
    if (userJson == null) return null;
    Map<String, dynamic> userMap = jsonDecode(userJson);
    return UserModel.fromJson(userMap);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('EX5'),
      ),
      body: Padding(
        padding: EdgeInsets.all(15.0),
        child: Column(
          children: [
            TextField(
              controller: nameController,
              decoration: InputDecoration(
                hintText: 'Type name...',
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
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: surnameController,
              decoration: InputDecoration(
                hintText: 'Type surname...',
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
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _saveUserData,
              child: const Text('Save'),
            ),
            const SizedBox(height: 20),
            user != null
                ? Text('Name: ${user!.name}, Surname: ${user!.surname}')
                : const Text('Ничего не найдено'),
          ],
        ),
      ),
    );
  }
}
