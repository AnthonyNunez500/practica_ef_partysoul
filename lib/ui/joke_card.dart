import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:practica_ef_partysoul/models/joke.dart';

import '../services/db_helper.dart';

class JokeCard extends StatefulWidget {
  Future<Joke> joke;
  JokeCard({super.key, required this.joke});

  @override
  State<JokeCard> createState() => _JokeCardState();
}

class _JokeCardState extends State<JokeCard> {
  DbHelper dbHelper = DbHelper();
  double rating = 0;
  @override
  void initState(){
    DbHelper.dbHelper.openDb();
    rating = 0;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: widget.joke,
        builder: (context, snapshot){
          if(snapshot.hasData){
            snapshot.data!.rating = 0;
            /*if(snapshot.data!.rating != null){
              rating = snapshot.data!.rating!;
            }*/
            return Center(
              child: StatefulBuilder(
                builder: (BuildContext context, void Function(void Function()) setState) {
                  return Card(
                    color: Colors.white,
                    elevation: 2.0,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("${snapshot.data!.text}"),
                        RatingBar(
                            minRating: 0,
                            itemCount: 5,
                            initialRating: 0,
                            ratingWidget: RatingWidget(
                                full: Icon(Icons.star),
                                half: Icon(Icons.star_half),
                                empty: Icon(Icons.star_outline),
                            ),
                            onRatingUpdate: (_rating){
                              setState((){
                                rating = _rating;
                                snapshot.data!.rating = rating;
                                dbHelper.insertFavorite(snapshot.data ?? Joke());
                              });
                            }
                        )
                      ],
                    ),
                  );
                }
              ),
            );
          }
          else if(snapshot.hasError){
            return Text('${snapshot.error}');
          }
          return const CircularProgressIndicator();
        }
    );
  }
}
