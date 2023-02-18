class Song {
  final String title;
  final String description;
  final String url;
  final String coverUrl;

  Song({required this.title, required this.description, required this.url, required this.coverUrl});

  static List<Song> songs = [
    Song(
      title: 'Semt işi',
      description: 'Glass',
      url: 'assets/music/glass.mp3',
      coverUrl: 'assets/images/glass.jpg',
    ),
    Song(
      title: 'Allah Korusun',
      description: 'Illusions',
      url: 'assets/music/illusions.mp3',
      coverUrl: 'assets/images/illusions.jpg',
    ),
    Song(
      title: 'Karanlık Suratlar',
      description: 'Pray',
      url: 'assets/music/pray.mp3',
      coverUrl: 'assets/images/pray.jpg',
    )
  ];
}
