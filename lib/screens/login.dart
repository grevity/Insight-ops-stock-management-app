import 'package:auto_route/auto_route.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stock_management/repository/api/handlers.dart';
import 'package:stock_management/routes/router.gr.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  ApiHandlers apiHandlers = ApiHandlers();
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(left: 42, right: 42, top: 42),
            child: TextFormField(
              controller: emailController,
              style: TextStyle(color: Colors.white),
              cursorColor: Colors.white,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                hintText: "Enter Email",
                prefixIcon: Icon(
                  Icons.mail,
                  color: Colors.white70,
                ),
                hintStyle: TextStyle(color: Colors.white70),
                contentPadding: EdgeInsets.all(15.0),
                border: InputBorder.none,
                filled: true,
                fillColor: Colors.white24,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 42, right: 42, top: 14),
            child: TextFormField(
              controller: passwordController,
              cursorColor: Colors.white,
              style: TextStyle(color: Colors.white),
              obscureText: true,
              decoration: InputDecoration(
                hintText: "Enter Password",
                prefixIcon: Icon(
                  Icons.shield,
                  color: Colors.white70,
                ),
                hintStyle: TextStyle(color: Colors.white70),
                contentPadding: EdgeInsets.all(15.0),
                border: InputBorder.none,
                filled: true,
                fillColor: Colors.white24,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 42, right: 42, top: 14),
            child: Row(
              children: [
                Expanded(
                  child: FlatButton(
                    padding: EdgeInsets.all(16),
                    disabledColor: Colors.white70,
                    onPressed: isLoading ? null
                        :
                        () async {
                      setState(() {
                        isLoading = !isLoading;
                      });
                      Response response = await apiHandlers.login(
                          emailController.text.trim(),
                          passwordController.text.trim());
                      if (response.data["status"]) {
                        if (response.data["user"]["role"]["id"] == 4 ||
                            response.data["user"]["role"]["id"] == 1) {
                          print(response.data["user"]);
                          GetIt.I<SharedPreferences>()
                              .setBool("isLoggedIn", true);
                          GetIt.I<SharedPreferences>()
                              .setString("restaurantId", response.data["user"]["restaurant"]["id"].toString());

                          //So that we won't get back to login aka splash screen...
                          ExtendedNavigator.of(context).pushAndRemoveUntil(Routes.homeIndex, (route) => false);
                        } else {
                          showDialog(
                              context: context,
                              builder: (_) => CustomAlert("Can't Login",
                                  "Only Restaurant Manager & Admin can login"));
                        }
                      } else {
                        showDialog(
                            context: context,
                            builder: (_) => CustomAlert(
                                "Can't Login", response.data["message"]));
                      }
                      setState(() {
                        isLoading = !isLoading;
                      });
                    },
                    color: Colors.white,
                    child: isLoading ?
                         SizedBox(
                            height: 16.0,
                            width: 16.0,
                            child: CircularProgressIndicator(
                                valueColor:
                                    AlwaysStoppedAnimation(Color(0xFF1abc9c)),
                                strokeWidth: 2.0),
                          )
                        :
                    Text(
                      "LOGIN",
                      style: TextStyle(
                        color: Color(0xFF1abc9c),
                      ),
                    )
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CustomAlert extends StatelessWidget {
  final String title;
  final String message;
  CustomAlert(this.title, this.message);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black26,
      body: Center(
        child: Container(
          padding: EdgeInsets.only(left: 21, top: 21, bottom: 12, right: 8),
          color: Colors.white,
          width: MediaQuery.of(context).size.width / 1.4,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  Icon(Icons.error_outline_rounded),
                  SizedBox(
                    width: 2,
                  ),
                  Text(
                    title,
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 21),
                  ),
                ],
              ),
              SizedBox(
                height: 8,
              ),
              Text(
                message,
                style: TextStyle(
                  color: Colors.black54,
                  fontSize: 16,
                ),
              ),
              SizedBox(
                height: 8,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  FlatButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      "OK",
                      style: TextStyle(color: Color(0xFF1abc9c)),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
