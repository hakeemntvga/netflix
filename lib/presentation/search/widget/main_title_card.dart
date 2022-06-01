import 'package:flutter/material.dart';
import 'package:netflix/presentation/widgets/main_card.dart';
import '../../widgets/main_title.dart';

class MainTitleCard extends StatelessWidget {
  final String title;

  const MainTitleCard({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MainTitle(
          tittle: title,
        ),
        //  Kheight,
        LimitedBox(
          maxHeight: 200.0,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: List.generate(
              10,
              (index) => const MainCard(),
            ),
          ),
        )
      ],
    );
  }
}
