import 'package:flutter/cupertino.dart';

class ResponsiveWidget extends StatelessWidget {
  final Widget large;
  final Widget mid;
  final Widget small;

  const ResponsiveWidget({Key key, this.large, this.mid, this.small})
      : super(key: key);

  static Size size(BuildContext con) => MediaQuery.of(con).size;

  static bool isLarge(BuildContext con) => size(con).width > 1200;
  static bool isMid(BuildContext con) =>
      size(con).width <= 1200 && size(con).width >= 800;
  static bool isSmall(BuildContext con) => size(con).width < 800;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, contraints) {
      if (contraints.maxWidth > 1200) {
        return large;
      } else if (contraints.maxWidth <= 1200 && contraints.maxWidth >= 800) {
        return mid ?? large;
      } else {
        return small ?? large;
      }
    });
  }
}
