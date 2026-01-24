// 歌单卡片组件
import 'package:flutter/material.dart';
import '../models/music_models.dart';

class PlaylistCard extends StatelessWidget {
  final Playlist playlist;
  final Function(Playlist) onTap;

  const PlaylistCard({
    Key? key,
    required this.playlist,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(playlist),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 歌单封面
          Container(
            height: 160,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              image: DecorationImage(
                image: NetworkImage(playlist.coverUrl),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 10),
          // 歌单标题
          Text(
            playlist.title,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: Colors.white,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          // 歌单副标题
          if (playlist.subTitle.isNotEmpty)
            Text(
              playlist.subTitle,
              style: const TextStyle(
                fontSize: 12,
                color: Colors.grey,
              ),
            ),
          // 播放次数
          Text(
            playlist.count,
            style: const TextStyle(
              fontSize: 12,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}
