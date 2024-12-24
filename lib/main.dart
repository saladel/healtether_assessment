import 'package:flutter/material.dart';
import 'package:healtether_assessment/networking/user_service.dart';
import 'package:healtether_assessment/provider/user_provider.dart';
import 'package:healtether_assessment/screens/user_list_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => UserProvider(userService: UserService()),
      child: MaterialApp(
        title: 'User Directory',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          useMaterial3: true,
        ),
        home: UserListScreen(),
      ),
    );
  }
}
