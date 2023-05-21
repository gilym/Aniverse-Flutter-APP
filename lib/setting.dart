import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'konversiuang.dart';
import 'main.dart';
import 'model/user.dart';

class setting extends StatefulWidget {
  const setting({Key? key}) : super(key: key);

  @override
  State<setting> createState() => _settingState();
}

class _settingState extends State<setting> {
  late Box<UserModel> _myBox;
  late SharedPreferences _prefs;
  late String username = '';
  late Future<List<dynamic>> favData = Future.value([]);
  final String pesan ="Selama mengikuti kelas Teknologi Pemrograman Mobile, saya merasa sangat terinspirasi dan senang. Materi yang diajarkan sangat relevan dengan perkembangan teknologi terkini. Saya mendapatkan pemahaman yang mendalam tentang pembuatan aplikasi mobile menggunakan Flutter. Instruktur sangat kompeten dan responsif dalam menjawab pertanyaan kami. Saya juga mengapresiasi suasana belajar yang interaktif dan kolaboratif di kelas. Terima kasih atas pengalaman yang berharga ini!";


  void initState() {
    super.initState();
    _myBox = Hive.box(boxName);

    _openBox();


    SharedPreferences.getInstance().then((prefs) {
      setState(() {
        _prefs = prefs;
      });
    });
  }

  void _openBox() async {
    await Hive.openBox<UserModel>(boxName);
    _myBox = Hive.box<UserModel>(boxName);
  }

  Future<void> loadUsername() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _prefs = prefs;
      username = prefs.getString('username') ?? '';
    });
  }

  Future<void> _launchUrl(String url) async {
    final Uri _url = Uri.parse(url);
    if (!await launchUrl(_url)) {
      throw Exception('Could Not Launch $_url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Background,
      appBar: AppBar(

        elevation: 0,
        backgroundColor: Color(0xFF865DFF),

      ),
      body: ListView(
        children: [
          Container(
            height: 200,
            decoration: BoxDecoration(
              color: Color(0xFF865DFF)
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                CircleAvatar(
                  radius: 60,
                 backgroundImage: AssetImage("assets/foto3.jpg"),
                ),
                SizedBox(
                  height: 15,
                ),
                Text("Gilang Yoenal Marinta",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontFamily: "Raleway",
                      fontWeight: FontWeight.bold
                  ),
                ),
                Text("123200056",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontFamily: "Raleway",

                  ),
                ),
              ],
            ),
          ),
          Container(
            height: 190,

            decoration: BoxDecoration(

              image: DecorationImage(
                image: AssetImage("assets/wave.png"),
                fit: BoxFit.cover,
              ),
            ),
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(
                    top: 20.0,

                  ),
                  child:
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        icon: Icon(
                          FontAwesomeIcons.instagram,
                          // ukuran ikon
                          size: 40,
                          // warna ikon
                          color: Colors.white,
                        ),

                        onPressed: () {
                          _launchUrl("https://www.instagram.com/gilng.y/");
                        },
                      ),
                      SizedBox(width: 15,),
                      IconButton(
                        icon: Icon(
                          FontAwesomeIcons.github,
                          // ukuran ikon
                          size: 40,
                          // warna ikon
                          color: Colors.white,
                        ),
                        // fungsi yang akan dijalankan ketika ikon ditekan
                        onPressed: () {
                          _launchUrl("https://github.com/gilym");
                          // Tambahkan kode yang ingin Anda jalankan di sini
                        },
                      ),
                      SizedBox(width: 15,),
                      IconButton(
                        icon: Icon(
                          FontAwesomeIcons.linkedin,
                          // ukuran ikon
                          size: 40,
                          // warna ikon
                          color: Colors.white,
                        ),
                        // fungsi yang akan dijalankan ketika ikon ditekan
                        onPressed: () {
                         _launchUrl("https://www.linkedin.com/in/gilangmarinta/");
                        },
                      ),
                    ],
                  ),
                )
                // tambahkan child lainnya di sini jika diperlukan
              ],
            ),
          ),
          Card(
            color: Background,
            child: Column(
              children: [
                ListTile(
                  leading: Icon(Icons.message,color: fontcollor,),
                  title: Text("Kesan Pesan" ,style: TextStyle(color: fontcollor ,fontFamily: "Poppins",fontSize: 21,fontWeight: FontWeight.bold),),
                  subtitle: Text(pesan,style: TextStyle(color: fontcollor ,fontFamily: "Poppins"),),
                ),

              ],
            ),
          )

          // InkWell(
          //   onTap: (){
          //     Navigator.push(
          //       context,
          //       MaterialPageRoute(builder: (context) =>CurrencyConverter()),
          //     );
          //   },
          //   child:
          //   Icon(Icons.add,
          //   color: Colors.white,
          //   size: 30,),
          // )

        ],
      ),

    );
  }
}
