import 'package:flutter/material.dart';
import 'dart:math';
import 'package:video_player/video_player.dart';

class Video extends StatefulWidget {
  @override
  _VideoState createState() => _VideoState();
}

class _VideoState extends State<Video> {
  List<String> videos = [
    "assets/video/Jai_pas_envie_de_participer_!.mp4",
    "assets/video/vous_etes_des_zeros!.mp4",
    "assets/video/Mundi_placet_spiritus_minima.mp4",
    "assets/video/Loth_et_la_trahison.mp4",
    "assets/video/Faut_que_vous_arretiez_de_dire_des_trucs.mp4",
    "assets/video/Sortez_vous_les_doigts_du_cul!.mp4",
    "assets/video/Je_comprend_pas_un_mot_de_ce_que_vous_racontez.mp4",
    "assets/video/Les_oiseaux_sans_bras.mp4",
    "assets/video/Ave_cesar_prout.mp4",
    "assets/video/Cest_mortel.mp4",
    "assets/video/Mon_oncle_jai_fait_un_trait_dhumour!.mp4",
    "assets/video/Jo_lrigolo.mp4",
    "assets/video/Le_roi_dorcanie.mp4",
    "assets/video/Les_petits_pedestres.mp4",
    "assets/video/Et_toc_remonte_ton_slibard_lauthar!.mp4",
    "assets/video/Quand_jcomprends_pas_jrepond_pas.mp4",
    "assets/video/Cest_pas_moi_qui_explique_mal.mp4",
    "assets/video/Quest_ce_que_vous_voulez_savoir.mp4",
    "assets/video/Beaucoup_combien.mp4",
    "assets/video/Manger.mp4"
  ];
  Random rank = new Random();
  String videoPath;
  VideoPlayerController playerController;
  VoidCallback listener;

  selectVideo() {
    videoPath = videos[rank.nextInt(videos.length)];
    return videoPath;
  }

  void createVideo() {
    if (playerController == null) {
      playerController = VideoPlayerController.asset(selectVideo())
        ..addListener(listener)
        ..setVolume(1.0)
        ..initialize();
    }
  }

  @override
  void initState() {
    super.initState();
    listener = () {
      setState(() {});
    };
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.white10),
      body: Container(
          color: Colors.white10,
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Center(
              child: AspectRatio(
                  aspectRatio: 16 / 9,
                  child: Container(
                      child: (playerController != null
                          ? VideoPlayer(
                              playerController,
                            )
                          : Container()))))),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          createVideo();
          playerController.play();
        },
        child: Icon(Icons.play_arrow),
      ),
    );
  }
}
