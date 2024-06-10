import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:sql_davomi_2_dars/models/lesson_model.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class LessonsScreen extends StatefulWidget {
  final LessonModel lesson;
  const LessonsScreen(this.lesson, {super.key});

  @override
  State<LessonsScreen> createState() => _LessonsScreenState();
}

class _LessonsScreenState extends State<LessonsScreen> {
  late YoutubePlayerController youtubePlayerController;
  late bool urlCheck;
  @override
  void initState() {
    super.initState();
    urlCheck = YoutubePlayer.convertUrlToId(widget.lesson.videoUrl) != null;
    if (urlCheck) {
      youtubePlayerController = YoutubePlayerController(
        initialVideoId: YoutubePlayer.convertUrlToId(widget.lesson.videoUrl)!,
        flags: const YoutubePlayerFlags(
          autoPlay: true,
          mute: false, // Changed to start with audio
        ),
      );
      youtubePlayerController.addListener(() {
        if (!mounted) return;
        setState(() {});
      });
    }
  }

  @override
  void dispose() {
    if (urlCheck) {
      youtubePlayerController.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.lesson.title),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.only(left: 15, right: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (urlCheck)
                YoutubePlayer(
                  controller: youtubePlayerController,
                  showVideoProgressIndicator: true,
                  progressIndicatorColor: Colors.amber,
                  progressColors: const ProgressBarColors(
                    playedColor: Colors.amber,
                    handleColor: Colors.amberAccent,
                  ),
                )
              else
                const Center(
                  child: Text(
                    'Invalid video URL',
                    style: TextStyle(color: Colors.red, fontSize: 18),
                  ),
                ),
              const Gap(15),
              Text(
                widget.lesson.description,
                style: const TextStyle(fontSize: 22),
              ),
            ],
          ),
        ));
  }
}
