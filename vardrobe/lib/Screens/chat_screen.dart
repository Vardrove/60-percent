import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:vardrobe/Widgets/constants.dart';
import 'package:vardrobe/Widgets/message_bubble.dart';

class chat_screen extends StatefulWidget {
  @override
  _chat_screenState createState() => _chat_screenState();
}

class _chat_screenState extends State<chat_screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(30, 31, 40, 0.9),
      appBar: AppBar(
        title: Text("Vendor Name",style: TextStyle(fontFamily: kfontfamily,fontSize:30.0 ),),
        leading: IconButton(
          icon: Icon(FontAwesomeIcons.chevronLeft,color: Colors.white,),
          onPressed: (){
            Navigator.pop(context);
          },
        ),
        backgroundColor: const  Color.fromRGBO(30, 31, 40, 0.8),
      ),
      body: Padding(
        padding: EdgeInsets.only(left:10.0 ,right: 10.0,bottom: 15.0),
        child: Column(
          children:<Widget> [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    message_bubble(text:"Hiya there fuckers",isme:true,sender:"ali@gmail.com"),
                    message_bubble(text:"Hiya there fuckers",isme:true,sender:"ali@gmail.com"),
                    message_bubble(text:"Hiya there fuckers",isme:false,sender:"ali@gmail.com"),
                    message_bubble(text:"Hiya there fuckers",isme:false,sender:"ali@gmail.com"),
                    message_bubble(text:"Hiya there fuckers",isme:true,sender:"ali@gmail.com"),
                    message_bubble(text:"Hiya there fuckers",isme:true,sender:"ali@gmail.com"),
                    message_bubble(text:"Hiya there fuckers",isme:false,sender:"ali@gmail.com"),
                    message_bubble(text:"Hiya there fuckers",isme:false,sender:"ali@gmail.com"),
                    message_bubble(text:"Hiya there fuckers",isme:true,sender:"ali@gmail.com"),
                    message_bubble(text:"Hiya there fuckers",isme:true,sender:"ali@gmail.com"),
                    message_bubble(text:"Hiya there fuckers",isme:false,sender:"ali@gmail.com"),
                    message_bubble(text:"Hiya there fuckers",isme:false,sender:"ali@gmail.com"),
                  ],
                ),
              ),
            ),
            Row(
              children: <Widget>[
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Color(0xff2A2C36),
                      hintText: 'Your message',
                      hintStyle: TextStyle(
                          fontSize: 15.0,
                          fontFamily: kfontfamily,
                          color: Colors.white
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide:
                        BorderSide(color: Color(0xff2A2C36), width: 1.0),
                        borderRadius: BorderRadius.all(Radius.circular(15.0)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                        BorderSide(color: Colors.red, width: 2.0),
                        borderRadius: BorderRadius.all(Radius.circular(15.0)),
                      ),
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(FontAwesomeIcons.paperPlane,color: Colors.white,size: 25.0,),
                  onPressed: (){
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
