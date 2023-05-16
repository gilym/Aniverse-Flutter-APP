import 'package:flutter/material.dart';
import 'package:rillanime/register.dart';

class choseprofile extends StatelessWidget {
  const choseprofile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> image=["assets/tanjiro.png","assets/deku.jpg","assets/gojo.jpg","assets/luffy.jpg","assets/naruto.png",];
    return Scaffold(
      backgroundColor: Color(0xFF191825),
      appBar: AppBar(
        backgroundColor: Color(0xFF191825),
        elevation: 0,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text(
              "Welcome",
              style: TextStyle(
                fontFamily: "Raleway",
                fontSize: 40,
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(height: 20),
          Center(
            child: Text(
              "Choose Your Profile",
              style: TextStyle(
                fontFamily: "Raleway",
                fontSize: 30,
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(height: 20,),
          Container(
            child: Wrap(
              alignment: WrapAlignment.center,
              children: [
                for (int i = 0; i < image.length; i++)
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15,vertical: 15),
                    child: InkWell(
                      onTap: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>  RegisterPage(image: image[i]),
                          ),
                        );
                      },
                      child: CircleAvatar(
                        radius: 50,
                        backgroundImage: AssetImage(image[i]),
                      ),
                    ),
                  ),
              ],
            ),
          )



        ],
      ),
    );
  }
}
