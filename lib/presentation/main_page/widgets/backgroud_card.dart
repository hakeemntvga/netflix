import 'package:flutter/material.dart';
import 'package:netflix/core/colors/colors.dart';
import 'package:netflix/presentation/main_page/widgets/custom_button_widget.dart';
import '../../../core/colors/constant.dart';

class BackgrounCard extends StatelessWidget {
  const BackgrounCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: 600.0,
          // color: Colors.blueGrey,
          decoration: const BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(MainImage),
            ),
          ),
        ),
        Positioned(
          bottom: 0.0,
          left: 0.0,
          right: 0.0,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const CustomButtonWidget(
                  title: "My List",
                  icon: Icons.add,
                ),
                _playButton(),
                const CustomButtonWidget(icon: Icons.info, title: "Info"),
              ],
            ),
          ),
        )
      ],
    );
  }

  TextButton _playButton() {
    return TextButton.icon(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(Kwhitecolor),
      ),
      onPressed: () {},
      icon: const Icon(
        Icons.play_arrow,
        size: 25.0,
        color: Kblackcolor,
      ),
      label: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 8.0),
        child: Text(
          "Play",
          style: TextStyle(
              fontSize: 18.0, color: Kblackcolor, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
