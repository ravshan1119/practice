import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CarDetailScreen extends StatelessWidget {
  final Map<String, dynamic>? car;

  const CarDetailScreen({Key? key, this.car}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.indigo,
        title: Text(car?['car_model'] ?? "Car Detail"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: CachedNetworkImage(
              imageUrl: car?['logo'] ?? "",
              width: 250,
              height: 250,
              placeholder: (context, url) => CupertinoActivityIndicator(),
              errorWidget: (context, url, error) => Icon(Icons.error),
            ),
          ),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Model: ${car?['car_model'] ?? 'No Model'}",
                    style:
                        TextStyle(fontSize: 25, fontWeight: FontWeight.w600)),
                SizedBox(height: 10),
                Text("Price: ${car?['average_price'] ?? 'No price'}\$",
                    style:
                        TextStyle(fontSize: 25, fontWeight: FontWeight.w600)),
                SizedBox(height: 10),
                Text(
                    "Established Year: ${car?['established_year'] ?? 'No Established Year'}",
                    style:
                        TextStyle(fontSize: 25, fontWeight: FontWeight.w600)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
