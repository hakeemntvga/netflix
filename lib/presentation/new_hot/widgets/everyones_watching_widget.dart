import 'package:flutter/material.dart';
import 'package:netflix/presentation/main_page/widgets/custom_button_widget.dart';
import 'package:netflix/presentation/widgets/vedios_widget.dart';
import '../../../core/colors/constant.dart';

class EveryoneWatchingWidget extends StatelessWidget {
  final String id;
  final String posterPath;
  final String movieName;
  final String description;

  const EveryoneWatchingWidget({
    Key? key,
    required this.id,
    required this.posterPath,
    required this.movieName,
    required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Kheight,
         Text(
          movieName,
          style:const TextStyle(
            fontSize: 22.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        Kheight,
         Text(
          description,
          style:const TextStyle(
            color: Colors.grey,
            fontSize: 14,
          ),
        ),
        Kheight50,
         VideoWidget(url: '$imageAppendUrl$posterPath',),
        Kheight,
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: const [
            CustomButtonWidget(
              icon: Icons.share,
              title: "Share",
              iconSize: 22,
              textSize: 14.0,
            ),
            Kwidth,
            CustomButtonWidget(
              icon: Icons.add,
              title: "My List",
              iconSize: 24,
              textSize: 14.0,
            ),
            Kwidth,
            CustomButtonWidget(
              icon: Icons.play_arrow,
              title: "Play",
              iconSize: 26,
              textSize: 14.0,
            ),
            Kwidth20,
          ],
        ),
      ],
    );
  }
}
