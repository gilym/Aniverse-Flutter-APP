import 'package:flag/flag_enum.dart';
import 'package:flag/flag_widget.dart';
import 'package:flutter/material.dart';

import 'main.dart';

class SubscribePage extends StatefulWidget {
  @override
  State<SubscribePage> createState() => _SubscribePageState();
}

class _SubscribePageState extends State<SubscribePage> {
  @override
  String _currency = 'USD';
  double price =2.99;
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Background,

      body:Column(

        children: [
          Stack(
            children: [
              Container(
                padding: EdgeInsets.zero,
                height: 400,
                child: ShaderMask(
                  shaderCallback: (Rect bounds) {
                    return LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [Colors.black, Colors.transparent],
                    ).createShader(bounds);
                  },
                  blendMode: BlendMode.dstIn,
                  child: Image.asset(
                    "assets/nami.jpg",
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Container(
                height: 450,
                decoration: BoxDecoration(
                  color: Background,
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(25),topRight: Radius.circular(25))
                ),
                margin: EdgeInsets.only(top:350),
                child: Column(
                  children: [
                    SizedBox(height: 50),
                    Text(
                      'AniVerse Subscription',
                      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: fontcollor,fontFamily: "Poppins"),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Unlock premium content, exclusive features, and more!',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 16, color: fontcollor,fontFamily: "Poppins"),
                    ),
                    SizedBox(height: 20),
                    advantage( 'Access to exclusive anime series'),
                    advantage( 'Early access to new episodes'),
                    advantage( 'Ad-free streaming experience'),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          children: [

                            Text(
                              price.toString(),
                              style: TextStyle(
                                fontSize: 23,
                                color: fontcollor,
                                fontFamily: "Poppins",
                              ),
                            ),

                            SizedBox(
                              width:20 ,
                            ),
                            DropdownButton<String>(
                              value: _currency,
                              items: <DropdownMenuItem<String>>[
                                DropdownMenuItem(
                                    value: 'USD',
                                    child:Row(
                                      children: [
                                        Text(
                                          'USD',
                                          style: TextStyle(color: Colors.white), // Ubah warna teks menjadi putih
                                        ),
                                        SizedBox(width: 10,),
                                        Flag.fromCode(
                                          FlagsCode.US,
                                          height: 20,
                                          width: 30,
                                          fit: BoxFit.fill,
                                        ),
                                      ],
                                    )
                                ),
                                DropdownMenuItem(
                                    value: 'EUR',
                                    child:Row(
                                      children: [
                                        Text(
                                          'EUR',
                                          style: TextStyle(color: Colors.white), // Ubah warna teks menjadi putih
                                        ),
                                        SizedBox(width: 10,),
                                        Flag.fromCode(
                                          FlagsCode.DE,
                                          height: 20,
                                          width: 30,
                                          fit: BoxFit.fill,
                                        ),
                                      ],
                                    )
                                ),
                                DropdownMenuItem(
                                    value: 'IDR',
                                    child: Row(
                                      children: [
                                        Text(
                                          'IDR',
                                          style: TextStyle(color: Colors.white), // Ubah warna teks menjadi putih
                                        ),
                                        SizedBox(width: 10,),
                                        Flag.fromCode(
                                          FlagsCode.ID,
                                          height: 20,
                                          width: 30,
                                          fit: BoxFit.fill,
                                        ),
                                      ],
                                    )
                                ), DropdownMenuItem(
                                    value: 'JPY',
                                    child: Row(
                                      children: [
                                        Text(
                                          'JPY',
                                          style: TextStyle(color: Colors.white), // Ubah warna teks menjadi putih
                                        ),
                                        SizedBox(width: 10,),
                                        Flag.fromCode(
                                          FlagsCode.JP,
                                          height: 20,
                                          width: 30,
                                          fit: BoxFit.fill,
                                        ),
                                      ],
                                    )
                                ),
                              ],
                              onChanged: (String? value) {
                                if (value != null) {
                                  setState(() {
                                    _currency = value;
                                    if(_currency=="USD"){
                                      price=2.99;
                                    }
                                    else if(_currency=="IDR"){
                                      price=(2.99*14936).roundToDouble();
                                    }
                                    else if(_currency=="EUR"){
                                      price=(2.99*0.92).roundToDouble();
                                    }
                                    else if(_currency=="JPY"){
                                      price=(2.99*137.97).roundToDouble();
                                    }
                                  });

                                }
                              },
                              style: TextStyle(color: Colors.white), // Ubah warna teks dropdown menjadi putih
                              dropdownColor: Colors.grey[800], // Ubah warna latar belakang dropdown
                              underline: Container(), // Hilangkan garis bawah
                            ),
                          ],
                        )

                      ],
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor:Darkmode? Color(0xFF865DFF) :Colors.deepOrange// Set button background color
                      ),
                      onPressed: () {
                        // Logika untuk proses langganan
                      },
                      child: Text(
                        'Subscribe Now',
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),


        ],
      ),

    );
  }
  Widget advantage (String data){
    return  ListTile(
      leading: Icon(
        Icons.check,
        color: Colors.green,
      ),
      title: Text(
        data,
        style: TextStyle(fontSize: 20,color: fontcollor,fontFamily: "Poppins"),
      ),
    );
  }
}
