import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netflix_responsive_ui_app/models/models.dart';
import 'package:video_player/video_player.dart';

import 'widgets.dart';

class ContentHeader extends StatelessWidget {
  final Content? featureContent;
  ContentHeader({this.featureContent});

  @override
  Widget build(BuildContext context) {
    return Responsive(
      mobile: _ContentHeaderMobile(featureContent: featureContent),
      desktop: _ContentHeaderDesktop(featureContent: featureContent),
    );
  }
}

class _ContentHeaderMobile extends StatelessWidget {
  final Content? featureContent;
  _ContentHeaderMobile({this.featureContent});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          height: 500,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(featureContent!.imageUrl as String),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Container(
          height: 500,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.black, Colors.transparent],
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
            ),
          ),
        ),
        Positioned(
          bottom: 110,
          child: SizedBox(
            width: 250,
            child: Image.asset(featureContent!.titleImageUrl as String),
          ),
        ),
        Positioned(
          left: 0,
          right: 0,
          bottom: 40,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              VerticalIconButton(
                icon: Icons.add,
                title: "List",
                onTap: () => print("List"),
              ),
              _PlayButton(),
              VerticalIconButton(
                icon: Icons.info_outline,
                title: "Info",
                onTap: () => print("Info"),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _ContentHeaderDesktop extends StatefulWidget {
  final Content? featureContent;
  _ContentHeaderDesktop({this.featureContent});

  @override
  __ContentHeaderDesktopState createState() => __ContentHeaderDesktopState();
}

class __ContentHeaderDesktopState extends State<_ContentHeaderDesktop> {
  VideoPlayerController? _videoPlayerController;
  bool _isMuted = true;

  @override
  void initState() {
    _videoPlayerController =
        VideoPlayerController.network(widget.featureContent!.videoUrl)
          ..initialize().then((_) => setState(() {}));
    super.initState();
  }

  @override
  void dispose() {
    _videoPlayerController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _videoPlayerController!.value.isPlaying
          ? _videoPlayerController!.pause()
          : _videoPlayerController!.play(),
      child: Stack(
        alignment: Alignment.bottomLeft,
        children: [
          Container(
            height: 500,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(widget.featureContent!.imageUrl as String),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            height: 500,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.black, Colors.transparent],
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
              ),
            ),
          ),
          Positioned(
            left: 60,
            right: 60,
            bottom: 150,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 250,
                  child: Image.asset(
                      widget.featureContent!.titleImageUrl as String),
                ),
                const SizedBox(
                  height: 15,
                ),
                Text(
                  widget.featureContent!.description as String,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    shadows: [
                      Shadow(
                        color: Colors.black,
                        offset: Offset(2, 4),
                        blurRadius: 6,
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    _PlayButton(),
                    const SizedBox(
                      width: 16,
                    ),
                    FlatButton.icon(
                      onPressed: () => print("More info"),
                      color: Colors.white,
                      icon: const Icon(Icons.info_outline),
                      label: const Text(
                        "More Info",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    if (_videoPlayerController!.value.initialized)
                      IconButton(
                        icon: Icon(
                          _isMuted ? Icons.volume_off : Icons.volume_up,
                        ),
                        color: Colors.white,
                        iconSize: 30,
                        onPressed: () => setState(
                              () {
                            _isMuted
                                ? _videoPlayerController!.setVolume(100)
                                : _videoPlayerController!.setVolume(0);
                            _isMuted = _videoPlayerController!.value.volume == 0;
                          },
                        ),
                      )
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _PlayButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FlatButton.icon(
      padding: const EdgeInsets.fromLTRB(15, 5, 20, 5),
      onPressed: () => print("Play"),
      icon: const Icon(
        Icons.play_arrow,
        size: 30,
      ),
      color: Colors.white,
      label: const Text(
        "Play",
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
      ),
    );
  }
}
