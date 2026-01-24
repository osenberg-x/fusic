// 音乐相关的数据模型

/// 歌曲模型
class Song {
  final String id;
  final String title;
  final String artist;
  final String album;
  final String coverUrl;
  final int duration;
  bool isLiked;

  Song({
    required this.id,
    required this.title,
    required this.artist,
    required this.album,
    required this.coverUrl,
    required this.duration,
    this.isLiked = false,
  });

  // 转换为字符串格式的时间
  String get formattedDuration {
    final minutes = duration ~/ 60;
    final seconds = duration % 60;
    return '$minutes:${seconds.toString().padLeft(2, '0')}';
  }
}

/// 歌单模型
class Playlist {
  final String id;
  final String title;
  final String subTitle;
  final String coverUrl;
  final String count;
  final List<Song> songs;

  Playlist({
    required this.id,
    required this.title,
    required this.subTitle,
    required this.coverUrl,
    required this.count,
    this.songs = const [],
  });
}

/// 用户模型
class User {
  final String id;
  final String name;
  final String avatarUrl;
  final bool isVip;

  User({
    required this.id,
    required this.name,
    required this.avatarUrl,
    this.isVip = false,
  });
}

/// 导航菜单项模型
class NavigationItem {
  final String id;
  final String title;
  final String icon;
  bool isActive;

  NavigationItem({
    required this.id,
    required this.title,
    required this.icon,
    this.isActive = false,
  });
}
