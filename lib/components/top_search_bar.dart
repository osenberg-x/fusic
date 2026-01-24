// 顶部搜索栏组件
import 'package:flutter/material.dart';
import '../models/music_models.dart';

class TopSearchBar extends StatelessWidget {
  final User user;
  final Function(String) onSearch;
  final Function() onNotificationsTap;
  final Function() onSettingsTap;
  final Function() onUserProfileTap;

  const TopSearchBar({
    Key? key,
    required this.user,
    required this.onSearch,
    required this.onNotificationsTap,
    required this.onSettingsTap,
    required this.onUserProfileTap,
  }) : super(key: key);

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
            child: TextField(
              onSubmitted: onSearch,
              decoration: const InputDecoration(
                hintText: '搜索歌曲、歌手、专辑',
                hintStyle: TextStyle(color: Colors.grey),
                prefixIcon: Icon(Icons.search, color: Colors.grey),
                border: InputBorder.none,
                contentPadding: EdgeInsets.symmetric(horizontal: 15),
              ),
              style: const TextStyle(color: Colors.white),
            ),
          ),
          // 用户操作按钮
          Row(
            children: [
              IconButton(
                icon: const Icon(Icons.notifications, color: Colors.white),
                onPressed: onNotificationsTap,
              ),
              IconButton(
                icon: const Icon(Icons.settings, color: Colors.white),
                onPressed: onSettingsTap,
              ),
              GestureDetector(
                onTap: onUserProfileTap,
                child: CircleAvatar(
                  radius: 16,
                  backgroundImage: NetworkImage(user.avatarUrl),
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
