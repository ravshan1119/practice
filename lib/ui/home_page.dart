import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:practice/ui/detail_page.dart';
import 'package:practice/ui/widgets/global_button.dart';
import 'package:practice/ui/widgets/product_container.dart';
import 'package:practice/utils/colors.dart';
import 'package:practice/utils/constants.dart';
import 'package:practice/utils/images.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.c_1A1A1A,
        appBar: AppBar(
          toolbarHeight: 0,
          elevation: 0,
          systemOverlayStyle:
              const SystemUiOverlayStyle(statusBarColor: AppColors.c_1A1A1A),
        ),
        body: Stack(
          children: [
            ListView(
              children: [
                const SizedBox(height: 47),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 34),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                              width: 23,
                              child: Divider(
                                color: Colors.white,
                                height: 4,
                              )),
                          SizedBox(height: 8),
                          SizedBox(
                              width: 19,
                              child: Divider(
                                color: Colors.white,
                                height: 4,
                              )),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 41),
                      child: SvgPicture.asset(AppImages.bag),
                    ),
                  ],
                ),
                const SizedBox(height: 240),
                Row(
                  children: [
                    const SizedBox(
                      width: 42,
                    ),
                    Column(
                      children: [
                        const Text(
                          "19",
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 10,
                            color: Colors.white,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          child: Container(
                            height: 137,
                            width: 2,
                            color: Colors.white,
                          ),
                        ),
                        const Text(
                          "16",
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 10,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(width: 47),
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Ring",
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 57,
                            color: AppColors.c_DEA98D,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Diskrova",
                              style: TextStyle(
                                fontWeight: FontWeight.w200,
                                fontSize: 57,
                                color: AppColors.c_DEA98D,
                              ),
                            ),
                            Text(
                              "TM",
                              style: TextStyle(
                                fontWeight: FontWeight.w200,
                                fontSize: 10,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                        Text(
                          """Our rings perfectly emphasize""",
                          style: TextStyle(
                            fontWeight: FontWeight.w300,
                            fontSize: 18,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          """the style of minimalism""",
                          style: TextStyle(
                            fontWeight: FontWeight.w300,
                            fontSize: 18,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 50),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 42),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Popular Rings",
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 26,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        "1/20",
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 26,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 28),
                SizedBox(
                  height: 200,
                  child: ListView(
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    children: [
                      ...List.generate(
                          rings.length,
                          (index) => ZoomTapAnimation(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => DetailPage(path: rings[index],)));
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: ProductContainer(path: rings_images[index],),
                              )))
                    ],
                  ),
                )
              ],
            ),
            Positioned(
              top: 0,
              right: 0,
              left: 0,
              child: Center(
                child:
                    SizedBox(height: 450, child: Image.asset(AppImages.lamp)),
              ),
            ),
          ],
        ));
  }
}

