// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:netflix/application/fast_laugh/fastlaugh_bloc.dart';
import 'package:netflix/core/colors/constant.dart';
import 'package:netflix/domain/downloads/models/downloads.dart';
import 'package:share_plus/share_plus.dart';
import 'package:video_player/video_player.dart';
import '../../../core/colors/colors.dart';

class VideoListItemInheritedWidget extends InheritedWidget {
  final Widget widget;
  final Downloads movieData;

  const VideoListItemInheritedWidget({
    Key? key,
    required this.widget,
    required this.movieData,
  }) : super(key: key, child: widget);

  @override
  bool updateShouldNotify(covariant VideoListItemInheritedWidget oldWidget) {
    return oldWidget.movieData != movieData;
  }

  static VideoListItemInheritedWidget? of(BuildContext, context) {
    return context
        .dependOnInheritedWidgetOfExactType<VideoListItemInheritedWidget>();
  }
}

class VideoListItem extends StatelessWidget {
  final int index;
  const VideoListItem({
    Key? key,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //final posterPath = VideoListItemInheritedWidget.of(context)?.movieData.posterPath;
    final posterPath =
        VideoListItemInheritedWidget.of(context, context)?.movieData.posterPath;
    final videoUrl = dummyVidoaUrls[index % dummyVidoaUrls.length];

    return Stack(
      children: [
        FastLaughVideoPlayer(
          videoUrl: videoUrl,
          onStateChanged: (bool) {},
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 10.0,
              vertical: 10.0,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ///lest side//

                CircleAvatar(
                  backgroundColor: Colors.black12.withOpacity(
                    0.5,
                  ),
                  radius: 30.0,
                  child: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.volume_off,
                      color: Kwhitecolor,
                      size: 30.0,
                    ),
                  ),
                ),

                /// Right side
                Column(mainAxisAlignment: MainAxisAlignment.end, children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: CircleAvatar(
                      radius: 30.0,
                      backgroundImage: posterPath == null
                          ? null
                          : NetworkImage("$imageAppendUrl$posterPath"),
                    ),
                  ),
                  ValueListenableBuilder(
                    valueListenable: likedVideosIdNotifier,
                    builder:
                        (BuildContext c, Set<int> newLikedListId, Widget? _) {
                      final _index = index;
                      if (newLikedListId.contains(_index)) {
                        return GestureDetector(
                          onTap: () {
                            // BlocProvider.of<FastlaughBloc>(context).add(UnLikeVideo(id: _index));
                            likedVideosIdNotifier.value.remove(_index);
                            likedVideosIdNotifier.notifyListeners();
                          },
                          child: const VideoActionsWidgets(
                              icon: Icons.favorite_outline, title: "Liked"),
                        );
                      }
                      return GestureDetector(
                        onTap: () {
                          likedVideosIdNotifier.value.add(_index);
                          likedVideosIdNotifier.notifyListeners();
                          //BlocProvider.of<FastlaughBloc>(context).add(LikeVideo(id: _index));
                        },
                        child: const VideoActionsWidgets(
                            icon: Icons.emoji_emotions, title: "LOL"),
                      );
                    },
                  ),
                  const VideoActionsWidgets(icon: Icons.add, title: "My List"),
                  GestureDetector(
                      onTap: () {
                        final movieName = VideoListItemInheritedWidget.of(
                                BuildContext, context)
                            ?.movieData
                            .posterPath;
                        if (movieName != null) {
                          //  print(movieName.toString());
                          Share.share(movieName);
                        }
                      },
                      child: const VideoActionsWidgets(
                          icon: Icons.share, title: "Share")),
                  const VideoActionsWidgets(
                      icon: Icons.play_arrow, title: "Play"),
                ])
              ],
            ),
          ),
        )
      ],
    );
  }
}

class VideoActionsWidgets extends StatelessWidget {
  final IconData icon;
  final String title;

  const VideoActionsWidgets({
    Key? key,
    required this.icon,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 10.0,
        horizontal: 10.0,
      ),
      child: Column(
        children: [
          Icon(
            icon,
            color: Colors.white,
            size: 30.0,
          ),
          Text(
            title,
            style: const TextStyle(
              color: Kwhitecolor,
              fontSize: 16.0,
            ),
          ),
        ],
      ),
    );
  }
}

class FastLaughVideoPlayer extends StatefulWidget {
  final String videoUrl;
  final void Function(bool isPlaying) onStateChanged;
  const FastLaughVideoPlayer(
      {Key? key, required this.videoUrl, required this.onStateChanged})
      : super(key: key);

  @override
  State<FastLaughVideoPlayer> createState() => _FastLaughVideoPlayerState();
}

class _FastLaughVideoPlayerState extends State<FastLaughVideoPlayer> {
  late VideoPlayerController _videoPlayerController;

  @override
  void initState() {
    _videoPlayerController = VideoPlayerController.network(widget.videoUrl);
    _videoPlayerController.initialize().then((value) {
      setState(() {});
      _videoPlayerController.play();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: _videoPlayerController.value.isInitialized
          ? AspectRatio(
              aspectRatio: _videoPlayerController.value.aspectRatio,
              child: VideoPlayer(_videoPlayerController),
            )
          : const Center(
              child: CircularProgressIndicator(
                strokeWidth: 2.0,
              ),
            ),
    );
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    super.dispose();
  }
}
