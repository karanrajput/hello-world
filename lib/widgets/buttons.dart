import 'dart:ui';
import 'package:flutter/material.dart';

class RLinkButton extends StatefulWidget {
  @override
  _RLinkButtonState createState() => _RLinkButtonState();
}

class _RLinkButtonState extends State<RLinkButton> {
  bool isHovering = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      onHover: (bool) {
        setState(() {
          isHovering = bool;
        });
      },
      child: Container(
        child: Stack(
          alignment: Alignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Text(
                "Contact us",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            Positioned(
                bottom: 4,
                child: AnimatedContainer(
                  height: 3.5,
                  width: isHovering ? 50 : 0,
                  decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(10)),
                  duration: Duration(milliseconds: 100),
                ))
          ],
        ),
      ),
    );
  }
}
