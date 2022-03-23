// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // this variable determnines whether the back-to-top button is shown or not
  bool _showBackToTopButton = false;


  var list = ["Home", "Services", "Work", "About"];
  var colors = [Colors.orange, Colors.blue, Colors.red, Colors.green];

  PageController controller = PageController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Row(
            children: <Widget>[
              Container(
                width: 50,
                height: 50,
                margin: EdgeInsets.all(8),
                decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(10)),
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
          Expanded(
            child: PageView(
                scrollDirection: Axis.vertical,
                pageSnapping: false,
                controller: controller,
                children: List.generate(list.length, (index) {
                  controller.addListener(() {
                    // setState(() {
                      print(controller.page);
                    //   if (controller.page! >= 1) {
                    //     _showBackToTopButton = true; // show the back-to-top button
                    //   } else {
                    //     _showBackToTopButton = false; // hide the back-to-top button
                    //   }
                    // });
                  });
                  return Container(
                    width: MediaQuery.of(context).size.width,
                    height: double.maxFinite,
                    color: colors[index],
                    child: Center(
                      child: Text(
                        list[index],
                        style: TextStyle(color: Colors.white, fontSize: 50),
                      ),
                    ),
                  );
                })),
          ),
        ],
      )),
      floatingActionButton: _showBackToTopButton == false
          ? null
          : FloatingActionButton(
              onPressed: _scrollToTop,
              child: const Icon(Icons.arrow_upward),
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
        duration: Duration(seconds: 3), curve: Curves.fastLinearToSlowEaseIn);
  }
}
