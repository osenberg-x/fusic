// 音乐相关的工具函数
import '../models/music_models.dart';

/// 生成模拟歌曲数据
List<Song> generateMockSongs() {
  return [
    Song(
      id: '1',
      title: 'oblivious',
      artist: 'Kalafina',
      album: 'Kalafina All Time Best 2008-2018',
      coverUrl: 'https://trae-api-cn.mchost.guru/api/ide/v1/text_to_image?prompt=music%20album%20cover%20oblivious%20kaleidoscope&image_size=square',
      duration: 270,
      isLiked: true,
    ),
    Song(
      id: '2',
      title: 'Magia',
      artist: 'Kalafina',
      album: 'Magia',
      coverUrl: 'https://trae-api-cn.mchost.guru/api/ide/v1/text_to_image?prompt=music%20album%20cover%20magia%20kaleidoscope&image_size=square',
      duration: 300,
      isLiked: true,
    ),
    Song(
      id: '3',
      title: 'Signal',
      artist: 'Kalafina',
      album: 'Signal',
      coverUrl: 'https://trae-api-cn.mchost.guru/api/ide/v1/text_to_image?prompt=music%20album%20cover%20signal%20kaleidoscope&image_size=square',
      duration: 280,
      isLiked: false,
    ),
  ];
}

/// 生成模拟歌单数据
List<Playlist> generateMockPlaylists() {
  return [
    Playlist(
      id: '1',
      title: '车载必备，最劲的开',
      subTitle: '热曲',
      coverUrl: 'https://trae-api-cn.mchost.guru/api/ide/v1/text_to_image?prompt=car%20music%20playlist%20cover%20hot%20songs&image_size=square',
      count: '48.3万',
    ),
    Playlist(
      id: '2',
      title: '专注纯音乐 | 苦学党的',
      subTitle: '的静谧',
      coverUrl: 'https://trae-api-cn.mchost.guru/api/ide/v1/text_to_image?prompt=focus%20music%20playlist%20cover%20study&image_size=square',
      count: '1.9万',
    ),
    Playlist(
      id: '3',
      title: '无限循环 | 值得一遍的',
      subTitle: '冷门曲',
      coverUrl: 'https://trae-api-cn.mchost.guru/api/ide/v1/text_to_image?prompt=infinite%20loop%20music%20playlist%20cover%20indie&image_size=square',
      count: '313.5万',
    ),
    Playlist(
      id: '4',
      title: '英伦摇滚 | 听「像触电',
      subTitle: '心跳」加速气场爆...',
      coverUrl: 'https://trae-api-cn.mchost.guru/api/ide/v1/text_to_image?prompt=british%20rock%20music%20playlist%20cover&image_size=square',
      count: '6.7万',
    ),
    Playlist(
      id: '5',
      title: '你爱的我，反复翻听：',
      subTitle: '',
      coverUrl: 'https://trae-api-cn.mchost.guru/api/ide/v1/text_to_image?prompt=love%20songs%20playlist%20cover%20romantic&image_size=square',
      count: '414.1万',
    ),
    Playlist(
      id: '6',
      title: '「古风」明眸皓齿应笑',
      subTitle: '量，姑过今宵何处去！',
      coverUrl: 'https://trae-api-cn.mchost.guru/api/ide/v1/text_to_image?prompt=chinese%20ancient%20style%20music%20playlist%20cover&image_size=square',
      count: '25.5万',
    ),
    Playlist(
      id: '7',
      title: '律动蓝调：经典R&B天',
      subTitle: '籁',
      coverUrl: 'https://trae-api-cn.mchost.guru/api/ide/v1/text_to_image?prompt=r%26b%20music%20playlist%20cover%20rhythm%20and%20blues&image_size=square',
      count: '23.4万',
    ),
    Playlist(
      id: '8',
      title: '热歌速递 | 飙升热歌',
      subTitle: '内销榜',
      coverUrl: 'https://trae-api-cn.mchost.guru/api/ide/v1/text_to_image?prompt=hot%20songs%20chart%20music%20playlist%20cover&image_size=square',
      count: '14.4万',
    ),
  ];
}

/// 生成模拟用户数据
User generateMockUser() {
  return User(
    id: '1',
    name: 'Ivan的快乐星球',
    avatarUrl: 'https://trae-api-cn.mchost.guru/api/ide/v1/text_to_image?prompt=user%20avatar%20profile%20picture&image_size=square',
    isVip: true,
  );
}

/// 生成模拟导航菜单数据
List<NavigationItem> generateMockNavigationItems() {
  return [
    NavigationItem(
      id: '1',
      title: '为您推荐',
      icon: 'home',
      isActive: true,
    ),
    NavigationItem(
      id: '2',
      title: '发现音乐',
      icon: 'explore',
    ),
    NavigationItem(
      id: '3',
      title: '私人FM',
      icon: 'person',
    ),
    NavigationItem(
      id: '4',
      title: '播客电台',
      icon: 'radio',
    ),
  ];
}

/// 生成模拟我的音乐导航菜单数据
List<NavigationItem> generateMockMyMusicItems() {
  return [
    NavigationItem(
      id: '5',
      title: '我喜欢的音乐',
      icon: 'favorite',
    ),
    NavigationItem(
      id: '6',
      title: '我的收藏',
      icon: 'star',
    ),
    NavigationItem(
      id: '7',
      title: '我的云盘',
      icon: 'cloud',
    ),
    NavigationItem(
      id: '8',
      title: '本地音乐',
      icon: 'music_note',
    ),
    NavigationItem(
      id: '9',
      title: '最近播放',
      icon: 'history',
    ),
  ];
}
