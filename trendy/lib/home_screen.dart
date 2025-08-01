import 'package:flutter/material.dart';
import 'package:trendy/api_service.dart';
import 'package:trendy/data/dummy_data.dart';
import 'package:trendy/discover_screen.dart';
import 'package:trendy/profile_screen.dart';
import 'package:trendy/views/feed_view.dart';
import 'package:trendy/views/notification_screen.dart';
import 'package:trendy/views/chat/conversation_list_screen.dart';
import 'package:trendy/views/post_creation/post_creation_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  late Future<List<Post>> _feed;

  @override
  void initState() {
    super.initState();
    _feed = _fetchFeed();
  }

  Future<List<Post>> _fetchFeed() async {
    final apiService = ApiService();
    final movies = await apiService.getPopularMovies();
    final songs = await apiService.getNewReleases();

    final List<Post> posts = [];
    posts.addAll(movies.map((movie) => Post(item: movie, type: PostType.movie)));
    posts.addAll(songs.map((song) => Post(item: song, type: PostType.song)));

    posts.shuffle();

    return posts;
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> widgetOptions = <Widget>[
      FutureBuilder<List<Post>>(
        future: _feed,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return FeedView(posts: snapshot.data!);
          } else if (snapshot.hasError) {
            return Center(
              child: Text('${snapshot.error}'),
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
      const DiscoverScreen(),
      const PostCreationScreen(),
      const ProfileScreen(),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Trendy'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const NotificationScreen(),
                ),
              );
            },
            icon: const Icon(Icons.notifications_none),
          ),
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ConversationListScreen(),
                ),
              );
            },
            icon: const Icon(Icons.message_outlined),
          ),
        ],
      ),
      body: widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Discover',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_box_outlined),
            label: 'Post',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
      ),
    );
  }
}
