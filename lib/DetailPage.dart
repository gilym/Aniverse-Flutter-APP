
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';


class AnimeDetailScreen extends StatefulWidget {

  const AnimeDetailScreen({
    Key? key,
     this.title,
     this.imageUrl,
     this.url,
     this.synopsis,
    required this.id,
     this.score,
    this.trailer,
     this.genres,
     this.episodes,
     this.duration,
     this.ranking,
     this.favorite,
     this.member,
     this.popularity,
     this.status,
     this.season,
     this.studio,
     this.source,
     this.rating,
     this.idyoutube,
     this.type


  }) : super(key: key);

  final String? title;
  final String? imageUrl;
  final String? url;
  final String? synopsis;
  final int id;
  final double? score;
  final String? trailer;
  final List<String>? genres;
  final int? episodes ;
  final String? duration ;
  final int? ranking ;
  final int? favorite ;
  final int? member ;
  final int? popularity ;
  final String? status;
  final String? season;
  final String? studio;
  final String? source;
  final String? rating;
  final String? idyoutube;
  final String? type;



  @override
  _AnimeDetailScreenState createState() => _AnimeDetailScreenState();
}
class _AnimeDetailScreenState extends State<AnimeDetailScreen> {
  bool _isExpanded = false;



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        backgroundColor: Color(0xFFEEEEEE),
        elevation: 0,
        iconTheme: IconThemeData(
          color: Colors.black, // Ubah warna icon menjadi hitam
        ),

      ),

      body: ListView(
        shrinkWrap: true,
        children: [
          Stack(
            children: [
              Container(
                height: 270,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(widget.imageUrl!),
                    fit: BoxFit.cover,
                  ),
                ),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                  child: Container(
                    color: Colors.black.withOpacity(0.5),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Container(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 220,
                        width: 150,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(widget.imageUrl!),
                          ),
                        ),
                      ),
                      SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.title!,
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontFamily: "Raleway",
                              ),
                            ),
                            SizedBox(height: 20),
                            Row(
                              children: [
                                Icon(Icons.play_circle, color: Colors.white),
                                Text(
                                  widget.episodes.toString() == "null"
                                      ? "N/A"
                                      : widget.episodes.toString() + " EP",
                                  style: TextStyle(color: Colors.white),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Icon(Icons.access_time_filled, color: Colors.white),
                                Text(widget.duration!, style: TextStyle(color: Colors.white)),
                              ],
                            ),
                            SizedBox(
                              height: 30,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                bottom: 25,
                right: 20,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    SizedBox(
                      height: 45,
                      width: 45,
                      child: widget.score != null
                          ? CircularProgressIndicator(
                        value: widget.score! / 10,
                        strokeWidth: 3,
                        color: Colors.green[600],
                        backgroundColor: Colors.grey[300],
                      )
                          : CircularProgressIndicator(
                        value: 0 / 10,
                        strokeWidth: 3,
                        color: Colors.green[600],
                        backgroundColor: Colors.grey[300],
                      ),
                    ),
                    Text(
                      widget.score != null ? widget.score.toString() : 'N/A',
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 250),
                child: Divider(
                  indent: 20,
                  endIndent: 20,
                  thickness: 1,
                  color: Colors.grey[300]?.withAlpha(50),
                ),
              ),
              SizedBox(height: 20),
            ],
          ),


          SizedBox(height: 20,),
          Padding(padding:  const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                icon("#"+widget.ranking.toString(), "Ranking", Icons.bar_chart_outlined),
                icon(widget.favorite.toString(), "Favorites", Icons.thumb_up_sharp),
                icon(widget.member.toString(), "Members", Icons.people_alt),
                icon("#"+widget.popularity.toString(), "Popularity", Icons.auto_graph),


              ],
            ),),
          SizedBox(height: 20,),
          Divider(
            indent: 20,
            endIndent: 20,
            thickness: 1,
            color: Colors.grey[300],
          ),
          Container(
            margin: EdgeInsets.only(left: 10),
            alignment:Alignment.topLeft,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Synopsis",
                style: TextStyle(
                  fontFamily: "Poppins",
                  fontWeight: FontWeight.bold,
                  fontSize: 20,

                ),textAlign: TextAlign.left,


                ),
                Text(widget.synopsis ?? "-",
                  style: TextStyle(
                    fontFamily: "Poppins",
                    fontSize: 15,
                  ),

                  overflow: TextOverflow.ellipsis,
                  maxLines: _isExpanded ? 100 : 3,
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _isExpanded = !_isExpanded;
                    });
                  },
                  child: Text(
                    _isExpanded ? "close" : "read more",
                    style: TextStyle(
                      fontFamily: "Poppins",
                      fontSize: 15,
                      color: Colors.blue,
                    ),
                  ),
                ),
                SizedBox(height: 20,),
                Text("Genres",
                  style: TextStyle(
                    fontFamily: "Poppins",
                    fontWeight: FontWeight.bold,
                    fontSize: 20,

                  ),textAlign: TextAlign.left,


                ),
                SizedBox(
                  height: 50,
                  child: ListView.builder(
                    physics: PageScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemCount: widget.genres!.length,
                    itemBuilder: (context, index) {

                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child:  Container(

                      child: Padding(
                      padding: const EdgeInsets.all(1.0),
                      child: Chip(
                      label: Text(widget.genres![index]),
                      backgroundColor: Colors.grey[300],
                      labelStyle: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                      fontFamily: "Raleway"
                      ),
                      ),
                      ),
                      )
                      );
                    },
                  ),
                ),
                SizedBox(height: 20,),
                Text("More Info",
                  style: TextStyle(
                    fontFamily: "Poppins",
                    fontWeight: FontWeight.bold,
                    fontSize: 20,

                  ),textAlign: TextAlign.left,
                ),
                SizedBox(height: 20,),
                info("Status", widget.status ?? "-"),
                Container(

                  child:
                  Divider(
                    thickness: 1,
                    color: Colors.grey[300],
                  ),
                ),
                info("Season", widget.season ?? "-"),
                Container(

                  child:
                  Divider(
                    thickness: 1,
                    color: Colors.grey[300],
                  ),
                ),
                info("Studios", widget.studio ?? "-"),
                Container(

                  child:
                  Divider(
                    thickness: 1,
                    color: Colors.grey[300],
                  ),
                ),
                info("Source", widget.source ?? "-"),
                Container(

                  child:
                  Divider(
                    thickness: 1,
                    color: Colors.grey[300],
                  ),
                ),

                info("Rating", widget.rating ?? "-"),
                Container(

                  child:
                  Divider(
                    thickness: 1,
                    color: Colors.grey[300],
                  ),
                ),
                info("Type", widget.type ?? "-"),
                Container(

                  child:
                  Divider(
                    thickness: 1,
                    color: Colors.grey[300],
                  ),
                ),


                SizedBox(height: 50,),




              ],
            ),
          ),Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: ElevatedButton(
                      onPressed: widget.trailer != null ? () {
                        _launchUrl(widget.trailer!);
                      } : null, // Menonaktifkan button jika trailer == null
                      child: Text(widget.trailer != null ?"Trailer" :"Unknown"),
                    ),
                  ),

                ],
              ),
            ],
          )





        ],
      ),


    );
  }

  Future<void> _launchUrl(String url) async {
    final Uri _url = Uri.parse(url);
    if (!await launchUrl(_url)) {
      throw Exception('Could Not Launch $_url');
    }
  }

Widget info (String title , String data){

    return Padding(padding:  const EdgeInsets.only(left: 2,right: 7,bottom: 4,top: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title,
          style: TextStyle(
            fontFamily: "Poppins",
            color: Colors.grey[700]
          ),),
          Text(data ,
          style: TextStyle(
            fontFamily: "Poppins",

          ),),


        ],
      ),);
}

  Widget icon (String data, String judul , IconData icon){

    return Column(
      children: [
        Icon(icon,
          size: 35,),
        Text(data,
          style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              fontFamily: "Poppins"
          ),),
        Text(judul,
          style: TextStyle(
              fontSize: 15,
              color: Colors.grey[700],
              fontFamily: "Poppins"
          ),)
      ],
    );
  }
}

