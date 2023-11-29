import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:practica_ef_partysoul/models/joke.dart';

class HttpHelper{
  final String urlBase = 'https://icanhazdadjoke.com/slack';

  Future<Joke> getJoke() async{
    http.Response response = await http.get(Uri.parse(urlBase));

    if (response.statusCode == 200){
      final jsonResponse = json.decode(response.body);
      return Joke.fromJson(jsonResponse["attachments"][0] as Map<String, dynamic>);
    }
    else{
      throw Exception('Error al cargar los datos');
    }
  }
}