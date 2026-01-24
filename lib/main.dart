import 'package:flutter/material.dart';
import 'package:fusic/src/rust/api/simple.dart';
import 'package:fusic/src/rust/frb_generated.dart';
import './models/music_models.dart';
import './utils/music_utils.dart';
import './components/navigation_sidebar.dart';
import './components/top_search_bar.dart';
import './components/main_content.dart';
import './components/music_player_bar.dart';

Future<void> main() async {
  await RustLib.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.pink,
        scaffoldBackgroundColor: Colors.black,
        textTheme: const TextTheme(
          bodyLarge: TextStyle(color: Colors.white),
          bodyMedium: TextStyle(color: Colors.grey),
        ),
      ),
      home: const MusicPlayerApp(),
    );
  }
}

class MusicPlayerApp extends StatefulWidget {
  const MusicPlayerApp({super.key});

  @override
  State<MusicPlayerApp> createState() => _MusicPlayerAppState();
}

class _MusicPlayerAppState extends State<MusicPlayerApp> {
  // 模拟数据
  late User user;
  late List<NavigationItem> navigationItems;
  late List<NavigationItem> myMusicItems;
  late List<Song> songs;
  late List<Playlist> playlists;
  late Song currentSong;
  
  // 状态
  bool isPlaying = true;
  int currentPosition = 128; // 2分08秒

  @override
  void initState() {
    super.initState();
    // 初始化模拟数据
    user = generateMockUser();
    navigationItems = generateMockNavigationItems();
    myMusicItems = generateMockMyMusicItems();
    songs = generateMockSongs();
    playlists = generateMockPlaylists();
    currentSong = songs[0];
  }

  // 导航项点击事件
  void onNavigationItemTap(String itemId) {
    setState(() {
      // 更新导航项的激活状态
      for (var item in navigationItems) {
        item.isActive = item.id == itemId;
      }
      for (var item in myMusicItems) {
        item.isActive = item.id == itemId;
      }
    });
    print('Navigation item tapped: $itemId');
  }

  // 搜索事件
  void onSearch(String query) {
    print('Searching for: $query');
  }

  // 通知按钮点击事件
  void onNotificationsTap() {
    print('Notifications tapped');
  }

  // 设置按钮点击事件
  void onSettingsTap() {
    print('Settings tapped');
  }

  // 用户头像点击事件
  void onUserProfileTap() {
    print('User profile tapped');
  }

  // 歌单点击事件
  void onPlaylistTap(Playlist playlist) {
    print('Playlist tapped: ${playlist.title}');
  }

  // 每日推荐点击事件
  void onDailyRecommendationTap() {
    print('Daily recommendation tapped');
  }

  // 我喜欢的音乐点击事件
  void onLikedMusicTap() {
    print('Liked music tapped');
  }

  // 播放/暂停点击事件
  void onPlayPause() {
    setState(() {
      isPlaying = !isPlaying;
    });
    print('Play/pause toggled: $isPlaying');
  }

  // 上一曲点击事件
  void onPrevious() {
    setState(() {
      int currentIndex = songs.indexOf(currentSong);
      if (currentIndex > 0) {
        currentSong = songs[currentIndex - 1];
      }
    });
    print('Previous song');
  }

  // 下一曲点击事件
  void onNext() {
    setState(() {
      int currentIndex = songs.indexOf(currentSong);
      if (currentIndex < songs.length - 1) {
        currentSong = songs[currentIndex + 1];
      }
    });
    print('Next song');
  }

  // 随机播放点击事件
  void onShuffle() {
    print('Shuffle toggled');
  }

  // 循环播放点击事件
  void onRepeat() {
    print('Repeat toggled');
  }

  // 喜欢/取消喜欢点击事件
  void onLike() {
    setState(() {
      currentSong.isLiked = !currentSong.isLiked;
    });
    print('Like toggled: ${currentSong.isLiked}');
  }

  // 设备连接点击事件
  void onDevices() {
    print('Devices tapped');
  }

  // 播放队列点击事件
  void onQueue() {
    print('Queue tapped');
  }

  // 音量控制点击事件
  void onVolume() {
    print('Volume tapped');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          // 左侧导航栏
          NavigationSidebar(
            user: user,
            navigationItems: navigationItems,
            myMusicItems: myMusicItems,
            onNavigationItemTap: onNavigationItemTap,
          ),
          // 右侧内容区域
          Expanded(
            child: Column(
              children: [
                // 顶部搜索栏
                TopSearchBar(
                  user: user,
                  onSearch: onSearch,
                  onNotificationsTap: onNotificationsTap,
                  onSettingsTap: onSettingsTap,
                  onUserProfileTap: onUserProfileTap,
                ),
                // 主要内容
                Expanded(
                  child: MainContent(
                    playlists: playlists,
                    onPlaylistTap: onPlaylistTap,
                    onDailyRecommendationTap: onDailyRecommendationTap,
                    onLikedMusicTap: onLikedMusicTap,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      // 底部播放控制栏
      bottomNavigationBar: MusicPlayerBar(
        currentSong: currentSong,
        isPlaying: isPlaying,
        currentPosition: currentPosition,
        onPlayPause: onPlayPause,
        onPrevious: onPrevious,
        onNext: onNext,
        onShuffle: onShuffle,
        onRepeat: onRepeat,
        onLike: onLike,
        onDevices: onDevices,
        onQueue: onQueue,
        onVolume: onVolume,
      ),
    );
  }
}

