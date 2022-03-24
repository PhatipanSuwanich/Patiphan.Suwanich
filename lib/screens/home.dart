// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:responsive_framework/responsive_framework.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // this variable determnines whether the back-to-top button is shown or not
  bool _showBackToTopButton = false;

  var list = ["Home", "About me", "My Projects", "My blog"];
  var colors = [Colors.orange, Colors.blue, Colors.red, Colors.green];

  PageController controller = PageController();

  @override
  void initState() {
    controller.addListener(() {
      if (controller.page! >= 1 && _showBackToTopButton == false) {
        setState(() {
          _showBackToTopButton = true; // show the back-to-top button
        });
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: <Widget>[
            Container(
              width: 50,
              height: 50,
              margin: EdgeInsets.all(8),
              decoration: BoxDecoration(
                  color: Colors.blue, borderRadius: BorderRadius.circular(10)),
            ),
            Spacer(),
            Row(
              children: List.generate(3, (index) {
                return GestureDetector(
                  onTap: () {
                    _scrollToIndex(index);
                  },
                  child: Container(
                    margin: EdgeInsets.all(8),
                    child: Text(list[index + 1]),
                  ),
                );
              }),
            )
          ],
        ),
      ),
      body: ListView(
          scrollDirection: Axis.vertical,
          controller: controller,
          children: <Widget>[
            SizedBox(height: 100),
            if (ResponsiveWrapper.of(context).isLargerThan(MOBILE))
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  // mainAxisSize: MainAxisSize.max,
                  children: [
                    cardProfile(),
                    SizedBox(width: 30),
                    miniMe(),
                  ],
                ),
              ),
            if (ResponsiveWrapper.of(context).isSmallerThan(TABLET))
              Container(
                child: Column(
                  children: [
                    cardProfile(),
                    miniMe(),
                  ],
                ),
              ),
            Container(
              width: MediaQuery.of(context).size.width,
              // height: double.maxFinite,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 30),
                  Text(
                    "Experience",
                    style: TextStyle(
                        fontSize: 50, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 100,
                    child: VerticalDivider(
                      color: Colors.black,
                      thickness: 2,
                    ),
                  )
                ],
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              // height: double.maxFinite,
              child: Center(
                child: Text(
                  "TEST",
                ),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              // height: double.maxFinite,
              child: Center(
                child: Text(
                  "TEST",
                ),
              ),
            )
          ]),
      floatingActionButton: _showBackToTopButton == false
          ? null
          : FloatingActionButton(
              onPressed: _scrollToTop,
              child: Icon(Icons.arrow_upward),
            ),
    );
  }

  SizedBox miniMe() {
    return SizedBox(
                    width: 370,
                    height: 400,
                    child: Column(
                      // mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 20),
                        Text(
                          "Hello",
                          style: TextStyle(
                              fontSize: 100, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "Here's who I am & what I do",
                          style: TextStyle(
                              fontSize: 30, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 40,
                          width: 400,
                          child: Divider(
                            thickness: 3,
                            endIndent: 0,
                            color: Colors.brown,
                          ),
                        ),
                        Text(
                          "My main areas of expertise include Flutter, Ethereum, Vue, Line Liff, Spring Boot",
                          style: TextStyle(fontSize: 24),
                        ),
                        Spacer(),
                      ],
                    ),
                  );
  }

  SizedBox cardProfile() {
    return SizedBox(
                    width: 400,
                    height: 500,
                    child: Card(
                      color: Colors.grey,
                      child: Column(
                        // mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Spacer(),
                          CircleAvatar(
                            backgroundImage: AssetImage('images/profile.jpg'),
                            radius: 100,
                          ),
                          SizedBox(height: 30),
                          Text(
                            "Patiphan \nSuwanich",
                            style: TextStyle(
                                fontSize: 32, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 50,
                            width: 100,
                            child: Divider(
                              height: 0,
                              thickness: 3,
                              endIndent: 0,
                              color: Colors.teal,
                            ),
                          ),
                          Text(
                            "Mobile Developer",
                            style: TextStyle(fontSize: 24),
                          ),
                          Spacer(),
                          Container(
                            color: Colors.black,
                            width: 400,
                            height: 50,
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  IconButton(
                                      icon: FaIcon(
                                          FontAwesomeIcons.linkedinIn,
                                          color: Colors.white),
                                      onPressed: () {
                                        print("linkedinIn");
                                      }),
                                  IconButton(
                                      icon: FaIcon(FontAwesomeIcons.github,
                                          color: Colors.white),
                                      onPressed: () {
                                        print("github");
                                      }),
                                  IconButton(
                                      icon: FaIcon(FontAwesomeIcons.medium,
                                          color: Colors.white),
                                      onPressed: () {
                                        print("medium");
                                      })
                                ]),
                          )
                        ],
                      ),
                    ),
                  );
  }

  void _scrollToIndex(int index) {
    controller.animateToPage(index + 1,
        duration: Duration(seconds: 2), curve: Curves.fastLinearToSlowEaseIn);
  }

  // This function is triggered when the user presses the back-to-top button
  void _scrollToTop() {
    controller.animateTo(0,
        duration: Duration(seconds: 2), curve: Curves.fastLinearToSlowEaseIn);
    Future.delayed(Duration(seconds: 1), () {
      setState(() {
        _showBackToTopButton = false;
      });
    });
  }
}
