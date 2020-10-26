import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: Color(0xFF1abc9c),
        child: Column(
          children: [
            Expanded(
              flex: 3,
              child: Container(
                padding: EdgeInsets.all(42),
                width: MediaQuery.of(context).size.width,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "RECEIVE",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w800,
                          fontFamily: 'NanumGothic-Bold',
                          fontSize: 34),
                    ),
                    Text(
                      "ITEMS",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w800,
                          fontFamily: 'NanumGothic-Bold',
                          fontSize: 34),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Text(
                      "INVENTORY MANAGEMENT",
                      style: TextStyle(
                          color: Colors.white70,
                          fontFamily: 'NanumGothic-Regular',
                          fontSize: 16),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
                child: Container(
                  // color: Colors.black54,
                  child: Lottie.asset("assets/animation/lottie/loading.json",width: MediaQuery.of(context).size.width / 1.9),
                )
            ),
            Container(
              padding: EdgeInsets.all(24),
              child: Column(
                children: [
                  Text("Powered By",
                    style: TextStyle(
                        color: Colors.white70
                    ),
                  ),
                  SizedBox(height: 4,),
                  Text("InsightOps.com",
                    style: TextStyle(
                      fontSize: 16,
                        color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
