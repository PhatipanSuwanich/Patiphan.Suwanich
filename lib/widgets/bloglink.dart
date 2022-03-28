// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class BlogLink extends StatefulWidget {
  final Function()? onTap;
  String title;
  String detail;
  String image;

  BlogLink(this.title, this.detail, this.image, {this.onTap});

  @override
  _BlogLinkState createState() => _BlogLinkState();
}

class _BlogLinkState extends State<BlogLink> {
  bool isHover = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        onEnter: (_) {
          setState(() {
            isHover = true;
          });
        },
        onExit: (_) {
          setState(() {
            isHover = false;
          });
        },
        child: Stack(clipBehavior: Clip.none, children: [
          AnimatedContainer(
            margin: isHover
                ? EdgeInsets.only(right: 30.0, top: 30)
                : EdgeInsets.only(right: 50.0, top: 50),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(widget.image),
                fit: BoxFit.fitHeight,
              ),
            ),
            duration: Duration(milliseconds: 200),
          ),
          Positioned(
            bottom: -1.0,
            left: 10.0,
            right: 10.0,
            child: Card(
              elevation: 10.0,
              shadowColor: Colors.blueGrey,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.fromLTRB(10.0,10.0,10.0,0),
                    child: Text(
                        widget.title,
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color:
                                isHover ? Colors.blue[300] : Colors.grey[700]),

                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: FittedBox(
                        fit: BoxFit.cover, child: Text(widget.detail)),
                  ),
                ],
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
