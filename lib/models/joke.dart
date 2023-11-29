//https://javiercbk.github.io/json_to_dart/

class Joke {
  int? id;
  String? text;
  double? rating;

  Joke({this.text, this.rating});

  Joke.fromJson(Map<String, dynamic> json) {
    id = 0;
    text = json['text'];
    rating = null;
  }

  Joke.fromDb(Map<String, dynamic> json) {
    id = json['id'];
    text = json['text'];
    rating = json['rating'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = (id == 0)? null : id;
    data['text'] = this.text;
    data['rating'] = this.rating;
    return data;
  }
}