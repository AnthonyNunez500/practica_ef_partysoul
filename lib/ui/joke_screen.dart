import 'package:flutter/material.dart';
import 'package:practica_ef_partysoul/models/joke.dart';
import 'package:practica_ef_partysoul/ui/joke_card.dart';

import '../services/http_helper.dart';

class JokeScreen extends StatefulWidget {
  const JokeScreen({super.key});

  @override
  State<JokeScreen> createState() => _JokeScreenState();
}

class _JokeScreenState extends State<JokeScreen> {
  late Future<Joke> joke;
  late HttpHelper helper;
  late JokeCard jokeCard;
  @override
  void initState(){
    helper = HttpHelper();
    joke = helper.getJoke();
    jokeCard = JokeCard(joke: joke);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Joke"),
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            jokeCard,
            SizedBox(height: 64),
            ElevatedButton(
                onPressed: (){
                  setState(() {
                    joke = helper.getJoke();
                    jokeCard = JokeCard(joke: joke);
                    jokeCard.createElement();
                    jokeCard.createState();
                  });
                },
                child: Text("new joke")
            )
          ],
        ),
      ),
    );
  }
}
