import 'package:flutter/material.dart';
import 'package:netflix/presentation/main_page/widgets/custom_button_widget.dart';
import 'package:netflix/presentation/widgets/vedios_widget.dart';
import '../../../core/colors/constant.dart';

class ComingSoonWidget extends StatelessWidget {
  final String id;
  final String month;
  final String day;
  final String posterPath;
  final String movieName;
  final String description;

  const ComingSoonWidget(
      {Key? key,
      required this.id,
      required this.month,
      required this.day,
      required this.posterPath,
      required this.movieName,
      required this.description})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Row(
      children: [
        SizedBox(
          width: 50.0,
          height: 450.0,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                month,
                style: const TextStyle(
                  fontSize: 12.0,
                  color: Colors.grey,
                ),
              ),
              Text(
                day,
                style: const TextStyle(
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                 // letterSpacing: 5.0,
                ),
              ),
            ],
          ),
        ),
        Stack(
          children: [
            SizedBox(
              width: size.width - 50.0,
              height: 500.0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                    VideoWidget(url: posterPath,),
                  Kheight,
                  Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          movieName,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                           // letterSpacing: -2.0,
                          ),
                        ),
                      ),
                      //  const Spacer(),
                  const    CustomButtonWidget(
                        icon: Icons.notifications,
                        title: "Remind me",
                        iconSize: 22,
                        textSize: 14.0,
                      ),
                      Kwidth,
                    const  CustomButtonWidget(
                        icon: Icons.info,
                        title: "Info",
                        iconSize: 22,
                        textSize: 14.0,
                      ),
                      Kwidth20,
                    ],
                  ),
                  Kheight,
                  Text(
                    "Coming on $day $month",
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Kheight,
                  Text(
                    movieName,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 22.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    description,
                    maxLines: 5,
                    style: const TextStyle(
                      color: Colors.grey,
                      fontSize: 16,
                    ),
                  ),
                  Kheight50
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
