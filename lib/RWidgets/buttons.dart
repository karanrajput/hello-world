import 'package:bkdschool/data/services/services.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:bkdschool/RWidgets/RWidgets.dart';

//Button Simple
//
class RBorderButton extends StatelessWidget {
  final String text;
  final double borderWidth;
  final double borderRadius;
  final Color color;
  final double fontSize;
  final VoidCallback onPressed;
  final bool enabled;
  final Widget icon;

  const RBorderButton(
      {this.text = "Button",
      this.onPressed,
      this.borderRadius = 50,
      this.borderWidth = 1.5,
      this.fontSize = 20,
      this.color = Globals.colorMain,
      this.enabled = true,
      this.icon});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: enabled ? onPressed : null,
      borderRadius: BorderRadius.circular(borderRadius),
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(
                color: enabled ? color : Colors.grey, width: borderWidth),
            borderRadius: BorderRadius.circular(borderRadius)),
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: icon == null ? 30 : 20, vertical: 10),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                text,
                style: GoogleFonts.mcLaren(
                    color: enabled ? color : Colors.grey,
                    fontSize: fontSize,
                    fontWeight: FontWeight.w400),
              ),
              icon != null
                  ? Padding(
                      padding: const EdgeInsets.only(left: 10), child: icon)
                  : SizedBox()
            ],
          ),
        ),
      ),
    );
  }
}

//
//
//RButton
class RButton extends StatelessWidget {
  final String text;
  final double borderRadius;
  final Color color;
  final Color textColor;
  final double fontSize;
  final VoidCallback onPressed;
  final bool enabled;
  final Widget icon;
  final EdgeInsets padding;
  final double elevation;

  const RButton(
      {this.text = "Button",
      this.onPressed,
      this.borderRadius = 50,
      this.fontSize = 18,
      this.color = Globals.colorMain,
      this.enabled = true,
      this.icon,
      this.textColor = Colors.white,
      this.padding = const EdgeInsets.all(0),
      this.elevation = 2});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Padding(
        padding: padding,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            icon != null ? icon : Container(),
            SizedBox(
              width: icon != null ? 10 : 0,
            ),
            makeText(text, fontSize: fontSize, color: textColor)
          ],
        ),
      ),
      style: ButtonStyle(
          elevation: MaterialStateProperty.all(elevation),
          backgroundColor: MaterialStateProperty.all(color),
          shape: MaterialStateProperty.all(RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius)))),
    );
  }
}

//
//RIconButton

class RIconButton extends StatelessWidget {
  final Widget customIcon;
  final double borderRadius;
  final Color color;
  final Color iconColor;
  final double fontSize;
  final VoidCallback onPressed;
  final bool enabled;
  final IconData icon;
  final double iconSize;
  final EdgeInsets padding;
  final double elevation;

  const RIconButton(
      {this.customIcon,
      this.onPressed,
      this.borderRadius = 50,
      this.fontSize = 18,
      this.color = Globals.colorMain,
      this.enabled = true,
      this.icon,
      this.padding = const EdgeInsets.all(12),
      this.elevation = 10,
      this.iconColor = Colors.white,
      this.iconSize = 35});

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(borderRadius),
      color: color,
      elevation: elevation,
      child: InkWell(
        onTap: enabled ? onPressed : null,
        borderRadius: BorderRadius.circular(borderRadius),
        child: Padding(
            padding: padding,
            child: customIcon == null
                ? Icon(
                    icon,
                    size: iconSize,
                    color: iconColor,
                  )
                : customIcon),
      ),
    );
  }
}
