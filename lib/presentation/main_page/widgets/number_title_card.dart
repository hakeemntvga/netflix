import 'package:flutter/material.dart';
import 'package:netflix/presentation/main_page/widgets/number_card.dart';
import '../../widgets/main_title.dart';

class NumberTittleCard extends StatelessWidget {
  const NumberTittleCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const MainTitle(
          tittle: "Top 10 TV Shows in India Today",
        ),
        //  Kheight,
        LimitedBox(
          maxHeight: 200.0,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: List.generate(
              10,
              (index) => NumberCard(index: index),
            ),
          ),
        )
      ],
    );
  }
}
