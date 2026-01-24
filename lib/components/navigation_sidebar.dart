// 左侧导航栏组件
import 'package:flutter/material.dart';
import '../models/music_models.dart';

class NavigationSidebar extends StatelessWidget {
  final User user;
  final List<NavigationItem> navigationItems;
  final List<NavigationItem> myMusicItems;
  final Function(String) onNavigationItemTap;

  const NavigationSidebar({
    Key? key,
    required this.user,
    required this.navigationItems,
    required this.myMusicItems,
    required this.onNavigationItemTap,
  }) : super(key: key);

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
                // 主要导航项
                ...navigationItems.map((item) {
                  return NavigationMenuItem(
                    title: item.title,
                    icon: _getIcon(item.icon),
                    isActive: item.isActive,
                    onTap: () => onNavigationItemTap(item.id),
                  );
                }).toList(),
                const SizedBox(height: 20),
                // 我的音乐分类标题
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
                // 我的音乐导航项
                ...myMusicItems.map((item) {
                  return NavigationMenuItem(
                    title: item.title,
                    icon: _getIcon(item.icon),
                    isActive: item.isActive,
                    onTap: () => onNavigationItemTap(item.id),
                  );
                }).toList(),
              ],
            ),
          ),
          // 底部用户信息
          Container(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 20,
                  backgroundImage: NetworkImage(user.avatarUrl),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        user.name,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                        ),
                      ),
                      if (user.isVip)
                        const Text(
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

  // 根据图标名称获取 IconData
  IconData _getIcon(String iconName) {
    switch (iconName) {
      case 'home':
        return Icons.home;
      case 'explore':
        return Icons.explore;
      case 'person':
        return Icons.person;
      case 'radio':
        return Icons.radio;
      case 'favorite':
        return Icons.favorite;
      case 'star':
        return Icons.star;
      case 'cloud':
        return Icons.cloud;
      case 'music_note':
        return Icons.music_note;
      case 'history':
        return Icons.history;
      default:
        return Icons.home;
    }
  }
}

// 导航菜单项组件
class NavigationMenuItem extends StatelessWidget {
  final String title;
  final IconData icon;
  final bool isActive;
  final Function() onTap;

  const NavigationMenuItem({
    Key? key,
    required this.title,
    required this.icon,
    required this.isActive,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
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
      ),
    );
  }
}
