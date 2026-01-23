import 'package:flutter/material.dart';
import 'package:fusic/src/rust/api/simple.dart';
import 'package:fusic/src/rust/frb_generated.dart';

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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          // 左侧导航栏
          const NavigationSidebar(),
          // 右侧内容区域
          Expanded(
            child: Column(
              children: [
                // 顶部搜索栏
                const TopSearchBar(),
                // 主要内容
                Expanded(
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // 欢迎信息
                          const WelcomeSection(),
                          // 每日推荐
                          const DailyRecommendation(),
                          // 我喜欢的音乐
                          const LikedMusicSection(),
                          // 推荐歌单
                          const RecommendedPlaylists(),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      // 底部播放控制栏
      bottomNavigationBar: const MusicPlayerBar(),
    );
  }
}

// 左侧导航栏组件
class NavigationSidebar extends StatelessWidget {
  const NavigationSidebar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 240,
      color: const Color(0xFF121212),
      child: Column(
        children: [
          // 应用标题
          const Padding(
            padding: EdgeInsets.all(20.0),
            child: Text(
              '♪ SPlayer',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          // 导航菜单
          Expanded(
            child: ListView(
              children: [
                NavigationItem(
                  icon: Icons.home,
                  title: '为您推荐',
                  isActive: true,
                ),
                NavigationItem(
                  icon: Icons.explore,
                  title: '发现音乐',
                ),
                NavigationItem(
                  icon: Icons.person,
                  title: '私人FM',
                ),
                NavigationItem(
                  icon: Icons.radio,
                  title: '播客电台',
                ),
                const SizedBox(height: 20),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    '我的音乐',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 14,
                    ),
                  ),
                ),
                NavigationItem(
                  icon: Icons.favorite,
                  title: '我喜欢的音乐',
                ),
                NavigationItem(
                  icon: Icons.star,
                  title: '我的收藏',
                ),
                NavigationItem(
                  icon: Icons.cloud,
                  title: '我的云盘',
                ),
                NavigationItem(
                  icon: Icons.music_note,
                  title: '本地音乐',
                ),
                NavigationItem(
                  icon: Icons.history,
                  title: '最近播放',
                ),
              ],
            ),
          ),
          // 底部用户信息
          Container(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              children: [
                const CircleAvatar(
                  radius: 20,
                  backgroundImage: NetworkImage(
                    'https://trae-api-cn.mchost.guru/api/ide/v1/text_to_image?prompt=user%20avatar%20profile%20picture&image_size=square',
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'Ivan的快乐星球',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                        ),
                      ),
                      Text(
                        'VIP',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// 导航菜单项组件
class NavigationItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final bool isActive;

  const NavigationItem({
    Key? key,
    required this.icon,
    required this.title,
    this.isActive = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      color: isActive ? Colors.pink.withOpacity(0.2) : Colors.transparent,
      child: Row(
        children: [
          Icon(
            icon,
            color: isActive ? Colors.pink : Colors.white,
            size: 20,
          ),
          const SizedBox(width: 15),
          Text(
            title,
            style: TextStyle(
              color: isActive ? Colors.pink : Colors.white,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
}

// 顶部搜索栏组件
class TopSearchBar extends StatelessWidget {
  const TopSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20.0),
      color: const Color(0xFF121212),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // 搜索框
          Container(
            width: 400,
            height: 40,
            decoration: BoxDecoration(
              color: const Color(0xFF282828),
              borderRadius: BorderRadius.circular(20),
            ),
            child: const TextField(
              decoration: InputDecoration(
                hintText: '搜索歌曲、歌手、专辑',
                hintStyle: TextStyle(color: Colors.grey),
                prefixIcon: Icon(Icons.search, color: Colors.grey),
                border: InputBorder.none,
                contentPadding: EdgeInsets.symmetric(horizontal: 15),
              ),
              style: TextStyle(color: Colors.white),
            ),
          ),
          // 用户操作按钮
          Row(
            children: [
              IconButton(
                icon: const Icon(Icons.notifications, color: Colors.white),
                onPressed: () {},
              ),
              IconButton(
                icon: const Icon(Icons.settings, color: Colors.white),
                onPressed: () {},
              ),
              const CircleAvatar(
                radius: 16,
                backgroundImage: NetworkImage(
                  'https://trae-api-cn.mchost.guru/api/ide/v1/text_to_image?prompt=user%20avatar%20profile%20picture&image_size=square',
                ),
              ),
              const SizedBox(width: 10),
            ],
          ),
        ],
      ),
    );
  }
}

// 欢迎信息组件
class WelcomeSection extends StatelessWidget {
  const WelcomeSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Text(
          '上午好',
          style: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        Text(
          '让我们听点好音乐',
          style: TextStyle(
            fontSize: 14,
            color: Colors.grey,
          ),
        ),
        SizedBox(height: 30),
      ],
    );
  }
}

// 每日推荐组件
class DailyRecommendation extends StatelessWidget {
  const DailyRecommendation({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 30),
      child: Row(
        children: [
          Container(
            width: 400,
            height: 120,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.purple, Colors.pink],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
              ),
              borderRadius: BorderRadius.circular(8),
            ),
            padding: const EdgeInsets.all(20),
            child: Row(
              children: [
                const CircleAvatar(
                  radius: 40,
                  backgroundImage: NetworkImage(
                    'https://trae-api-cn.mchost.guru/api/ide/v1/text_to_image?prompt=music%20album%20cover%20daily%20recommendation&image_size=square',
                  ),
                ),
                const SizedBox(width: 20),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        '每日推荐',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        '根据你的喜好定制 · 每日更新',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.white70,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 20),
          Expanded(
            child: Container(
              height: 120,
              decoration: BoxDecoration(
                color: const Color(0xFF282828),
                borderRadius: BorderRadius.circular(8),
              ),
              padding: const EdgeInsets.all(20),
              child: Row(
                children: [
                  const CircleAvatar(
                    radius: 40,
                    backgroundImage: NetworkImage(
                      'https://trae-api-cn.mchost.guru/api/ide/v1/text_to_image?prompt=music%20album%20cover%20liked%20songs&image_size=square',
                    ),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text(
                          '我喜欢的音乐',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          '我喜欢的音乐和歌曲',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.white70,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// 我喜欢的音乐组件
class LikedMusicSection extends StatelessWidget {
  const LikedMusicSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            '我喜欢的音乐',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 20),
          Container(
            height: 120,
            decoration: BoxDecoration(
              color: const Color(0xFF282828),
              borderRadius: BorderRadius.circular(8),
            ),
            padding: const EdgeInsets.all(20),
            child: Row(
              children: [
                const CircleAvatar(
                  radius: 40,
                  backgroundImage: NetworkImage(
                    'https://trae-api-cn.mchost.guru/api/ide/v1/text_to_image?prompt=music%20album%20cover%20liked%20songs&image_size=square',
                  ),
                ),
                const SizedBox(width: 20),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        '我喜欢的音乐',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        '我喜欢的音乐和歌曲',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.white70,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// 推荐歌单组件
class RecommendedPlaylists extends StatelessWidget {
  const RecommendedPlaylists({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          '推荐歌单',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 20),
        // 歌单网格
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20,
            childAspectRatio: 0.7,
          ),
          itemCount: 8,
          itemBuilder: (context, index) {
            return PlaylistCard(
              index: index,
            );
          },
        ),
      ],
    );
  }
}

// 歌单卡片组件
class PlaylistCard extends StatelessWidget {
  final int index;

  const PlaylistCard({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // 模拟歌单数据
    final playlists = [
      {
        'title': '车载必备，最劲的开',
        'subTitle': '热曲',
        'cover': 'https://trae-api-cn.mchost.guru/api/ide/v1/text_to_image?prompt=car%20music%20playlist%20cover%20hot%20songs&image_size=square',
        'count': '48.3万',
      },
      {
        'title': '专注纯音乐 | 苦学党的',
        'subTitle': '的静谧',
        'cover': 'https://trae-api-cn.mchost.guru/api/ide/v1/text_to_image?prompt=focus%20music%20playlist%20cover%20study&image_size=square',
        'count': '1.9万',
      },
      {
        'title': '无限循环 | 值得一遍的',
        'subTitle': '冷门曲',
        'cover': 'https://trae-api-cn.mchost.guru/api/ide/v1/text_to_image?prompt=infinite%20loop%20music%20playlist%20cover%20indie&image_size=square',
        'count': '313.5万',
      },
      {
        'title': '英伦摇滚 | 听「像触电',
        'subTitle': '心跳」加速气场爆...',
        'cover': 'https://trae-api-cn.mchost.guru/api/ide/v1/text_to_image?prompt=british%20rock%20music%20playlist%20cover&image_size=square',
        'count': '6.7万',
      },
      {
        'title': '你爱的我，反复翻听：',
        'subTitle': '',
        'cover': 'https://trae-api-cn.mchost.guru/api/ide/v1/text_to_image?prompt=love%20songs%20playlist%20cover%20romantic&image_size=square',
        'count': '414.1万',
      },
      {
        'title': '「古风」明眸皓齿应笑',
        'subTitle': '量，姑过今宵何处去！',
        'cover': 'https://trae-api-cn.mchost.guru/api/ide/v1/text_to_image?prompt=chinese%20ancient%20style%20music%20playlist%20cover&image_size=square',
        'count': '25.5万',
      },
      {
        'title': '律动蓝调：经典R&B天',
        'subTitle': '籁',
        'cover': 'https://trae-api-cn.mchost.guru/api/ide/v1/text_to_image?prompt=r%26b%20music%20playlist%20cover%20rhythm%20and%20blues&image_size=square',
        'count': '23.4万',
      },
      {
        'title': '热歌速递 | 飙升热歌',
        'subTitle': '内销榜',
        'cover': 'https://trae-api-cn.mchost.guru/api/ide/v1/text_to_image?prompt=hot%20songs%20chart%20music%20playlist%20cover&image_size=square',
        'count': '14.4万',
      },
    ];

    final playlist = playlists[index];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // 歌单封面
        Container(
          height: 160,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            image: DecorationImage(
              image: NetworkImage(playlist['cover']!),
              fit: BoxFit.cover,
            ),
          ),
        ),
        const SizedBox(height: 10),
        // 歌单标题
        Text(
          playlist['title']!,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: Colors.white,
          ),
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
        // 歌单副标题
        if (playlist['subTitle']!.isNotEmpty)
          Text(
            playlist['subTitle']!,
            style: const TextStyle(
              fontSize: 12,
              color: Colors.grey,
            ),
          ),
        // 播放次数
        Text(
          playlist['count']!,
          style: const TextStyle(
            fontSize: 12,
            color: Colors.grey,
          ),
        ),
      ],
    );
  }
}

// 底部音乐播放控制栏组件
class MusicPlayerBar extends StatelessWidget {
  const MusicPlayerBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      color: const Color(0xFF181818),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          // 当前播放歌曲信息
          Row(
            children: [
              Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  image: const DecorationImage(
                    image: NetworkImage(
                      'https://trae-api-cn.mchost.guru/api/ide/v1/text_to_image?prompt=music%20album%20cover%20oblivious%20kaleidoscope&image_size=square',
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(width: 15),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    'oblivious',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    'Kalafina',
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
              IconButton(
                icon: const Icon(Icons.favorite, color: Colors.pink),
                onPressed: () {},
              ),
            ],
          ),
          // 播放控制按钮
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.shuffle, color: Colors.white),
                      onPressed: () {},
                    ),
                    IconButton(
                      icon: const Icon(Icons.skip_previous, color: Colors.white),
                      onPressed: () {},
                    ),
                    IconButton(
                      icon: const Icon(Icons.pause_circle_outline, size: 32, color: Colors.white),
                      onPressed: () {},
                    ),
                    IconButton(
                      icon: const Icon(Icons.skip_next, color: Colors.white),
                      onPressed: () {},
                    ),
                    IconButton(
                      icon: const Icon(Icons.repeat, color: Colors.white),
                      onPressed: () {},
                    ),
                  ],
                ),
                // 进度条
                Container(
                  width: 400,
                  height: 20,
                  child: Row(
                    children: [
                      const Text(
                        '02:08',
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey,
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Container(
                          height: 4,
                          decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(2),
                          ),
                          child: Container(
                            width: 100,
                            height: 4,
                            decoration: BoxDecoration(
                              color: Colors.pink,
                              borderRadius: BorderRadius.circular(2),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      const Text(
                        '04:30',
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          // 右侧控制按钮
          Row(
            children: [
              IconButton(
                icon: const Icon(Icons.devices, color: Colors.white),
                onPressed: () {},
              ),
              IconButton(
                icon: const Icon(Icons.queue_music, color: Colors.white),
                onPressed: () {},
              ),
              IconButton(
                icon: const Icon(Icons.volume_up, color: Colors.white),
                onPressed: () {},
              ),
            ],
          ),
        ],
      ),
    );
  }
}

