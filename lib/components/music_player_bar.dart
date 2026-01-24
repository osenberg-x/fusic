// 底部音乐播放控制栏组件
import 'package:flutter/material.dart';
import '../models/music_models.dart';

class MusicPlayerBar extends StatelessWidget {
  final Song currentSong;
  final bool isPlaying;
  final int currentPosition;
  final Function() onPlayPause;
  final Function() onPrevious;
  final Function() onNext;
  final Function() onShuffle;
  final Function() onRepeat;
  final Function() onLike;
  final Function() onDevices;
  final Function() onQueue;
  final Function() onVolume;

  const MusicPlayerBar({
    Key? key,
    required this.currentSong,
    required this.isPlaying,
    required this.currentPosition,
    required this.onPlayPause,
    required this.onPrevious,
    required this.onNext,
    required this.onShuffle,
    required this.onRepeat,
    required this.onLike,
    required this.onDevices,
    required this.onQueue,
    required this.onVolume,
  }) : super(key: key);

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
                  image: DecorationImage(
                    image: NetworkImage(currentSong.coverUrl),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(width: 15),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    currentSong.title,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    currentSong.artist,
                    style: const TextStyle(
                      fontSize: 12,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
              IconButton(
                icon: Icon(
                  Icons.favorite,
                  color: currentSong.isLiked ? Colors.pink : Colors.grey,
                ),
                onPressed: onLike,
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
                      onPressed: onShuffle,
                    ),
                    IconButton(
                      icon: const Icon(Icons.skip_previous, color: Colors.white),
                      onPressed: onPrevious,
                    ),
                    IconButton(
                      icon: Icon(
                        isPlaying ? Icons.pause_circle_outline : Icons.play_circle_outline,
                        size: 32,
                        color: Colors.white,
                      ),
                      onPressed: onPlayPause,
                    ),
                    IconButton(
                      icon: const Icon(Icons.skip_next, color: Colors.white),
                      onPressed: onNext,
                    ),
                    IconButton(
                      icon: const Icon(Icons.repeat, color: Colors.white),
                      onPressed: onRepeat,
                    ),
                  ],
                ),
                // 进度条
                Container(
                  width: 400,
                  height: 20,
                  child: Row(
                    children: [
                      Text(
                        _formatDuration(currentPosition),
                        style: const TextStyle(
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
                            width: (currentPosition / currentSong.duration) * 100,
                            height: 4,
                            decoration: BoxDecoration(
                              color: Colors.pink,
                              borderRadius: BorderRadius.circular(2),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Text(
                        currentSong.formattedDuration,
                        style: const TextStyle(
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
                onPressed: onDevices,
              ),
              IconButton(
                icon: const Icon(Icons.queue_music, color: Colors.white),
                onPressed: onQueue,
              ),
              IconButton(
                icon: const Icon(Icons.volume_up, color: Colors.white),
                onPressed: onVolume,
              ),
            ],
          ),
        ],
      ),
    );
  }

  // 格式化时间
  String _formatDuration(int seconds) {
    final minutes = seconds ~/ 60;
    final remainingSeconds = seconds % 60;
    return '$minutes:${remainingSeconds.toString().padLeft(2, '0')}';
  }
}
