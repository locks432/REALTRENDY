import 'package:flutter/material.dart';
import 'package:trendy/views/profile/profile_header.dart';
import 'package:trendy/views/profile/stats_row.dart';
import 'package:trendy/views/profile/floating_media_fab.dart';
import 'package:trendy/views/profile/profile_footer.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 5, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(icon: Icon(Icons.grid_on)),
            Tab(icon: Icon(Icons.video_library)),
            Tab(icon: Icon(Icons.bookmark_border)),
            Tab(icon: Icon(Icons.star_border)),
            Tab(icon: Icon(Icons.trending_up)),
          ],
        ),
      ),
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            const SliverToBoxAdapter(
              child: Column(
                children: [
                  ProfileHeader(),
                  SizedBox(height: 16),
                  StatsRow(),
                ],
              ),
            ),
          ];
        },
        body: Column(
          children: [
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: const [
                  Center(child: Text('Posts')),
                  Center(child: Text('Reels')),
                  Center(child: Text('Highlights')),
                  Center(child: Text('Saved')),
                  Center(child: Text('Trendy Score')),
                ],
              ),
            ),
            const ProfileFooter(),
          ],
        ),
      ),
      floatingActionButton: const FloatingMediaFab(),
    );
  }
}
