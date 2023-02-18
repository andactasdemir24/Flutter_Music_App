import 'song_model.dart';

class Playlist {
  final String title;
  final List<Song> songs;
  final String imageUrl;

  Playlist({
    required this.title,
    required this.songs,
    required this.imageUrl,
  });

  static List<Playlist> playlists = [
    Playlist(
      title: 'MaeSpace',
      songs: Song.songs,
      imageUrl: 'https://i.scdn.co/image/ab67616d00001e0289281fc8d23e142e908d9808',
    ),
    Playlist(
      title: 'Sokagın Rüyası',
      songs: Song.songs,
      imageUrl: 'http://images.genius.com/1f3c94409cb4adc0d5ce0a052be6d50f.500x500x1.jpg',
    ),
    Playlist(
      title: 'Bataklık',
      songs: Song.songs,
      imageUrl: 'https://i.scdn.co/image/ab67616d0000b27316f9c2a87b22921c7058f8a3',
    )
  ];
}
