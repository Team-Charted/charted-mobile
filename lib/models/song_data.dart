class Song {
  final String title;
  final String artist;
  final String imageURL;
  final double credits;
  final bool leadSingle;

  Song({
    required this.title,
    required this.artist,
    required this.imageURL,
    required this.credits,
    required this.leadSingle,
  });

  //Getters
  String getTitle() => title;

  String getArtist() => artist;

  String getImageURL() => imageURL;

  double getCredits() => credits;

  bool getLeadSingle() => leadSingle;
}
