import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:video_player/video_player.dart';

/// ================ HomeScreen ================
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}
/// ================ HomeScreenState ================
class _HomeScreenState extends State<HomeScreen> {
  XFile? video;
  bool showVideoPlayer = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: video != null
          ? _VideoPlayer(video: video!, onAnotherVideoPressed: onLogoTap)
          : _VideoSelector(onLogoTap: onLogoTap),
    );
  }

  onLogoTap() async {
    final video = await ImagePicker().pickVideo(source: ImageSource.gallery);

    setState(() {
      this.video = video;
    });
  }
}
/// ================ _Logo ================
class _Logo extends StatelessWidget {
  final VoidCallback onTap;

  const _Logo({required this.onTap, super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Image.asset('asset/image/logo.png'),
    );
  }
}

/// ================ _Title ================
class _Title extends StatelessWidget {
  const _Title({super.key});

  @override
  Widget build(BuildContext context) {
    final textStyle = TextStyle(
      color: Colors.white,
      fontSize: 32.0,
      fontWeight: FontWeight.w300,
    );

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('VIDEO', style: textStyle),

        // copyWith : 특정 속성만 변경 가능
        Text('PLAYER', style: textStyle.copyWith(fontWeight: FontWeight.w700)),
      ],
    );
  }
}

/// ================ _VideoPlayer ================
class _VideoPlayer extends StatefulWidget {
  final XFile video;
  final VoidCallback onAnotherVideoPressed;

  const _VideoPlayer({
    required this.onAnotherVideoPressed,
    required this.video,
    super.key,
  });

  @override
  State<_VideoPlayer> createState() => _VideoPlayerState();
}

/// ================ VideoPlayerState ================
class _VideoPlayerState extends State<_VideoPlayer> {
  late VideoPlayerController videoPlayerController;
  bool showIcons = true;

  @override
  void initState() {
    super.initState();
    initializeController();
  }

  @override
  void didUpdateWidget(covariant _VideoPlayer oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.video.path != widget.video.path) {
      initializeController();
    }
  }

  initializeController() async {
    videoPlayerController = VideoPlayerController.file(File(widget.video.path));

    await videoPlayerController.initialize();

    videoPlayerController.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        setState(() {
          showIcons = !showIcons;
        });
      },
      child: Center(
        child: AspectRatio(
          aspectRatio: videoPlayerController.value.aspectRatio,
          child: Stack(
            children: [
              VideoPlayer(videoPlayerController),
              if(showIcons)
              Container(
                width: double.infinity,
                height: double.infinity,
                color: Colors.black.withOpacity(0.5),
              ),
              if(showIcons)
              _PlayButtons(
                onReversPressed: onReversePressed,
                onPlayPressed: onPlayPressed,
                onForwardPressed: onForwardPressed,
                isPlaying: videoPlayerController.value.isPlaying,
              ),
              if(showIcons)
              _Bottom(
                position: videoPlayerController.value.position,
                maxPostion: videoPlayerController.value.duration,
                onSliderChanged: onSliderChanged,
              ),
              if(showIcons)
              _PickAnotherVideo(onPressed: widget.onAnotherVideoPressed),

            ],
          ),
        ),
      ),
    );
  }

  /// ================ onSliderChanged ================
  onSliderChanged(double val) {
    final position = Duration(seconds: val.toInt());

    videoPlayerController.seekTo(position);
  }

  /// ================ OnReversePressed ================
  onReversePressed() {
    final curPos = videoPlayerController.value.position;

    Duration pos = Duration();

    if (curPos.inSeconds > 3) {
      pos = curPos - Duration(seconds: 3);
    }

    videoPlayerController.seekTo(pos);
  }

  /// ================ OnPlayPressed ================
  onPlayPressed() {
    setState(() {
      if (videoPlayerController.value.isPlaying == false) {
        videoPlayerController.play();
      } else {
        videoPlayerController.pause();
      }
    });
  }

  /// ================ onForwardPressed ================
  onForwardPressed() {
    final maxPos = videoPlayerController.value.duration;
    final curPos = videoPlayerController.value.position;

    Duration pos = maxPos;

    if ((maxPos - Duration(seconds: 3)).inSeconds > curPos.inSeconds) {
      pos = curPos + Duration(seconds: 3);
    }

    videoPlayerController.seekTo(pos);
  }
}

/// ================ _VideoSelector ================
class _VideoSelector extends StatelessWidget {
  final VoidCallback onLogoTap;

  const _VideoSelector({required this.onLogoTap, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      // decoration : gradient 가능
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          // stops: colors 갯수만큼 필요
          colors: [Color(0xFF2A3A7C), Color(0XFF000118)],
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _Logo(onTap: onLogoTap),
          SizedBox(height: 28.0),
          _Title(),
        ],
      ),
    );
  }
}

/// ================ _PlayButtons ================
class _PlayButtons extends StatelessWidget {
  final VoidCallback onReversPressed;
  final VoidCallback onPlayPressed;
  final VoidCallback onForwardPressed;
  final bool isPlaying;

  const _PlayButtons({
    required this.onReversPressed,
    required this.onPlayPressed,
    required this.onForwardPressed,
    required this.isPlaying,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          IconButton(
            color: Colors.white,
            onPressed: onReversPressed,
            icon: Icon(Icons.rotate_left),
          ),
          IconButton(
            color: Colors.white,
            onPressed: onPlayPressed,
            icon: Icon(isPlaying == false ? Icons.play_arrow : Icons.pause),
          ),
          IconButton(
            color: Colors.white,
            onPressed: onForwardPressed,
            icon: Icon(Icons.rotate_right),
          ),
        ],
      ),
    );
  }
}

/// ================ _Bottom ================
class _Bottom extends StatelessWidget {
  final Duration position;
  final Duration maxPostion;
  final ValueChanged<double> onSliderChanged;

  const _Bottom({
    required this.onSliderChanged,
    required this.position,
    required this.maxPostion,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0.0,
      left: 0.0,
      right: 0.0,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 8.0),
        child: Row(
          children: [
            Text(
              '${position.inMinutes.toString().padLeft(2, '0')}:${(position.inSeconds % 60).toString().padLeft(2, '0')}',
              style: TextStyle(color: Colors.white),
            ),
            Expanded(
              child: Slider(
                value: position.inSeconds.toDouble(),
                max: maxPostion.inSeconds.toDouble(),
                onChanged: onSliderChanged,
              ),
            ),
            Text(
              '${maxPostion.inMinutes.toString().padLeft(2, '0')}:${(maxPostion.inSeconds % 60).toString().padLeft(2, '0')}',
              style: TextStyle(color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}

/// ================ _PickAnotherVideo ================
class _PickAnotherVideo extends StatelessWidget {
  final VoidCallback onPressed;

  const _PickAnotherVideo({required this.onPressed, super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: 0.0,
      child: IconButton(
        color: Colors.white,
        onPressed: onPressed,
        icon: Icon(Icons.photo_camera_back),
      ),
    );
  }
}
