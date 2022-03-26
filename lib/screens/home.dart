// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:scroll_to_index/scroll_to_index.dart';
import 'package:url_launcher/url_launcher.dart';
import '../widgets/bloglink.dart';
import '../widgets/textlink.dart';
import '../widgets/timeline.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // this variable determnines whether the back-to-top button is shown or not
  bool _showBackToTopButton = false;

  var list = ["Home", "About me", "My Projects", "My blog"];

  late AutoScrollController controller;

  @override
  void initState() {
    controller = AutoScrollController();

    controller.addListener(() {
      if (controller.offset >= 1500 && _showBackToTopButton == false) {
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
            SizedBox(height: ResponsiveWrapper.of(context).isLargerThan(TABLET) ? 110 : 50),
            if (ResponsiveWrapper.of(context).isLargerThan(MOBILE))
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  // mainAxisSize: MainAxisSize.max,
                  children: [
                    cardProfile(),
                    SizedBox(width: 10),
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
            SizedBox(height: ResponsiveWrapper.of(context).isLargerThan(TABLET) ? 110 : 20),
            AutoScrollTag(
              key: ValueKey(1),
              controller: controller,
              index: 1,
              child: Container(
                padding: ResponsiveWrapper.of(context).isLargerThan(TABLET)
                    ? EdgeInsets.fromLTRB(220, 70, 200, 0)
                    : EdgeInsets.fromLTRB(50, 70, 50, 0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Education and Experience.",
                      style:
                          TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Timeline(
                      itemGap: 30,
                      gutterSpacing: 20,
                      children: <Widget>[
                        detailOfTimeline(
                            title:
                                'King Mongkut’s Institute of Technology Ladkrabang (Bangkok, Thailand)',
                            detail:
                                'Bangkok, Thailand Bachelor of Science, Computer Science, May 2019 GPA 2.95'),
                        detailOfTimeline(
                            title:
                                'Krungsri Head Office at rama 3 (July 2019 – February 2021)',
                            detail:
                                'Developed cross-platform application “Kept”, an application for financial management to make savings simple and achievable. • Manage and build app packages android and ios for publish an app on store. • Create a RESTful API to handle LINE notifications from Alertmanager. • Working with tester, designer, business analyst to design feature for the fastest delivery as an agile team member.'),
                        detailOfTimeline(
                            title:
                                'Major Development PCL. at major tower (February 2021 - August 2021)',
                            detail:
                                'Developed cross-platform application “Major lifescape” and “Lifescape”, an application for owner or tenant manage resources inside and outside the room of the residence and receive real-time news and notifications from legal entities.'),
                        detailOfTimeline(
                            title:
                                'Fillgoods Technology Co., Ltd. (September 2021 - November 2021)',
                            detail:
                                'Developed cross-platform application for retail stores'),
                        detailOfTimeline(
                            title: 'Full Time Trader (November 2021 - Now)',
                            detail:
                                'Full-time trader cryptocurrency and gamer of NFT game'),
                      ],
                      indicators: <Widget>[
                        Icon(Icons.circle),
                        Icon(Icons.circle),
                        Icon(Icons.circle),
                        Icon(Icons.circle),
                        Icon(Icons.circle),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: ResponsiveWrapper.of(context).isLargerThan(TABLET) ? 120 : 20),
            AutoScrollTag(
              key: ValueKey(2),
              controller: controller,
              index: 2,
              child: Container(
                padding: ResponsiveWrapper.of(context).isLargerThan(TABLET)
                    ? EdgeInsets.fromLTRB(220, 40, 200, 0)
                    : EdgeInsets.fromLTRB(50, 50, 50, 0),
                child: Column(
                  children: [
                    Text(
                      "Project.",
                      style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: ResponsiveWrapper.of(context).isLargerThan(TABLET) ? 90 : 20),
                    GridView.count(
                      shrinkWrap: true,
                      crossAxisCount:
                          ResponsiveWrapper.of(context).isLargerThan(TABLET)
                              ? 2
                              : 1,
                      mainAxisSpacing: 100,
                      crossAxisSpacing: 70,
                      children: [
                        // BlogLink(
                        //   "Oxford list word translation game",
                        //   "3000 words oxford vocabulary app.",
                        //   "images/oxford.PNG",
                        //   onTap: () =>
                        //       _launchURL("https://oxford3000-a201f.web.app"),
                        // ),
                        BlogLink(
                          "Oxford list word translation game",
                          "3000 words oxford vocabulary app.",
                          "images/oxford.PNG",
                          onTap: () =>
                              _launchURL("https://oxford3000-a201f.web.app"),
                        ),
                        Container(color: Colors.teal),
                        Container(color: Colors.teal),
                        Container(color: Colors.grey),
                        Container(color: Colors.grey),
                        Container(color: Colors.teal),
                      ],
                    ),
                  ],
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

  Container detailOfTimeline({required String title, required String detail}) {
    return Container(
        child: Text.rich(
      TextSpan(
        children: [
          TextSpan(
              text: '${title}\n',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
          TextSpan(text: detail, style: TextStyle(fontSize: 18)),
        ],
      ),
    ));
  }

  Widget miniMe() {
    return Container(
      width: 370,
      height: 310,
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 20),
          Text(
            "Hello",
            style: TextStyle(fontSize: 100, fontWeight: FontWeight.bold),
          ),
          Text(
            "Here's who I am & what I do",
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
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
              style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
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
                        icon: FaIcon(FontAwesomeIcons.linkedinIn,
                            color: Colors.white),
                        onPressed: () => _launchURL(
                            "https://www.linkedin.com/in/patiphan-suwanich-a0203a195")),
                    IconButton(
                        icon: FaIcon(FontAwesomeIcons.github,
                            color: Colors.white),
                        onPressed: () =>
                            _launchURL("https://github.com/PhatipanSuwanich")),
                    IconButton(
                        icon: FaIcon(FontAwesomeIcons.medium,
                            color: Colors.white),
                        onPressed: () =>
                            _launchURL("https://benzdroid.medium.com"))
                  ]),
            )
          ],
        ),
      ),
    );
  }

  void _scrollToIndex(int index) {
    controller.scrollToIndex(index + 1,
        duration: Duration(seconds: 1),
        preferPosition: AutoScrollPosition.begin);
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

  void _launchURL(_url) async {
    if (!await launch(_url)) throw 'Could not launch $_url';
  }
}
