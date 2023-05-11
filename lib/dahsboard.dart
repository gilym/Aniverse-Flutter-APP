import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:http/http.dart';
import 'package:rillanime/DetailPage.dart';
import 'package:rillanime/viewbygenre.dart';
import 'package:rillanime/viewmore.dart';
import 'package:url_launcher/url_launcher.dart';
import 'fetch.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';


class Dashboard extends StatefulWidget {

  const Dashboard({Key? key,}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  late List<dynamic> alldata;
  late List<dynamic> topanime;
  late List<dynamic> genreanime;
  late List<dynamic> upcoming;
  late List<dynamic> airing;
  late List<dynamic> popular;


  @override
  void initState() {
    super.initState();
    alldata = [];
    topanime = [];
    // Fetchall.fetchall().then((data) {
    //   setState(() {
    //     alldata = data;
    //   });
    // }).catchError((error) {
    //   print(error);
    // });

    getTop.fetchtop().then((data) {
      setState(() {
        topanime = data;
      });
    }).catchError((error) {
      print(error);
    });

    getGenre.fetchGenre().then((data) {
      setState(() {
        genreanime = data;
      });
    }).catchError((error) {
      print(error);
    });

    getUpcoming.getupcoming().then((data) {
      setState(() {
        upcoming = data;
      });
    }).catchError((error) {
      print(error);
    });
    getAired.getaired().then((data) {
      setState(() {
        airing = data;
      });
    }).catchError((error) {
      print(error);
    });
    getMostpopular.getpopular().then((data) {
      setState(() {
        popular = data;
      });
    }).catchError((error) {
      print(error);
    });

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(

        backgroundColor: Color(0xFFEEEEEE),
        appBar: AppBar(
          backgroundColor: Color(0xFFEEEEEE),

          elevation: 0,
        title: const Text(
          'Anime Page',
          style: TextStyle(
            color: Colors.black,
            fontFamily: "Poppins",
            fontWeight: FontWeight.bold,
            fontSize: 25,
          ),
        ),
        actions: [

        ],
      )
,
      body: ListView(
        children: [
          InkWell(
            onTap: (){
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => viewmore(
                    data: topanime.sublist(0,25),

                    title: "Top Rating Anime",

                  )));
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  margin: EdgeInsets.only(left: 10),
                  child: Text("Top Rating Anime" ,
                    style: TextStyle(
                        fontFamily: "Poppins",
                        fontWeight: FontWeight.w400,
                        fontSize: 20
                    ),),
                ),
                Icon(Icons.chevron_right,
                size: 35,)
              ],
            )
          ),
          SizedBox(
            height: 10,
          ),
          SizedBox(
            height: 260,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,

              itemCount: 25,
              itemBuilder: (context, index) {
                final anime = topanime[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: _buildAnimeCard(anime),
                );
              },
            ),
          ),
          SizedBox(
            height: 20,
          ),
          InkWell(
              onTap: (){
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => viewmore(
                      data: genreanime,
                        title: "Genres",

                    )));
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 10),
                    child: Text("Genres" ,
                      style: TextStyle(
                          fontFamily: "Poppins",
                          fontWeight: FontWeight.w400,
                          fontSize: 20
                      ),),
                  ),
                  Icon(Icons.chevron_right,
                    size: 35,)
                ],
              )
          ),
          SizedBox(
            height: 50,
            child:ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: genreanime.where((genre) => genre['mal_id'] >= 1 && genre['mal_id'] <= 10).length,
              itemBuilder: (context, index) {
                final genre1 = genreanime.where((genre) => genre['mal_id'] >= 1 && genre['mal_id'] <= 10).toList()[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: _Genres(genre1),
                );
              },
            )
            ,
          ),
          SizedBox(
            height: 20,
          ),
          InkWell(
              onTap: (){
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => viewmore(
                      data: upcoming,

                      title: "Upcoming",

                    )));
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 10),
                    child: Text("Upcoming" ,
                      style: TextStyle(
                          fontFamily: "Poppins",
                          fontWeight: FontWeight.w400,
                          fontSize: 20
                      ),),
                  ),
                  Icon(Icons.chevron_right,
                    size: 35,)
                ],
              )
          ),
          SizedBox(
            height: 260,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,

              itemCount:  upcoming.length,
              itemBuilder: (context, index) {
                final anime = upcoming[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: _buildAnimeCard(anime),
                );
              },
            ),
          ),
          SizedBox(
            height: 20,
          ),
          InkWell(
              onTap: (){
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => viewmore(
                      data: airing,

                      title: "Currently Airing",

                    )));
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 10),
                    child: Text("Currently Airing" ,
                      style: TextStyle(
                          fontFamily: "Poppins",
                          fontWeight: FontWeight.w400,
                          fontSize: 20
                      ),),
                  ),
                  Icon(Icons.chevron_right,
                    size: 35,)
                ],
              )
          ),
          SizedBox(
            height: 260,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,

              itemCount:  airing.length,
              itemBuilder: (context, index) {
                final anime = airing[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: _buildAnimeCard(anime),
                );
              },
            ),
          ),
          SizedBox(
            height: 20,
          ),
          InkWell(
              onTap: (){
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => viewmore(
                      data: popular,

                      title: "Most Popular",

                    )));
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 10),
                    child: Text("Most Popular2" ,
                      style: TextStyle(
                          fontFamily: "Poppins",
                          fontWeight: FontWeight.w400,
                          fontSize: 20
                      ),),
                  ),
                  Icon(Icons.chevron_right,
                    size: 35,)
                ],
              )
          ),
          SizedBox(
            height: 260,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,

              itemCount:  popular.length,
              itemBuilder: (context, index) {
                final anime = popular[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: _buildAnimeCard(anime),
                );
              },
            ),
          ),



        ],
      )


    );
  }
  Container _Genres (Map<String, dynamic> Gen){
    final name = Gen ['name'] as String;
    // print(topanime.length);
    return Container(

      child: InkWell(
        onTap:  (){
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => viewbygenre(
                data: topanime,
                title: name,

              )));
        },
        child: Padding(
          padding: const EdgeInsets.all(0.0),
          child: Chip(
            label: Text(name),
            backgroundColor: Colors.grey[300],
            labelStyle: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w700,
                fontSize: 16,
                fontFamily: "Raleway"
            ),
          ),
        ),
      )
    );

  }

  Card _buildAnimeCard(Map<String, dynamic> animeData) {
    final temp = animeData;

    final title = animeData['title'] as String?;
    final imageUrl = animeData['images']['jpg']['image_url'] as String?;
    final score = animeData['score'] is int ? animeData['score'].toDouble() : animeData['score'];
    final url = animeData['url'] as String?;
    final synopsis = animeData['synopsis'] as String?;
    final id = animeData['mal_id'] as int;
    final trailer = animeData['trailer']['url'] as String?;
    final genres = (animeData['genres'] as List).map((
        genre) => genre['name'] as String).toList();
    final episodes = animeData['episodes'] as int?;
    final duration = animeData['duration'] as String?;
    final rank = animeData['rank'] as int?;
    final favorite = animeData['favorites'] as int?;
    final member = animeData['members'] as int?;
    final popularity = animeData['popularity'] as int?;
    final status =animeData['status'] as String?;
    final season =animeData['season'] as String?;
    final studios = animeData['studios'];
    final studio = studios != null && studios.isNotEmpty && studios[0] != null ? studios[0]['name'] as String? : '';
    final source =animeData['source'] as String?;
    final rating =animeData['rating'] as String?;
    final idyoutube = animeData['trailer']['youtube_id'] as String?;
    final type =animeData['type'] as String?;

    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: InkWell(
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => AnimeDetailScreen(
                title: title,
                imageUrl: imageUrl,
                url: url,
                synopsis: synopsis,
                id: id,
                score: score,
                trailer: trailer,
                genres: genres,
                episodes: episodes,
                duration: duration,
                ranking: rank,
                favorite: favorite,
                member: member,
                popularity: popularity,
                status: status,
                season: season,
                studio: studio,
                source: source,
                rating: rating,
                idyoutube: idyoutube,
                type: type,
              )));
        },
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.network(
                imageUrl!,
                fit: BoxFit.fill,
              ),
            ),
            Positioned(
              top: 0,
              right: 0,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.7),
                  borderRadius:BorderRadius.circular(16)
                ),
                padding: const EdgeInsets.all(8),
                child: Row(
                  children: [
                    Icon(
                      Icons.star,
                      color: Colors.yellow,
                      size: 20,
                    ),
                    SizedBox(width: 4),
                    Text(
                      score != null ? score.toString() : 'N/A',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontFamily: 'Poppins',
                      ),
                    ),

                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.5),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(16),
                    bottomRight: Radius.circular(16),
                  ),
                ),
                padding: const EdgeInsets.all(8),
                child: Text(
                  title!,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontFamily: "Raleway"
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
