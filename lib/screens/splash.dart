import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stock_management/routes/router.gr.dart';
import 'package:stock_management/screens/login.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  PageController pageController = PageController();
  @override
  void initState() {
    super.initState();

    //Do not modify below code this is an intentional delay...
    Future.delayed(Duration(milliseconds: 3000), () {
      if(GetIt.I<SharedPreferences>().getBool("isLoggedIn")??false){

        //So that we won't get back to login aka splash screen...
        ExtendedNavigator.of(context).pushAndRemoveUntil(Routes.homeIndex, (route) => false);
      }else {
        pageController.animateToPage(1, duration: Duration(milliseconds: 800), curve: Curves.easeInOut);
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFF1abc9c),
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: [
              Expanded(
                child: Container(
                  padding: EdgeInsets.all(42),
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
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
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                child: PageView(
                  controller: pageController,
                  children: [
                    Container(
                      padding: EdgeInsets.all(58),
                      child: Lottie.asset(
                        "assets/animation/lottie/loading.json",
                      ),
                    ),
                    Login(),
                  ],
                )
              ),
              Container(
                padding: EdgeInsets.all(24),
                child: Column(
                  children: [
                    Text(
                      "Powered By",
                      style: TextStyle(color: Colors.white70),
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    Text(
                      "InsightOps.com",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    Text(
                      "1.0.0",
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'NanumGothic-Regular',
                          fontSize: 13),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      )
    );
  }
}
