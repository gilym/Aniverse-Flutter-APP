
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:rillanime/bottomnavbar.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'model/user.dart';
import 'login.dart';

String boxName = 'userBox';
String Nameuser='';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();

  bool isLoggedIn = prefs.getBool('isLoggedIn') ?? false;
  await Hive.initFlutter();
  Hive.registerAdapter<UserModel>(UserModelAdapter());
  await Hive.openBox<UserModel>(boxName);
  runApp(MyApp(isLoggedIn: isLoggedIn));
}

class MyApp extends StatelessWidget {
  final bool isLoggedIn;
  const MyApp({Key? key, required this.isLoggedIn}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tugas UAS TPM',
      theme: ThemeData(
        primaryColor: Color(0xFF191825),
        bottomAppBarTheme: BottomAppBarTheme(
          color: Color(0xFF191825), // Atur warna latar belakang di sini
        ),
      ),
      home: isLoggedIn ? BotNavBar() : const LoginPage(),
      routes: {
        '/botNavBar': (context) => BotNavBar(),
      },
    );
  }
}

