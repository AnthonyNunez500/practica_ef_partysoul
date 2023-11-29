import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:practica_ef_partysoul/models/joke.dart';

import '../services/db_helper.dart';

class FavoriteCard extends StatefulWidget {
  const FavoriteCard({super.key});

  @override
  State<FavoriteCard> createState() => _FavoriteCardState();
}

class _FavoriteCardState extends State<FavoriteCard> {
  DbHelper dbHelper = DbHelper();
  Joke? joke;
  @override
  void initState() {
    DbHelper.dbHelper.openDb();
    super.initState();
  }
  Future getBest() async {
    await dbHelper.openDb();
    joke = await dbHelper.getBestFavorite();
    setState(() {
      joke = joke;
    });
  }
  @override
  Widget build(BuildContext context) {
    getBest();

    return Center(
      child: StatefulBuilder(
          builder: (BuildContext context, void Function(void Function()) setState) {
            if (joke != null){
              return Card(
                color: Colors.white,
                elevation: 2.0,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("${joke!.text}"),
                    SizedBox(height: 16),
                    Row(
                      children: [
                        Icon(Icons.star_outlined),
                        Text("${joke!.rating}"),
                      ],
                    )
                  ],
                ),
              );
            }
            else{
              return Text("No jokes yet");
            }
          }
      ),
    );;
  }
}
