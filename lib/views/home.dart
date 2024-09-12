import 'dart:async';
import 'package:flutter/material.dart';
import 'package:my_clock/constants/const.dart';
import 'package:my_clock/widgets/an_clock.dart';
import 'package:my_clock/widgets/di_clock.dart';
import 'package:my_clock/widgets/clock_type.dart';
import 'package:my_clock/widgets/slid.dart';
import 'package:my_clock/widgets/widget_color.dart';
// ignore: unused_import required

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late DateTime currentTime;
  late Color color=colors[0];
  late double size=200;
  late String type = "Analog";
  void updatesSelectedColor(Color selected) {
    setState(() {
      color = selected ;
    });
  }

  void updatesSelectedSize(double selected) {
    setState(() {
      size = selected;
    });
  }

  void updatesSelectedType(String selected) {
    setState(() {
      type = selected;
    });
  }

  @override
  void initState() {
    super.initState();
    // ignore: unnecessary_set_literal
    Timer.periodic(const Duration(seconds: 1),
        (_) => setState(() => currentTime = DateTime.now()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Octal Clock',
          style: TextStyle(fontSize: 30),
        ),
        centerTitle: true,
        backgroundColor: colors[6],
      ),
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              currentTime.toString().substring(0, 10),
              style: const TextStyle(fontSize: 35),
            ),
            Expanded(
              child: selection(type),
            ),
          ],
        ),
      ),
      drawer: Drawer(
        child: Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Container(
                width: double.infinity,
                height: 120,
                alignment:Alignment.bottomCenter,
                decoration: BoxDecoration(
                  color: colors[6],
                ),
                child: const Text(
                  'Setting',
                  style: TextStyle(fontSize: 27),
                ),
              ),
              ListTile(
                leading:Icon(Icons.schedule,size:40,color:color),
                title:const Text('Change Type',style: TextStyle(fontSize:23),),
              ),
              Padding(padding:const EdgeInsets.all(5),
                child: Column(
                  children:[
                    Type(type: "Analog",answer:type,onSelected:updatesSelectedType,),
                    Type(type: "Digital",answer:type,onSelected:updatesSelectedType,),
                    Type(type: "Text",answer:type,onSelected:updatesSelectedType,),
                  ]
                ),
              ),
              const Divider(
                thickness: 3,
                indent: 8,
                endIndent: 8,
              ),
              ListTile(
                leading:Icon(Icons.photo_size_select_small,size:40,color:color),
                title:const Text('Change size',style: TextStyle(fontSize:23),),
              ),
              Slid(size: size, onSelected:updatesSelectedSize,),
              const Divider(
                thickness: 3,
                indent: 8,
                endIndent: 8,
              ),
              ListTile(
                leading:Icon(Icons.palette,size:40,color:color),
                title:const Text('Change color',style: TextStyle(fontSize:23),),
              ),
              
              SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    for(int i=0;i<colors.length;i++)
                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: ColorWidget(color: colors[i], onSelected: updatesSelectedColor, answer: color),
                      )
                  ],
                ),
              ),
            ]
          ),
        ),
      ),
    );
  }

  selection(String slt) {
    if (slt == "Analog") {
      return AnClock(size: size, color: color, current: currentTime,);
    } else if (slt == "Digital") {
      return DiClock(color: color, current: currentTime,);
    } else {
      return Text(
        currentTime.toString().substring(10, 19),
        style: TextStyle(
            fontSize: 50, color: color, textBaseline: TextBaseline.alphabetic),
        textAlign: TextAlign.center,
      );
    }
  }
}
