import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class ThirdApi extends StatefulWidget {
  const ThirdApi({super.key});

  @override
  _ThirdApiState createState() => _ThirdApiState();
}

class _ThirdApiState extends State<ThirdApi> {
  Map<String, dynamic> carData = {};

  void getData() async {
    try {
      Dio dio = Dio();
      Response response =
      await dio.get('https://easyenglishuzb.free.mockoapp.net/companies/5');
      setState(() {
        carData = response.data;
      });
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.indigo,
        title: Text('Car Information'),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CarouselSlider(
              items: carData['car_pics'] != null
                  ? carData['car_pics'].map<Widget>((picUrl) {
                return Image.network(picUrl);
              }).toList()
                  : [],
              options: CarouselOptions(
                height: 400,
                aspectRatio: 16 / 9,
                viewportFraction: 0.8,
                initialPage: 0,
                enableInfiniteScroll: true,
                reverse: false,
                autoPlay: true,
                autoPlayInterval: Duration(seconds: 3),
                autoPlayAnimationDuration: Duration(milliseconds: 800),
                autoPlayCurve: Curves.fastOutSlowIn,
                enlargeCenterPage: true,
                enlargeFactor: 0.3,
                onPageChanged: (index, reason) {
                },
                scrollDirection: Axis.horizontal,
              ),
            ),
            CachedNetworkImage(
              imageUrl: carData['logo'] ?? "Image not found",
              width: 60,
              height: 60,
              placeholder: (context, url) => CupertinoActivityIndicator(radius: 20,),
              errorWidget: (context, url, error) => Icon(Icons.error,size: 50,),
            ),
            Text('Car Model: ${carData['car_model']}',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600)),
            Text('Established Year: ${carData['established_year']}',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600)),
            Text('Average Price: ${carData['average_price']}\$',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600)),
            Padding(
              padding:
              const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
              child: Text(
                'Description: ${carData['description']}',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
