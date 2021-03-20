import 'package:flutter/material.dart';

import 'constants.dart';

class category_item extends StatelessWidget {
  final String image_path;
  final String text;

  category_item({this.image_path, this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children:<Widget>[
          Expanded(
            child: CircleAvatar(
              backgroundColor: Colors.white.withOpacity(0.1),
              radius: 30,
              child: ClipOval(
                  child: Image.asset(image_path)
              ),
            ),
          ),
          SizedBox(height:4.0),
          Text(text,style: TextStyle(fontSize: 14.0,fontFamily: kfontfamily),),
        ],
      ),
    );
  }
}