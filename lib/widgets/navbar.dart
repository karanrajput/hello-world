import 'package:flutter/material.dart';
import 'package:bkdschool/data/services/responsive.dart';
import 'package:bkdschool/widgets/widgets.dart';

class RScaffold extends StatelessWidget {
  final Widget body;

  const RScaffold({Key key, @required this.body}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = ResponsiveWidget.size(context);
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(size.width, 100),
        child: Container(
          color: Colors.grey[100],
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [RLinkButton()],
          ),
        ),
      ),
      body: body,
    );
  }
}
