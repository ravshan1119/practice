import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:practice/data/model/company_model.dart';
import 'package:practice/data/model/universal_data.dart';
import 'package:practice/data/network/api_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ApiService apiService = ApiService();
  UniversalData? universalData;
  CompanyModel? companyModel;
  bool isLoading = false;

  fetchData() async {
    setState(() {
      isLoading = true;
    });
    companyModel = await apiService.getData();
    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    fetchData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Company"),
      ),
      body: isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : SingleChildScrollView(
              child: Column(
                children: [
                  Center(
                    child: Text(
                      companyModel!.carModel,
                      style: const TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 20,
                          color: Colors.orange),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      companyModel!.description,
                      style: const TextStyle(
                          fontSize: 14, fontWeight: FontWeight.w500),
                    ),
                  ),
                  CarouselSlider(
                      items: companyModel!.carPics.map((i) {
                        return Builder(
                          builder: (BuildContext context) {
                            return Container(
                              height: 300,
                              width: 300,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.orange
                              ),
                              child: Image.network(i.toString()),

                              // Center(
                              //   child: CachedNetworkImage(
                              //     imageUrl: i.toString(),
                              //     placeholder: (context, url) => const Center(
                              //       child: CircularProgressIndicator(),
                              //     ),
                              //     errorWidget: (context, url, error) =>
                              //     const Icon(Icons.error),
                              //   ),
                              // ),
                            );
                          },
                        );
                      }).toList(),
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
                        scrollDirection: Axis.horizontal,
                      ))
                ],
              ),
            ),
    );
  }
}
