// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_application_4/models/playlist_model.dart';
import '../models/song_model.dart';
import '../widgets/playlist_card.dart';
import '../widgets/section_header.dart';
import '../widgets/song_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Song> songs = Song.songs;
    final List<Playlist> playlist = Playlist.playlists;
    return Container(
      decoration: BoxDecoration(
          //sayfayı mordan açık mora yapan kod kısmı
          gradient: LinearGradient(begin: Alignment.topCenter, end: Alignment.bottomCenter, colors: [
        Colors.deepPurple.shade800.withOpacity(0.8),
        Colors.deepPurple.shade200.withOpacity(0.8),
      ])),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: const _CustomAppBar(),
        bottomNavigationBar: const _CustomNavBar(),
        body: SingleChildScrollView(
          child: Column(
            children: [const _DiscoverMusic(), _TrendingMusic(songs: songs), _PlaylistMusic(playlist: playlist)],
          ),
        ),
      ),
    );
  }
}

class _PlaylistMusic extends StatelessWidget {
  const _PlaylistMusic({
    Key? key,
    required this.playlist,
  }) : super(key: key);

  final List<Playlist> playlist;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          const SectionHeader(title: 'PlayList'),
          ListView.builder(
            padding: const EdgeInsets.only(top: 20),
            physics: const NeverScrollableScrollPhysics(), //her yerden kaymasını sağladı
            shrinkWrap: true,
            itemCount: playlist.length,
            itemBuilder: (context, index) {
              return PlaylistCard(playlist: playlist[index]);
            },
          ),
        ],
      ),
    );
  }
}

class _TrendingMusic extends StatelessWidget {
  const _TrendingMusic({
    Key? key,
    required this.songs,
  }) : super(key: key);

  final List<Song> songs;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 20,
        top: 20,
        bottom: 20,
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: Column(
              children: const [
                SectionHeader(
                  title: 'Trending Music',
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.27,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: songs.length,
              itemBuilder: (context, index) {
                return SongCard(song: songs[index]);
              },
            ),
          )
        ],
      ),
    );
  }
}

class _DiscoverMusic extends StatelessWidget {
  const _DiscoverMusic({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Welcome Maestro's Musics",
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          const SizedBox(height: 5),
          Text(
            'Enjoy your favorite music',
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),
          TextFormField(
            decoration: InputDecoration(
              isDense: true,
              filled: true,
              fillColor: Colors.white,
              hintText: 'Search',
              hintStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Colors.grey.shade400,
                  ),
              prefixIcon: Icon(
                Icons.search,
                color: Colors.grey.shade400,
              ),
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(15), borderSide: BorderSide.none),
            ),
          )
        ],
      ),
    );
  }
}

class _CustomNavBar extends StatelessWidget {
  const _CustomNavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.deepPurple.shade800,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.favorite_outline), label: 'Favorite'),
          BottomNavigationBarItem(icon: Icon(Icons.play_circle_fill_outlined), label: 'Play'),
          BottomNavigationBarItem(icon: Icon(Icons.people_outline), label: 'Profile'),
        ]);
  }
}

class _CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  const _CustomAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: const Icon(Icons.grid_view_rounded),
      actions: [
        Container(
          margin: const EdgeInsets.only(right: 20),
          child: const CircleAvatar(
            backgroundImage: NetworkImage(
                'https://img-s1.onedio.com/id-63ecd15077da865734143d5d/rev-0/w-620/f-jpg/s-53702f61bb7530ce8d2a1b535aa17babc34a2bf7.jpg'),
          ),
        )
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(56.0);
}
