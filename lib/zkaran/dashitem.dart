import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Toatalitem extends StatelessWidget {
  const Toatalitem({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // decoration: BoxDecoration(borderRadius: Border.all(Radius.circular(8))),
      child: Container(
        decoration: BoxDecoration(
          border: Border(
            left: BorderSide(
              color: Colors.black,
              width: 3.0,
            ),
          ),
          color: Color.fromARGB(255, 255, 224, 248),
          // borderRadius: BorderRadius.all(Radius.circular(8))
        ),
        height: 80,
        width: 200,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
          child: InkWell(
            onTap: () => null,
            child: Row(
              children: [
                Icon(
                  Icons.people,
                  size: 50,
                ),
                VerticalDivider(),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Teachers',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                    Text(
                      '1500',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
