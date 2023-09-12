import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:model_viewer_plus/model_viewer_plus.dart';
import 'package:practice/utils/images.dart';

class ProductContainer extends StatefulWidget {
  const ProductContainer({super.key, required this.path});
  final String path;

  @override
  State<ProductContainer> createState() => _ProductContainerState();
}

class _ProductContainerState extends State<ProductContainer> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          
            child: SvgPicture.asset(AppImages.heart)),
        Container(
          height: 153,
          width: 122,
          decoration: BoxDecoration(
              gradient: const RadialGradient(
                center: Alignment.center, // near the top right
                radius: 0.9,
                colors: <Color>[
                  Colors.white30, // yellow sun
                  Colors.black, // blue sky
                ],
                stops: <double>[0.4, 1.0],
              ),
              borderRadius: BorderRadius.circular(25),
            color: Colors.black
          ),
          child: ClipRRect(
              borderRadius: BorderRadius.circular(25),
              child: Image.asset(widget.path,fit: BoxFit.cover,)),
        ),
        // Positioned(
        //     bottom: 20,
        //     right: 0,
        //     child: SizedBox(
        //         height: 80,
        //         width: 58,
        //         child: Image.asset(AppImages.background_image))),
      ],
    );
  }
}
