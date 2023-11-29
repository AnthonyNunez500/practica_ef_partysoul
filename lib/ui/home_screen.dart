import 'package:flutter/material.dart';
import 'package:practica_ef_partysoul/ui/favorite_card.dart';
import 'package:practica_ef_partysoul/ui/joke_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("PartySoul"),
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: ClipOval(
                child: Image.asset(
                  'assets/skeletonG.png',
                  width: 200,
                  height: 200,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: 64),
            // Mostrar el jajas
            FavoriteCard(),
            SizedBox(height: 64),
            ElevatedButton(
                onPressed: (){
                  Navigator.push(context,  MaterialPageRoute(builder: (context)=>
                      JokeScreen()));
                },
                child: Text("J O K E S")
            )
          ],
        ),
      ),
    );
  }
}
