import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextLink extends StatefulWidget {
  final String text;
  final Function()? onTap;

  TextLink(this.text, {this.onTap});

  @override
  _TextLinkState createState() => _TextLinkState();
}

class _TextLinkState extends State<TextLink> {
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
        child: Text(
          widget.text,
          style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: isHover ? Colors.blue[300] : Colors.grey[700]),
        ),
      ),
    );
  }
}
