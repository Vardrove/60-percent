import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:toast/toast.dart';
import 'package:vardrobe/Widgets/sizeandcolorfilter.dart';
import 'package:vardrobe/Widgets/sortfilters.dart';
import 'package:vardrobe/Widgets/constants.dart';
import 'package:vardrobe/Widgets/filtersandsort.dart';

class search_screen extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<search_screen> {
  String _filtervalue=sortfilters.sortfilter[0];
  RangeValues _currentvalues= const RangeValues(40, 80);
  int _defaultchipindex=0;
  double _currentvalue=1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const  Color.fromRGBO(30, 31, 40, 0.7),
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(FontAwesomeIcons.chevronLeft,color: Colors.white,),
          onPressed: (){
            Navigator.pop(context);
          },
        ),
        elevation: 8.0,
        backgroundColor:const  Color.fromRGBO(30, 31, 40, 0.9),
        title: TextField(
          textInputAction: TextInputAction.search,
          autofocus: true,
          decoration: InputDecoration(
            hintText: 'T-shirt',
            hintStyle: TextStyle(
              fontSize: 18.0,
              fontFamily: kfontfamily,
            ),
            enabledBorder: OutlineInputBorder(
              borderSide:
              BorderSide(color: Color.fromRGBO(30, 31, 40, 0.7), width: 1.0),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide:
              BorderSide(color: Color.fromRGBO(30, 31, 40, 0.7), width: 2.0),
            ),
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(left: 10.0,top: 10.0,right: 10.0),
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                GestureDetector(
                    child: filtersandsort(filtername: "Filter",icontype: FontAwesomeIcons.filter,),
                  onTap: (){
                    showModalBottomSheet(
                      isScrollControlled: true,
                      context: context,
                      builder:(context)=>Container(
                        decoration: BoxDecoration(
                            color:const  Color.fromRGBO(30, 31, 40, 1.0),
                            borderRadius: BorderRadius.only(topRight:Radius.circular(35.0) ,topLeft: Radius.circular(35.0),)
                        ),
                        child: StatefulBuilder(
                          builder: (BuildContext con,StateSetter state){
                            return Padding(
                              padding: EdgeInsets.only(top: 10.0,left: 10.0,right: 10.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children:<Widget> [
                                  Align(alignment: Alignment.topCenter,child: Text("Filters",style: TextStyle(fontFamily: kfontfamily,fontSize: 20.0),)),
                                  const SizedBox(height: 20.0,),
                                  Text("Price range",style: TextStyle(fontFamily: kfontfamily,fontSize: 18.0),),
                                  const SizedBox(height: 20.0,),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Text("\$"+"${_currentvalues.start.round()}",style: TextStyle(fontFamily: kfontfamily,fontSize: 16.0),),
                                      Text("\$"+"${_currentvalues.end.round()}",style: TextStyle(fontFamily: kfontfamily,fontSize: 16.0),),
                                    ],
                                  ),
                                  RangeSlider(
                                    divisions: 1000,
                                    activeColor: Color(0xffEF3651),
                                      inactiveColor: Colors.grey,
                                      values:_currentvalues,
                                      min: 1,
                                      max: 1000,
                                      labels: RangeLabels(
                                      _currentvalues.start.round().toString(),
                                        _currentvalues.end.round().toString(),
                                      ),
                                      onChanged:(RangeValues value){
                                        state(()=>_currentvalues=value);
                                      }
                                  ),
                                  const SizedBox(height: 30.0,),
                                  Text("Colors",style: TextStyle(fontFamily: kfontfamily,fontSize: 18.0),),
                                  const SizedBox(height: 10.0,),
                                  SizedBox(
                                    height: 50.0,
                                    child: ListView.separated(
                                      scrollDirection: Axis.horizontal,
                                      itemCount: colorfilter().colorchoicesize,
                                      separatorBuilder:(BuildContext context,int index)=> const SizedBox(width: 25.0,) ,
                                      itemBuilder: (BuildContext context,int index){
                                        return Transform(
                                          transform: new Matrix4.identity()..scale(1.2),
                                          child: ChoiceChip(
                                            label: Text(colorfilter().colorchoices[index]),
                                            labelStyle: TextStyle(fontFamily: kfontfamily,fontSize: 16.0,color: Colors.white),
                                            selected: _defaultchipindex==index,
                                            selectedColor:Color(0xffEF3651),
                                            backgroundColor:Colors.black.withOpacity(0.3),
                                            onSelected: (bool value){
                                              state(()=>_defaultchipindex=value?index:null);
                                            },
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                  const SizedBox(height: 30.0,),
                                  Text("Size",style: TextStyle(fontFamily: kfontfamily,fontSize: 18.0),),
                                  const SizedBox(height: 20.0,),
                                  SizedBox(
                                    height: 50.0,
                                    child: ListView.separated(
                                      scrollDirection: Axis.horizontal,
                                      itemCount: sizefilter().choicesize,
                                      separatorBuilder:(BuildContext context,int index)=> const SizedBox(width: 25.0,) ,
                                      itemBuilder: (BuildContext context,int index){
                                        return Transform(
                                          transform: new Matrix4.identity()..scale(1.2),
                                          child: ChoiceChip(
                                            label: Text(sizefilter().choices[index]),
                                            labelStyle: TextStyle(fontFamily: kfontfamily,fontSize: 16.0,color: Colors.white),
                                            selected: _defaultchipindex==index,
                                            selectedColor:Color(0xffEF3651),
                                            backgroundColor:Colors.black.withOpacity(0.3),
                                            onSelected: (bool value){
                                              state(()=>_defaultchipindex=value?index:null);
                                            },
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                  const SizedBox(height: 30.0,),
                                  Text("Review Rating",style: TextStyle(fontFamily: kfontfamily,fontSize: 18.0),),
                                  const SizedBox(height: 20.0,),
                                  Text("${_currentvalue.round()}"+" star",style: TextStyle(fontFamily: kfontfamily,fontSize: 18.0),),
                                  const SizedBox(height: 20.0,),
                                  Slider(
                                      activeColor: Color(0xffEF3651),
                                    inactiveColor: Colors.grey,
                                    min: 1,
                                    max: 5,
                                    divisions: 4,
                                    value: _currentvalue,
                                    label: _currentvalue.round().toString(),
                                    onChanged: (value){
                                      state(()=>_currentvalue=value);
                                    },
                                  ),
                                  const SizedBox(height: 40.0,),
                                  Padding(
                                    padding: EdgeInsets.only(left: 20.0,right: 20.0),
                                    child: Container(
                                      decoration: BoxDecoration(
                                          borderRadius:BorderRadius.circular(25.0),
                                          boxShadow: [
                                            BoxShadow(
                                              color: Colors.grey.withOpacity(0.3),
                                              spreadRadius: 1,
                                              blurRadius: 1,
                                              offset: Offset(0, 3),
                                            ),
                                          ]
                                      ),
                                      height: 50.0,
                                      width: double.infinity,
                                      child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(25.0),
                                          ),
                                          primary: Color(0xffEF3651)
                                        ),
                                        onPressed: (){
                                          Navigator.pop(context);
                                          Toast.show("Applied", context,duration: Toast.LENGTH_LONG,gravity: Toast.CENTER);
                                        },
                                        child: Text("Apply filters",style: TextStyle(fontSize: 22.0,fontFamily: kfontfamily),),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                    );
                  },
                ),
                SizedBox(width: 15.0,),
                GestureDetector(
                    child: filtersandsort(filtername: "Sort",icontype: FontAwesomeIcons.sort,),
                  onTap: (){
                    showModalBottomSheet(
                      context: context,
                      builder:(context)=>Container(
                        decoration: BoxDecoration(
                            color:const  Color.fromRGBO(30, 31, 40, 1.0),
                            borderRadius: BorderRadius.only(topRight:Radius.circular(35.0) ,topLeft: Radius.circular(35.0),)
                        ),
                        child: StatefulBuilder(
                          builder: (BuildContext con,StateSetter state){
                            return Padding(
                              padding: EdgeInsets.only(top: 10.0,),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children:<Widget> [
                                  Text("Please select an option",style: TextStyle(fontFamily: kfontfamily,fontSize: 20.0),),
                                  const SizedBox(height: 30.0,),
                                  ListTile(
                                    title: Text(sortfilters.sortfilter[0],style: TextStyle(fontFamily: kfontfamily),),
                                    trailing: Radio(
                                      activeColor: Colors.blue,
                                      value: sortfilters.sortfilter[0],
                                      groupValue: _filtervalue,
                                      onChanged: (value) {
                                        state(()=>_filtervalue=value);
                                        Navigator.pop(context);
                                      },
                                    ),
                                  ),
                                  ListTile(
                                    title: Text(sortfilters.sortfilter[1],style: TextStyle(fontFamily: kfontfamily),),
                                    trailing: Radio(
                                      activeColor: Colors.blue,
                                      value: sortfilters.sortfilter[1],
                                      groupValue: _filtervalue,
                                      onChanged: (value) {
                                        state(()=>_filtervalue=value);
                                        Navigator.pop(context);
                                      },
                                    ),
                                  ),
                                  ListTile(
                                    title: Text(sortfilters.sortfilter[2],style: TextStyle(fontFamily: kfontfamily),),
                                    trailing: Radio(
                                      activeColor: Colors.blue,
                                      value: sortfilters.sortfilter[2],
                                      groupValue: _filtervalue,
                                      onChanged: (value) {
                                        state(()=>_filtervalue=value);
                                        Navigator.pop(context);
                                      },
                                    ),
                                  ),
                                  ListTile(
                                    title: Text(sortfilters.sortfilter[3],style: TextStyle(fontFamily: kfontfamily),),
                                    trailing: Radio(
                                      activeColor: Colors.blue,
                                      value: sortfilters.sortfilter[3],
                                      groupValue: _filtervalue,
                                      onChanged: (value) {
                                        state(()=>_filtervalue=value);
                                        Navigator.pop(context);
                                      },
                                    ),
                                  ),
                                  ListTile(
                                    title: Text(sortfilters.sortfilter[4],style: TextStyle(fontFamily: kfontfamily),),
                                    trailing: Radio(
                                      activeColor: Colors.blue,
                                      value: sortfilters.sortfilter[4],
                                      groupValue: _filtervalue,
                                      onChanged: (value) {
                                        state(()=>_filtervalue=value);
                                        Navigator.pop(context);
                                      },
                                    ),
                                  ),
                                  ListTile(
                                    title: Text(sortfilters.sortfilter[5],style: TextStyle(fontFamily: kfontfamily),),
                                    trailing: Radio(
                                      activeColor: Colors.blue,
                                      value: sortfilters.sortfilter[5],
                                      groupValue: _filtervalue,
                                      onChanged: (value) {
                                        state(()=>_filtervalue=value);
                                        Navigator.pop(context);
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                    );
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
