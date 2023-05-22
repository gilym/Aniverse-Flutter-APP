import 'dart:async';

import 'package:flutter/material.dart';
import 'package:rillanime/DetailPage.dart';
import 'package:rillanime/bottomnavbar.dart';
import 'package:rillanime/count.dart';

import 'package:rillanime/viewmore.dart';
import 'fetching/fetchschedule.dart';

import 'dashboard.dart';
import 'main.dart';

class schedule extends StatefulWidget {
  const schedule({Key? key}) : super(key: key);

  @override
  State<schedule> createState() => _scheduleState();
}

class _scheduleState extends State<schedule> {
  late List<dynamic> monday;
  late List<dynamic> tuesday;
  late List<dynamic> wednesday;
  late List<dynamic> thursday;
  late List<dynamic> friday;
  late List<dynamic> saturday;
  late List<dynamic> sunday;
  bool isLoading = true;
  bool isDataLoaded = false;


  @override
  void initState() {
    super.initState();
    monday = [];
    tuesday = [];
    wednesday = [];
    thursday = [];
    friday = [];
    saturday = [];
    sunday = [];
    int completedProcesses = 0;
    int totalProcesses = 5; // Update the total number of processes

    void checkCompletion() {
      completedProcesses++;
      if (completedProcesses == totalProcesses) {
        setState(() {
          isLoading = false; // Loading completed
          isDataLoaded = true; // All data loaded successfully
        });
      }

    }
    getMonday.fetchday().then((data) {
      setState(() {
        monday = data;
      });
      checkCompletion();
    }).catchError((error) {
      print(error);
      checkCompletion();
    });

    getTuesday.fetchday().then((data) {
      setState(() {
        tuesday = data;
      });
      checkCompletion();
    }).catchError((error) {
      print(error);
      checkCompletion();
    });

    getWednesday.fetchday().then((data) {
      setState(() {
        wednesday = data;
      });
      checkCompletion();
    }).catchError((error) {
      print(error);
      checkCompletion();
    });

    getThursday.fetchday().then((data) {
      setState(() {
        thursday = data;
      });
      checkCompletion();
    }).catchError((error) {
      print(error);
      checkCompletion();
    });

    getFriday.fetchday().then((data) {
      setState(() {
        friday = data;
      });
      checkCompletion();
    }).catchError((error) {
      print(error);
      checkCompletion();
    });

    getSaturday.fetchday().then((data) {
      setState(() {
        saturday = data;
      });
      checkCompletion();
    }).catchError((error) {
      print(error);
      checkCompletion();
    });

    getSunday.fetchday().then((data) {
      setState(() {
        sunday = data;
      });
      checkCompletion();
    }).catchError((error) {
      print(error);
      checkCompletion();
    });
  }






  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Background,
      body: ListView(
        padding: EdgeInsets.only(top: 50),
        children: [
         tile("Sunday", sunday),
          SizedBox(height: 20,),
          SizedBox(
            height: 250,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount:  sunday.where((item) => item["broadcast"]["time"] != null).length,
              itemBuilder: (context, index) {
                final anime = sunday.where((item) => item["broadcast"]["time"] != null).toList()[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 3),
                  child: Aired(anime),
                );
              },
            ),
          ),
          SizedBox(height: 30,),
          tile("Monday", monday),
          SizedBox(height: 20,),
          SizedBox(
            height: 250,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount:  monday.where((item) => item["broadcast"]["time"] != null).length,
              itemBuilder: (context, index) {
                final anime = monday.where((item) => item["broadcast"]["time"] != null).toList()[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 3),
                  child: Aired(anime),
                );
              },
            ),
          ),
          SizedBox(height: 30,),
          tile("Tuesday", tuesday),
          SizedBox(height: 20,),
          SizedBox(
            height: 250,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount:  tuesday.where((item) => item["broadcast"]["time"] != null).length,
              itemBuilder: (context, index) {
                final anime = tuesday.where((item) => item["broadcast"]["time"] != null).toList()[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 3),
                  child: Aired(anime),
                );
              },
            ),
          ),

          SizedBox(height: 30,),
          tile("Wednesday", wednesday),
          SizedBox(height: 20,),
          SizedBox(
            height: 250,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount:  wednesday.where((item) => item["broadcast"]["time"] != null).length,
              itemBuilder: (context, index) {
                final anime = wednesday.where((item) => item["broadcast"]["time"] != null).toList()[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 3),
                  child: Aired(anime),
                );
              },
            ),
          ),
          SizedBox(height: 30,),
          tile("Thursday", thursday),
          SizedBox(height: 20,),
          SizedBox(
            height: 250,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount:  thursday.where((item) => item["broadcast"]["time"] != null).length,
              itemBuilder: (context, index) {
                final anime = thursday.where((item) => item["broadcast"]["time"] != null).toList()[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 3),
                  child: Aired(anime),
                );
              },
            ),
          ),
          SizedBox(height: 30,),

          tile("Friday", friday),
          SizedBox(height: 20,),
          SizedBox(
            height: 250,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount:  friday.where((item) => item["broadcast"]["time"] != null).length,
              itemBuilder: (context, index) {
                final anime = friday.where((item) => item["broadcast"]["time"] != null).toList()[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 3),
                  child: Aired(anime),
                );
              },
            ),
          ),
          SizedBox(height: 30,),
          tile("Saturday", saturday),
          SizedBox(height: 20,),
          SizedBox(
            height: 250,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount:  saturday.where((item) => item["broadcast"]["time"] != null).length,
              itemBuilder: (context, index) {
                final anime = saturday.where((item) => item["broadcast"]["time"] != null).toList()[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 3),
                  child: Aired(anime),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget tile(String title, List<dynamic> data){
    return InkWell(
        onTap: (){
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => viewmore(
                data: data,
                title: title,

              )));
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              margin: EdgeInsets.only(left: 10),
              child: Text(title ,
                style: TextStyle(
                    fontFamily: "Raleway",
                    color: fontcollor,
                    fontWeight: FontWeight.w400,
                    fontSize: 25
                ),),
            ),
            Icon(Icons.chevron_right,
              color: fontcollor,
              size: 35,)
          ],
        )
    );
  }

  Container Aired(Map<String, dynamic> animeData) {
    final title = animeData['title'] as String?;
    final imageUrl = animeData['images']['jpg']['image_url'] as String?;
    final day = animeData['broadcast']['day'] as String?;
    final time = animeData['broadcast']['time'] as String?;
    final timezone = animeData['broadcast']['timezone'] as String?;
    final string = animeData['broadcast']['string'] as String?;
    final score = animeData['score'] is int ? animeData['score'].toDouble() : animeData['score'];

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
      ),
      margin: EdgeInsets.symmetric(horizontal: 8),
      width: 370,
      child: InkWell(
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => countschedule(
                title: title,
                day: day,
                time: time,
                imageUrl: imageUrl,
                timezone: timezone,
              )
              )
          );
        },
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(imageUrl!),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.circular(15)
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                height: 300,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(bottomLeft: Radius.circular(15)),
                  gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [
                      Colors.black.withOpacity(0.85), // Warna gradasi pertama dengan transparansi 75%
                      Colors.transparent, // Warna gradasi kedua (transparan)
                    ],
                  ),
                ),
              )
            ),
            Positioned(
              top: 0,
              right: 0,
              child: Opacity(
                opacity: 0.8, // Menetapkan transparansi sebesar 80%
                child: Container(
                  height: 50,
                  width: 100,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(15)
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.access_time_outlined,
                        color: Colors.yellow,
                      ),
                      SizedBox(width: 4),
                      Text(
                        time!,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontFamily: "Poppins",
                          fontWeight: FontWeight.bold
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            Center(
              child:Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(

                    child: Text(
                      (title!.length <= 40) ? title!.toUpperCase() : title!.substring(0, 40).toUpperCase(),
                      style: TextStyle(
                        fontSize: 30,
                        color: Colors.white,
                        fontFamily: "Oswald",
                        letterSpacing: 1,
                      ),
                      textAlign: TextAlign.center,
                    )
                  ),
                ],
              )
            ),
            Positioned(
              bottom: 10,
              left: 0,
              child: Text(
              timezone!,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontFamily: "Raleway",
              ),
            ),
            ),
            Positioned(
              bottom: 35,
              left: 0,
              right: 0,
              child: Text(
              string!,
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontFamily: "Raleway",
                  letterSpacing: 1,
                ),
            ),
            )
          ],
        )
      ),
    );


  }



}
