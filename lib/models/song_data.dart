class Song {
  /*
  {
        "_id": "611ed0d18fafe12e9c6e3946",
        "points": 0.75,
        "title": "Stay",
        "artist": "The Kid LAROI",
				"imageURL": "https://images.genius.com/8205d3bffef4559d465e64cc862876a5.1000x1000x1.jpg",
        "leadSingle": true
    },
  */

  final String id;
  final String title;
  final String artist;
  final String imageURL;
  final double value;
  bool leadSingle;

  Song({
    required this.id,
    required this.title,
    required this.artist,
    required this.imageURL,
    required this.value,
    required this.leadSingle,
  });

  //Getters
  String getId() => id;

  String getTitle() => title;

  String getArtist() => artist;

  String getImageURL() => imageURL;

  double getValue() => value;

  bool getLeadSingle() => leadSingle;

  void setLeadSingle() => this.leadSingle = true;

  //Decoding json object
  Song.fromJson(Map<String, dynamic> json)
      : id = json['songId'],
        title = json['title'],
        artist = json['artist'],
        value = json['points'] == null
            ? json['credits'].toDouble()
            : json['points'].toDouble(),
        imageURL = json['imageURL'],
        leadSingle = json['leadSingle'] != null;

  //Encoding json
  Map<String, dynamic> toJson() {
    return {
      'title': getTitle(),
      'songId': getId(),
      'imageURL': getImageURL(),
      'artist': getArtist(),
      'credits': getValue(),
      'leadSingle': getLeadSingle()
    };
  }

  //Equals operator overriding
  @override
  bool operator ==(Object other) =>
      other is Song && other.runtimeType == runtimeType && other.id == this.id;

  @override
  int get hashCode => super.hashCode;
}
