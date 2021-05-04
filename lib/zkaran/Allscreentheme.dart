import 'package:flutter/material.dart';

class Globaltheme extends StatelessWidget {
  final Widget child;
  final String name;
  final String sname;
  const Globaltheme({
    Key key,
    this.child,
    this.name = "Screen Name",
    this.sname = "",
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SafeArea(
            child: Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                image: AssetImage("images/g.png"),
                fit: BoxFit.cover,
              )),
              child: CustomScrollView(
                slivers: <Widget>[
                  SliverAppBar(
                    titleTextStyle: TextStyle(
                      color: Colors.black,
                    ),
                    shadowColor: Colors.transparent,
                    excludeHeaderSemantics: true,
                    pinned: false,
                    floating: false,
                    backgroundColor: Colors.transparent,
                    expandedHeight: 160.0,
                    flexibleSpace: FlexibleSpaceBar(
                      centerTitle: true,
                      title: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            name,
                            textAlign: TextAlign.center,
                            style:
                                TextStyle(fontSize: 25, color: Colors.black87),
                          ),
                          sname.isNotEmpty
                              ? Text(
                                  sname,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 15, color: Colors.black87),
                                )
                              : Container()
                        ],
                      ),
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white.withOpacity(0.3),
                        ),
                        child: child),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
