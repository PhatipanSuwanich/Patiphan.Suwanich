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

  var list = ["Home", "Skills", "Experience", "Projects", "My blog"];

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
        backgroundColor: Colors.blueGrey,
        title: Row(
          children: <Widget>[
            Container(
              width: 50,
              height: 50,
              margin: EdgeInsets.all(8),
            ),
            Spacer(),
            Row(
              children: List.generate(4, (index) {
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
            SizedBox(
                height: ResponsiveWrapper.of(context).isLargerThan(TABLET)
                    ? 110
                    : 50),
            if (ResponsiveWrapper.of(context).isLargerThan(MOBILE))
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  // mainAxisSize: MainAxisSize.max,
                  children: [
                    cardProfile(),
                    SizedBox(
                        width:
                            ResponsiveWrapper.of(context).isLargerThan(TABLET)
                                ? 80
                                : 10),
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
            SizedBox(
                height: ResponsiveWrapper.of(context).isLargerThan(TABLET)
                    ? 130
                    : 100),
            AutoScrollTag(
              key: ValueKey(1),
              controller: controller,
              index: 1,
              child: Container(
                padding: ResponsiveWrapper.of(context).isLargerThan(TABLET)
                    ? EdgeInsets.fromLTRB(0, 60, 0, 0)
                    : EdgeInsets.fromLTRB(50, 40, 0, 0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "My skills.",
                      style:
                          TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 40),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              blockSkill("Programming:", [
                                "Java",
                                "Dart",
                                "Solidity",
                                "Kotlin",
                                "JavaScript"
                              ]),
                              SizedBox(width: 40),
                              blockSkill("Operating Systems:", [
                                "Flutter",
                                "Ethereum",
                                "Vue",
                                "Line Liff",
                                "Spring Boot"
                              ]),
                              SizedBox(width: 40),
                              blockSkill("Tools:", [
                                "Android Studio",
                                "Visual Studio Code",
                                "ReMix",
                                "Intellij",
                                "Jira",
                                "Zeplin"
                              ]),
                            ],
                          ),
                          SizedBox(height: 40),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              blockSkill("Operating Systems:", [
                                "Microsoft Windows",
                                "Mac-OSX",
                                "",
                                "",
                                "",
                                ""
                              ]),
                              SizedBox(width: 40),
                              blockSkill("Databases:",
                                  ["Firebase", "My SQL", "SQLite", "", ""]),
                              SizedBox(width: 40),
                              blockSkill("Video Game:", [
                                "Thetan Arena",
                                "ROV",
                                "Dota 2",
                                "Far Cry",
                                "Dying Light",
                                "Grand Theft Auto"
                              ]),
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
                height: ResponsiveWrapper.of(context).isLargerThan(TABLET)
                    ? 110
                    : 30),
            AutoScrollTag(
              key: ValueKey(2),
              controller: controller,
              index: 2,
              child: Container(
                padding: ResponsiveWrapper.of(context).isLargerThan(TABLET)
                    ? EdgeInsets.fromLTRB(220, 70, 200, 0)
                    : EdgeInsets.fromLTRB(50, 50, 50, 0),
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
                                'Developed cross-platform application “Kept”, an application for financial management to make savings simple and achievable.\n • Manage and build app packages android and ios for publish an app on store.\n • Create a RESTful API to handle LINE notifications from Alertmanager.\n • Working with tester, designer, business analyst to design feature for the fastest delivery as an agile team member.'),
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
            SizedBox(
                height: ResponsiveWrapper.of(context).isLargerThan(TABLET)
                    ? 120
                    : 40),
            AutoScrollTag(
              key: ValueKey(3),
              controller: controller,
              index: 3,
              child: Container(
                padding: ResponsiveWrapper.of(context).isLargerThan(TABLET)
                    ? EdgeInsets.fromLTRB(100, 40, 100, 0)
                    : EdgeInsets.fromLTRB(70, 50, 0, 0),
                child: Column(
                  children: [
                    Text(
                      "Project.",
                      style:
                          TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                        height:
                            ResponsiveWrapper.of(context).isLargerThan(TABLET)
                                ? 50
                                : 80),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        blockProject(
                            title: "Kept – saving with your style",
                            detail:
                                "Sometimes the hardest thing about saving money is just getting started and making it a habit. Kept application is created to help you reach your savings mission with various tailored solutions that perfectly fit your lifestyle.",
                            tech: "",
                            image: 'assets/images/kept.PNG',
                            git: "",
                            web: "https://www.keptbykrungsri.com"),
                        SizedBox(height: 30),
                        blockProject(
                            title: "Lifescape : Lifestyle & Living",
                            detail:
                                "Providing a new lifestyle experience for everyone. A variety of brilliant functions to fulfill your living needs.",
                            tech: "Futter | PHP | SQL | Firebase",
                            image: 'assets/images/lifescape.PNG',
                            git: "",
                            web:
                                "https://play.google.com/store/apps/details?id=co.th.mde.majorcare&hl=th&gl=US"),
                        SizedBox(height: 30),
                        blockProject(
                            title: "Oxford list word translation game",
                            detail: "3000 words oxford vocabulary app.",
                            tech: "Futter | Firebase",
                            image: 'assets/images/oxford.PNG',
                            git:
                                "https://github.com/PhatipanSuwanich/oxford3000",
                            web: "https://oxford3000-a201f.web.app"),
                        SizedBox(height: 30),
                        blockProject(
                            title: "Decentralised-Testament",
                            detail:
                                "The world has now transitioned to a digital democracy, but maintaining crypto and passing it on has become challenging. It is not democratic since the seed phrase must be overseen by a lawyer.\n\nIsn't it good to have a smart contract that makes expressing your will simple, secure, and democratic?",
                            tech: "VueJS | Ethereum | GitHub Pages",
                            image: 'assets/images/testament.PNG',
                            git:
                                "https://github.com/PhatipanSuwanich/Decentralised-Testament",
                            web:
                                "https://phatipansuwanich.github.io/Decentralised-Testament"),
                        SizedBox(height: 30),
                        blockProject(
                            title: "Resume website",
                            detail: "My Resume website.",
                            tech: "Futter | Firebase",
                            image: 'assets/images/resume.PNG',
                            git:
                                "https://github.com/PhatipanSuwanich/Patiphan.Suwanich",
                            web: "https://resume-3506e.web.app"),
                      ],
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
                height: ResponsiveWrapper.of(context).isLargerThan(TABLET)
                    ? 120
                    : 20),
            AutoScrollTag(
              key: ValueKey(4),
              controller: controller,
              index: 4,
              child: Container(
                padding: ResponsiveWrapper.of(context).isLargerThan(TABLET)
                    ? EdgeInsets.fromLTRB(150, 40, 100, 100)
                    : EdgeInsets.fromLTRB(70, 50, 200, 100),
                child: Column(
                  children: [
                    Text(
                      "Posts & Articles.",
                      style:
                          TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                        height:
                            ResponsiveWrapper.of(context).isLargerThan(TABLET)
                                ? 40
                                : 20),
                    GridView.count(
                      shrinkWrap: true,
                      crossAxisCount:
                          ResponsiveWrapper.of(context).isLargerThan(TABLET)
                              ? 3
                              : 1,
                      mainAxisSpacing:
                          ResponsiveWrapper.of(context).isLargerThan(TABLET)
                              ? 30
                              : 20,
                      crossAxisSpacing:
                          ResponsiveWrapper.of(context).isLargerThan(TABLET)
                              ? 30
                              : 50,
                      children: [
                        BlogLink(
                          "ออมดิจิทัลทางเลือกใหม่ สำหรับคนที่อยากได้ดอกสูงๆ",
                          "Kept | Krungsri | Finance",
                          "https://miro.medium.com/max/1400/1*oQdoRLo2YMu-Xq7_4AQnEg.png",
                          onTap: () => _launchURL(
                              "https://benzdroid.medium.com/ออมดิจิทัลทางเลือกใหม่-สำหรับคนที่อยากได้ดอกสูงๆ-แต่ไม่อยากฝากประจำ-90ec2099e05d"),
                        ),
                        BlogLink(
                          "อยากเทรด Bitcoin แต่ไม่รู้อะไรเลย",
                          "Bitcoin | Cytocerency | BlockChain",
                          "https://miro.medium.com/max/1400/1*j8P31kDtHGFR0PfQnBt93A.png",
                          onTap: () => _launchURL(
                              "https://benzdroid.medium.com/อยากเทรด-bitcoin-แต่ไม่รู้อะไรเลย-67cabcc2266a"),
                        ),
                        BlogLink(
                          "ทำ Sticker line ตั้งแต่ User จนเป็น Line Creator",
                          "Sticker | Line | Line Creator",
                          "https://miro.medium.com/max/1400/1*t6LZ6BH4bschZO1zgwp-wA.jpeg",
                          onTap: () => _launchURL(
                              "https://benzdroid.medium.com/ขอเล่าการทำ-sticker-line-ตั้งแต่-user-จนเป็น-line-creator-b479b6f28854"),
                        ),
                        BlogLink(
                          "สร้าง Scheduler Line Notify แบบไม่ต้องเขียนโค้ดสักตัว",
                          "Line | Line Bot | Scheduling",
                          "https://miro.medium.com/max/1400/1*GE3O81zGU96kAuzGLQsqhA.png",
                          onTap: () => _launchURL(
                              "https://benzdroid.medium.com/สร้าง-scheduler-line-notify-แบบไม่ต้องเขียนโค้ดสักตัว-9d1b0e2d1a90"),
                        ),
                        BlogLink(
                          "ฝึกภาษา Dart ภาษาใหม่ของ Google",
                          "Dart | Flutter | Cross-platform",
                          "https://miro.medium.com/max/770/1*l270bycqZH-57DJtB9cVkg.png",
                          onTap: () => _launchURL(
                              "https://benzdroid.medium.com/ฝึกภาษา-dart-ภาษาใหม่ของ-google-85cea7221691"),
                        ),
                        BlogLink(
                          "Intro screen in Flutter",
                          "Dart | Flutter | Cross-platform",
                          "https://miro.medium.com/max/1400/1*3AJ_hcXcaXkkVT4LIlJ7Fg.png",
                          onTap: () => _launchURL(
                              "https://benzdroid.medium.com/intro-screen-in-flutter-2ba5822bcd0a"),
                        ),
                      ],
                    ),
                    SizedBox(
                        height:
                            ResponsiveWrapper.of(context).isLargerThan(TABLET)
                                ? 40
                                : 30),
                    TextLink(
                      "See more.",
                      onTap: () => _launchURL("https://benzdroid.medium.com"),
                    ),
                  ],
                ),
              ),
            ),
          ]),
      floatingActionButton: _showBackToTopButton == false
          ? null
          : FloatingActionButton(
              onPressed: _scrollToTop,
              child: Icon(Icons.arrow_upward),
            ),
    );
  }

  Row blockProject(
      {required String title,
      required String detail,
      required String tech,
      required String image,
      required String git,
      required String web}) {
    return Row(
      mainAxisAlignment: ResponsiveWrapper.of(context).isLargerThan(TABLET)
          ? MainAxisAlignment.spaceEvenly
          : MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (ResponsiveWrapper.of(context).isSmallerThan(DESKTOP))
                Container(
                  width: 300,
                  child: Image(
                    image: AssetImage(image),
                  ),
                ),
              SizedBox(height: 20),
              Container(
                width: 380,
                child: detailProject(title, detail, tech),
              ),
              SizedBox(height: 10),
              linkToProject(git, web),
              if (ResponsiveWrapper.of(context).isSmallerThan(DESKTOP))
                SizedBox(
                  height: 50,
                  width: 300,
                  child: Divider(
                    height: 0,
                    thickness: 3,
                    endIndent: 0,
                    color: Colors.blueGrey,
                  ),
                ),
            ]),
        if (ResponsiveWrapper.of(context).isLargerThan(TABLET))
          Container(
            width: 420,
            child: Image(
              image: AssetImage(image),
            ),
          )
      ],
    );
  }

  Row linkToProject(git, web) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (git != "")
            IconButton(
                icon: FaIcon(FontAwesomeIcons.github),
                onPressed: () => _launchURL(git)),
          IconButton(
              icon: FaIcon(FontAwesomeIcons.mobileScreen),
              onPressed: () => _launchURL(web)),
        ]);
  }

  Text detailProject(String title, String detail, String tech) {
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(
              text: '$title\n',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
          TextSpan(text: detail, style: TextStyle(height: 2, fontSize: 18)),
          if (tech != "")
            TextSpan(
                text: "\nTech Stack:  $tech",
                style: TextStyle(height: 2, fontSize: 14)),
        ],
      ),
    );
  }

  Widget blockSkill(title, List<String> skills) {
    return Container(
      width: 250,
      height: 230,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text.rich(
            TextSpan(
              children: [
                TextSpan(
                    text: '${title}\n',
                    style:
                        TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                TextSpan(
                    text: "${skills[0]}\n",
                    style: TextStyle(height: 2, fontSize: 18)),
                TextSpan(
                    text: "${skills[1]}\n",
                    style: TextStyle(height: 1.7, fontSize: 18)),
                TextSpan(
                    text: "${skills[2]}\n",
                    style: TextStyle(height: 1.7, fontSize: 18)),
                TextSpan(
                    text: "${skills[3]}\n",
                    style: TextStyle(height: 1.7, fontSize: 18)),
                TextSpan(
                    text: "${skills[4]}",
                    style: TextStyle(height: 1.7, fontSize: 18)),
              ],
            ),
          ),
        ],
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
      width: 380,
      // height: 310,
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
              color: Colors.blueGrey,
            ),
          ),
          Text(
            "I'm interested in Flutter, Ethereum, and LINE LIFF. I'm also a digital trader and gamer on the blockchain.",
            style: TextStyle(fontSize: 24),
          ),
        ],
      ),
    );
  }

  SizedBox cardProfile() {
    return SizedBox(
      width: 400,
      height: 500,
      child: Card(
        elevation: 70,
        shadowColor: Colors.blueGrey,
        color: Colors.grey,
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Spacer(),
            CircleAvatar(
              backgroundImage: AssetImage('assets/images/profile.jpg'),
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
                color: Colors.blueGrey,
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
