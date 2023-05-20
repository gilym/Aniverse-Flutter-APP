
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:rillanime/bottomnavbar.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'model/user.dart';
import 'login.dart';

String boxName = 'userBox';
String Nameuser='';
Color Background = Color(0xFF0B032D);

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
      home: SplashScreen(isLoggedIn: isLoggedIn,),
      routes: {
        '/botNavBar': (context) => BotNavBar(),
      },
    );
  }
}

class SplashScreen extends StatefulWidget {
  final bool isLoggedIn;
  const SplashScreen({Key? key, required this.isLoggedIn }) : super(key: key);
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => widget.isLoggedIn ? BotNavBar() : const LoginPage(),),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Background,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'ANIVERSE',
              style: TextStyle(
                  fontSize: 80,
                  color: Colors.white,
                  fontFamily: "Bangers"
              ),
            ),
            Container(
              width: 150,
              height: 150,
              child: Image.asset("assets/splash.png"),
            )
          ],
        )
      ),
    );
  }
}

