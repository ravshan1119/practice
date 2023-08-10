import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CountryDetailScreen extends StatelessWidget {
  final Map<String, dynamic>? countryData;

  const CountryDetailScreen({Key? key, this.countryData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.indigo,
        title: Text(countryData?['name'] ?? "Country Detail"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Text(
              countryData?['emoji'] ?? "",
              style: TextStyle(fontSize: 200),
            ),
          ),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Code: ${countryData?['code'] ?? 'No code'}",
                    style:
                    TextStyle(fontSize: 25, fontWeight: FontWeight.w600)),
                SizedBox(height: 10),
                Text("Phone: +${countryData?['phone'] ?? 'No phone'}",
                    style:
                    TextStyle(fontSize: 25, fontWeight: FontWeight.w600)),
                SizedBox(height: 10),
                Text("Capital: ${countryData?['capital'] ?? 'No capital'}",
                    style:
                    TextStyle(fontSize: 25, fontWeight: FontWeight.w600)),
                SizedBox(height: 10),
                Text("Currency: ${countryData?['currency'] ?? 'No currency'}",
                    style:
                    TextStyle(fontSize: 25, fontWeight: FontWeight.w600)),
                SizedBox(height: 10),
                Text(
                    "Code of continent: ${countryData?['continent']['code'] ?? 'No continent'}",
                    style:
                    TextStyle(fontSize: 25, fontWeight: FontWeight.w600)),
                SizedBox(height: 10),
                Text(
                    "Name of continent: ${countryData?['continent']['name'] ?? 'No continent'}",
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
