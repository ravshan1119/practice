import 'package:flutter/material.dart';
import 'package:practice/lib/ui/first_api/widget/dio.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

import '../second_api/widget/dio.dart';
import '../third_api/third_api_screen.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.indigo,
        title: Text('Home Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ZoomTapAnimation(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>FirstApi()));
              },
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.indigo,
                ),
                child: Text('First Api',style: TextStyle(color: Colors.white,fontWeight: FontWeight.w600,fontSize: 25),),
              ),
            ),
            ZoomTapAnimation(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>SecondApi()));
              },
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.indigo,
                ),
                child: Text('Second Api',style: TextStyle(color: Colors.white,fontWeight: FontWeight.w600,fontSize: 25),),
              ),
            ),
            ZoomTapAnimation(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>ThirdApi()));
              },
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.indigo,
                ),
                child: Text('Third Api',style: TextStyle(color: Colors.white,fontWeight: FontWeight.w600,fontSize: 25),),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
