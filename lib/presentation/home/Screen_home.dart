import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:netflix/core/colors/constant.dart';
import 'package:netflix/presentation/main_page/widgets/backgroud_card.dart';
import 'package:netflix/presentation/main_page/widgets/number_title_card.dart';
import 'package:netflix/presentation/search/widget/main_title_card.dart';

ValueNotifier<bool> scrollnotifier = ValueNotifier(true);

class ScreenHomePage extends StatelessWidget {
  const ScreenHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ValueListenableBuilder(
          valueListenable: scrollnotifier,
          builder: (BuildContext context, index, _) {
            return NotificationListener<UserScrollNotification>(
              onNotification: (notification) {
                final ScrollDirection direction = notification.direction;

                if (direction == ScrollDirection.reverse) {
                  scrollnotifier.value = false;
                } else if (direction == ScrollDirection.forward) {
                  scrollnotifier.value = true;
                }

                return true;
              },
              child: Stack(
                children: [
                  ListView(
                    children: const [
                      BackgrounCard(),
                      MainTitleCard(title: "Released in the past year"),
                      Kheight,
                      MainTitleCard(title: "Trending Now"),
                      Kheight,
                      NumberTittleCard(),
                      Kheight,
                      MainTitleCard(title: "Tense Dramas"),
                      Kheight,
                      MainTitleCard(title: "Sounth Indian Cinemas"),
                      Kheight,
                    ],
                  ),
                  scrollnotifier.value == true
                      ? AnimatedContainer(
                          duration: const Duration(milliseconds: 1000),
                          width: double.infinity,
                          height: 90,
                          color: Colors.black.withOpacity(0.3),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Image.network(
                                    "https://pngrow.com/preview/625/netflix-logo-circle-png",
                                    width: 60,
                                    height: 60,
                                  ),
                                  const Spacer(),
                                  const Icon(
                                    Icons.cast,
                                    color: Colors.white,
                                    size: 30.0,
                                  ),
                                  Kwidth,
                                  Container(
                                    width: 30.0,
                                    height: 30.0,
                                    color: Colors.blue,
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text(
                                    "TV Shows",
                                    style: KhomeTittleText,
                                  ),
                                  Text(
                                    "Movies",
                                    style: KhomeTittleText,
                                  ),
                                  Text(
                                    "Categories",
                                    style: KhomeTittleText,
                                  ),
                                ],
                              )
                            ],
                          ),
                        )
                      : Kheight,
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
