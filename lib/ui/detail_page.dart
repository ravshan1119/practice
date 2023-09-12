import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:model_viewer_plus/model_viewer_plus.dart';
import 'package:practice/utils/colors.dart';
import 'package:practice/utils/images.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key, required this.path});

  final String path ;

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
        elevation: 0,
        systemOverlayStyle:
            const SystemUiOverlayStyle(statusBarColor: Colors.white),
      ),
      body: Stack(
        children: [
          Column(
            children: [
              Container(
                decoration: const BoxDecoration(
                  gradient: RadialGradient(
                    center: Alignment.center, // near the top right
                    radius: 0.9,
                    colors: <Color>[
                      Colors.white30, // yellow sun
                      Colors.black, // blue sky
                    ],
                    stops: <double>[0.4, 1.0],
                  ),
                ),
                height: 400,
                child: ModelViewer(
                  src: widget.path,
                  alt: "A 3D model",
                  autoPlay: true,
                  autoRotate: false,
                  cameraControls: true,
                ),
              ),
            ],
          ),
          Positioned(
            bottom: 0,
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(50),
                    topLeft: Radius.circular(50)),
              ),
              height: 500,
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: [
                  const SizedBox(height: 39),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 41),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Row(
                          children: [
                            Column(
                              children: [
                                Text(
                                  "\$",
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.orange,
                                  ),
                                ),
                                Text(""),
                              ],
                            ),
                            SizedBox(width: 2),
                            Text(
                              "169",
                              style: TextStyle(
                                fontSize: 32,
                                fontWeight: FontWeight.w500,
                                color: Colors.black,
                              ),
                            ),
                            SizedBox(width: 12),
                            Column(
                              children: [
                                Text(""),
                                Row(
                                  children: [
                                    Text(
                                      "52",
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.orange,
                                      ),
                                    ),
                                    SizedBox(width: 2),
                                    Text(
                                      "reviews",
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(

                          height: 26,
                          width: 96,
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              color: Colors.grey,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const SizedBox(width: 15),
                                const Text(
                                  "C A R T",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 10,
                                    color: Colors.black,
                                  ),
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50),
                                    color: Colors.black,

                                  ),
                                  child: const Icon(Icons.add,color: Colors.white,),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 320),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ZoomTapAnimation(
                        child: Container(
                          height: 71,
                          width: 71,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            border: Border.all(color: Colors.grey)
                          ),
                          child: Image.asset(AppImages.x),
                        ),
                      ),
                      const SizedBox(width: 46),
                      Container(
                        height: 71,
                        width: 230,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          color: AppColors.c_FF6300
                        ),
                        child: const Center(
                          child: ZoomTapAnimation(
                            child: Text("B U Y   N O W",style: TextStyle(
                              fontSize: 19,
                              fontWeight: FontWeight.w500,
                              color: Colors.white
                            ),),
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
