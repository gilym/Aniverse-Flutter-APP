import 'package:flutter/material.dart';
import 'package:encrypt/encrypt.dart' as encrypt;
import 'package:hive/hive.dart';
import 'package:rillanime/login.dart';
import '../model/user.dart';
import '../main.dart';

class RegisterPage extends StatefulWidget {
  final String image;
  const RegisterPage({Key? key ,required this.image}) : super(key: key);


  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  late Box<UserModel> _myBox;

  final _formKey = GlobalKey<FormState>();
  String _inputUsername = "";
  String _inputPassword = "";
  String _inputYourname = "";
  bool _obscureText = true;
  late final encrypt.Key _key;
  final _iv = encrypt.IV.fromLength(16);

  @override
  void initState() {
    super.initState();
    _myBox = Hive.box(boxName);
  }


  void _submit() {
    final form = _formKey.currentState;
    if (form!.validate()) {
      form.save();

      // Check if the username is already used
      if (_myBox.containsKey(_inputUsername)) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Username already taken')),
        );
        return;
      }

      final user = UserModel(password: _inputPassword,Name: _inputYourname ,image: widget.image);

      _myBox.put(_inputUsername, user);

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('User registered successfully.')),
      );
      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => LoginPage()), (route) => false);

    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF191825),
      appBar: AppBar(


        backgroundColor: Color(0xFF191825),
        elevation: 0,
      ),
      body: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.person,
                  color: Colors.grey,),
                labelText: 'YourName',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0), // Set border radius
                ),
                labelStyle: TextStyle(color: Colors.white), // Set label text color
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey[400]!), // Set border color
                  borderRadius: BorderRadius.circular(30.0), // Set border radius
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white), // Set focused border color
                  borderRadius: BorderRadius.circular(20.0), // Set border radius
                ),
              ),
              style: TextStyle(color: Colors.white),
              validator: (value) =>
              value!.isEmpty ? 'Please enter a Your Name' : null,
              onSaved: (value) => _inputYourname = value!,
            ),
            SizedBox(height: 30,),
            TextFormField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.person,
                  color: Colors.grey,),
                labelText: 'Username',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0), // Set border radius
                ),
                labelStyle: TextStyle(color: Colors.white), // Set label text color
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey[400]!), // Set border color
                  borderRadius: BorderRadius.circular(30.0), // Set border radius
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white), // Set focused border color
                  borderRadius: BorderRadius.circular(20.0), // Set border radius
                ),
              ),
              style: TextStyle(color: Colors.white),
              validator: (value) =>
              value!.isEmpty ? 'Please enter a username' : null,
              onSaved: (value) => _inputUsername = value!.toLowerCase(),
            ),
            SizedBox(height: 30,),
            TextFormField(

              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey[400]!), // Set border color
                  borderRadius: BorderRadius.circular(30.0), // Set border radius
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white), // Set focused border color
                  borderRadius: BorderRadius.circular(20.0), // Set border radius
                ),
                labelText: 'Password',
                labelStyle: TextStyle(color: Colors.white),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0), // Set border radius
                ),

                prefixIcon: Icon(Icons.lock,color: Colors.grey,),

                suffixIcon: IconButton(
                  icon: Icon(
                    _obscureText ? Icons.visibility : Icons.visibility_off,
                    color: Colors.grey,
                  ),
                  onPressed: () {
                    setState(() {
                      _obscureText = !_obscureText;
                    });
                  },
                ),
              ),
              style: TextStyle(color: Colors.white),
              validator: (value) =>
              value!.isEmpty ? 'Please enter a password' : null,
              onSaved: (value) => _inputPassword = value!,
              obscureText: _obscureText,
            ),
            SizedBox(height: 50,),
            Container(
              width: 350,
              child:
              ElevatedButton(
                onPressed: _submit,
                child: Text('Register',style: TextStyle(
                  fontSize: 19,
                    fontFamily: "Poppins"
                ),
                ),
                style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF865DFF) // Set button background color
                ),
              ),
            ),

          ],
        ) ,
      )
    );
  }

  Widget temp(){
    return Padding(
      padding: EdgeInsets.all(24.0),
      child: Form(
        key: _formKey,
        child: ListView(
          children: <Widget>[
            SizedBox(height: 25.0),
            Image.asset(
              'assets/images/register.jpg',
              height: 220,
            ),
            SizedBox(height: 25.0),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Username',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.person),
              ),
              validator: (value) =>
              value!.isEmpty ? 'Please enter a username' : null,
              onSaved: (value) => _inputUsername = value!.toLowerCase(),
            ),
            SizedBox(height: 16.0),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.lock),
                suffixIcon: IconButton(
                  icon: Icon(
                    _obscureText ? Icons.visibility : Icons.visibility_off,
                    color: Colors.grey,
                  ),
                  onPressed: () {
                    setState(() {
                      _obscureText = !_obscureText;
                    });
                  },
                ),
              ),
              validator: (value) =>
              value!.isEmpty ? 'Please enter a password' : null,
              onSaved: (value) => _inputPassword = value!,
              obscureText: _obscureText,
            ),
            SizedBox(height: 25.0),
            ElevatedButton(
              onPressed: _submit,
              child: Text('Register'),
            ),
          ],
        ),
      ),
    );
  }

}