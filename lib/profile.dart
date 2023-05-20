import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:rillanime/DetailPage.dart';
import 'package:rillanime/favorite.dart';
import 'package:rillanime/konversiuang.dart';
import 'package:rillanime/setting.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'fetch.dart';
import 'main.dart';
import 'model/user.dart';

class profile extends StatefulWidget {
  const profile({Key? key}) : super(key: key);

  @override
  State<profile> createState() => _profileState();
}

class _profileState extends State<profile> {

  late Box<UserModel> _myBox;
  late SharedPreferences _prefs;
  late String username = '';
  late Future<List<dynamic>> favData = Future.value([]);


  void initState() {
    super.initState();
    _myBox = Hive.box(boxName);

    _openBox();
    loadUsername().then((_) {
      favData = GetFavorite().getFavoritesData(username).catchError((error) {
        print(error);
        return [];
      });

    });

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


  @override
  Widget build(BuildContext context) {
    final user = _myBox.get(username);

    return Scaffold(
      backgroundColor:Background,
      body: ListView(
        children: [
          Stack(
            children: [
              Container(
                height: 400,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(user?.image ?? 'fallback_image_path'),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.only(bottomLeft: Radius.circular(50), bottomRight: Radius.circular(50)),
                ),
              ),
              Container(
                height: 400,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(bottomLeft: Radius.circular(50), bottomRight: Radius.circular(50)),
                  color: Colors.black.withOpacity(0.85),
                ),
              ),
              Positioned(
                top: 10,
                right: 5,
                child:
                // IconButton(
                //   icon: Icon(
                //     Icons.logout,
                //     color: Colors.white,
                //     size: 30,
                //   ),
                //   onPressed: () {
                //     _myBox.close();
                //     _prefs.setBool('isLoggedIn', false);
                //     _prefs.remove('username');
                //     Navigator.pushReplacement(
                //       context,
                //       MaterialPageRoute(builder: (context) => MyApp(isLoggedIn: false)),
                //     );
                //   },
                // ),
                IconButton(
                  icon: Icon(
                    Icons.settings,
                    color: Colors.white,
                    size: 30,
                  ),
                  onPressed: () {

                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => setting() ),
                    );
                  },
                ),
              ),
              Positioned(
                top: 200,
                left: 0,
                right: 0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 60,
                      backgroundImage: AssetImage(user?.image ?? 'fallback_image_path'),
                    ),
                    SizedBox(height: 10,),
                    Text(user?.Name ?? 'Unknown',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontFamily: "Raleway",
                          fontWeight: FontWeight.bold
                      ),
                    ),
                    SizedBox(height: 2,),
                    Text("@" + username,
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 18,
                        fontFamily: "Raleway",
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),

          SizedBox(height: 20,),
          InkWell(
            onTap: (){
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => favorites()));
            },
            child:
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  margin: EdgeInsets.only(left: 10),
                  child: Text("Favorites Anime" ,
                    style: TextStyle(
                        fontFamily: "Raleway",
                        color: Colors.white,
                        fontWeight: FontWeight.bold,

                        fontSize: 23
                    ),),
                ),
                Icon(Icons.chevron_right,
                  color: Colors.white,
                  size: 35,)
              ],
            ),
          ),
          SizedBox(height: 20,),
          FutureBuilder<List<dynamic>>(
            future: favData,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else if (snapshot.hasError) {
                return Center(
                  child: Text('Error: ${snapshot.error}'),
                );
              } else {
                final fav = snapshot.data ?? [];

                if (fav.isEmpty) {
                  return Center(
                    child: Text('Tidak ada favorit yang tersimpan1.',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 17,
                          fontFamily: "Raleway"
                      ),
                    ),
                  );
                }

                return ValueListenableBuilder(
                  valueListenable: _myBox.listenable(),
                  builder: (context, Box<UserModel> box, _) {
                    if (box.isEmpty) {
                      return Center(
                        child: Text('Tidak ada favorit yang tersimpan2.',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 17,
                              fontFamily: "Raleway"
                          ),),
                      );
                    }



                    if (user == null ||
                        user.favorites == null ||
                        user.favorites!.isEmpty) {
                      return Center(
                        child: Text('Tidak ada favorit yang tersimpan3.',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 17,
                              fontFamily: "Raleway"
                          ),),
                      );
                    }

                    return SizedBox(
                      height: 250,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount:  fav.length,
                        itemBuilder: (context, index) {
                          final anime = fav[index];
                          return Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 3),
                            child: Aired(anime),
                          );
                        },
                      ),
                    );
                  },
                );
              }
            },
          ),
        ],
      ),


    );
  }

  Container Aired(Map<String, dynamic> animeData) {
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

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),



      ),
      margin: EdgeInsets.symmetric(horizontal: 8),
      width: 370,


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
            Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(imageUrl!),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.circular(10)
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.7),
                  borderRadius: BorderRadius.circular(10)
              ),

            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                height: 120,
                decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(10)
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
                      height: 190,
                      width: 130,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(imageUrl!),
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Stack(
                        children: [
                          Positioned.fill(
                            child: Container(
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  begin: Alignment.bottomCenter,
                                  end: Alignment.topCenter,
                                  colors: [
                                    Colors.black.withOpacity(0.7),
                                    Colors.transparent,
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.bottomRight,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Icon(
                                    Icons.star,
                                    color: Colors.yellow,
                                  ),
                                  SizedBox(width: 4),
                                  Text(
                                    score?.toString() ?? 'N/A',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontFamily: "Poppins",
                                    ),
                                  ),

                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),


                    SizedBox(width: 16),
                    Expanded(
                        child: Container(
                          alignment: Alignment.bottomLeft,
                          height: 90,

                          child:
                          Text(
                            title!,
                            style: TextStyle(
                              fontSize: 19,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontFamily: "Raleway",
                            ),
                          ),
                        )
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 90,
              left: 150,
              right: 0,
              child: SizedBox(
                height: 20,
                child: ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemCount: genres?.length ?? 0,
                  itemBuilder: (context, index) {
                    final genreText = index == (genres?.length ?? 0) - 1
                        ? (genres?[index] ?? 'Unknown Genre')
                        : '${genres?[index]}, ';

                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 0),
                      child: Text(
                        genreText,
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                          fontFamily: "Raleway",
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),





          ],
        ),
      ),
    );


  }

  Container _buildAnimeCard(Map<String, dynamic> animeData) {
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

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.0),
        image: DecorationImage(
          image: NetworkImage(imageUrl!),
          fit: BoxFit.cover,

        ),
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
              )
              )
          );
        },
        child: Stack(
          children: [

            Positioned(
              top: 0,
              right: 0,
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.7),
                    borderRadius:BorderRadius.circular(5)
                ),
                padding: const EdgeInsets.all(8),
                child: Row(
                  children: [
                    Icon(
                      Icons.star,
                      color: Colors.yellow,
                      size: 12,
                    ),
                    SizedBox(width: 4),
                    Text(
                      score != null ? score.toString() : 'N/A',
                      style: TextStyle(
                        fontSize: 12,
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
                    bottomLeft: Radius.circular(5),
                    bottomRight: Radius.circular(5),
                  ),
                ),
                padding: const EdgeInsets.all(8),
                child: Text(
                  title!.length > 15 ? '${title!.substring(0, 15)}...' : title!,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 12,
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


