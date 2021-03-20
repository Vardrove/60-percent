import 'package:flutter/material.dart';
import 'package:flutter_page_transition/flutter_page_transition.dart';
import 'package:flutter_page_transition/page_transition_type.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:vardrobe/Screens/home_screen.dart';
import 'package:vardrobe/Screens/navigation_screen.dart';
import 'package:vardrobe/Widgets/constants.dart';
import 'package:vardrobe/Widgets/new_product.dart';
import 'package:vardrobe/Widgets/sale_product.dart';

class ar_vr_screen extends StatefulWidget {
  @override
  ar_vr_screenState createState() => ar_vr_screenState();
}

class ar_vr_screenState extends State<ar_vr_screen> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: ()async{
       return Navigator.push(context, PageRouteBuilder(
            transitionDuration: const Duration(milliseconds: 500),
            transitionsBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation,Widget child){
              return effectMap[PageTransitionType.rippleRightUp](Curves.linear,animation,secondaryAnimation,child);
            },
            pageBuilder: (BuildContext  context, Animation<double> animation, Animation<double> secondaryAnimation){
              return navigation_screen();
            }
        ));
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor:const Color.fromRGBO(30, 31, 40, 0.9) ,
          leading: IconButton(
            icon: Icon(FontAwesomeIcons.chevronLeft,color: Colors.white,size: 20.0,),
            onPressed: (){
              return Navigator.push(context, PageRouteBuilder(
                  transitionDuration: const Duration(milliseconds: 500),
                  transitionsBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation,Widget child){
                    return effectMap[PageTransitionType.rippleRightUp](Curves.linear,animation,secondaryAnimation,child);
                  },
                  pageBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation){
                    return navigation_screen();
                  }
              ));
            },
          ),
          title: Text("AR & Virtual Try-on",style: TextStyle(fontFamily: kfontfamily,fontSize: 26.0),),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(left: 10.0,top: 10.0),
            child: Column(
              children:<Widget>[ GridView.count(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                childAspectRatio: 0.4,
                crossAxisCount: 2,
                crossAxisSpacing: 40.0,
                children: <Widget>[
                  // sale_product(sale: '-20%',image_path:'Assets/images/watches.png',reviews: 10,designer: 'Rolex',item: 'Watch',original_price: 1500,sale_price: 1000,),
                  // new_product(image_path:'Assets/images/newsportsdress.png',reviews: 9,designer: 'Nike',item: 'Sport Dress',original_price: 220,),
                  //
                  // sale_product(sale: '-1%',image_path:'Assets/images/tshirtitem.png',reviews: 11,designer: 'Mango',item: 'T-Shirt',original_price: 10,sale_price: 9,),
                  //
                  // new_product(image_path:'Assets/images/newpullover.png',reviews:25,designer: 'Adidas',item: 'Pullover',original_price: 200,),
                  //
                  // sale_product(sale: '-40%',image_path:'Assets/images/jacket.png',reviews: 5,designer: 'Breakout',item: 'Winter Jacket',original_price: 100,sale_price: 60,),
                  //
                  // new_product(image_path:'Assets/images/newtshirt.png',reviews: 4,designer: 'Adidas',item: 'T-Shirt',original_price: 150,),
                ],
              ),],),
          ),
          ),
        ),
    );
  }
}
