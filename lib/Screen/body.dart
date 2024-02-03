import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_yoyo/widgets/suggestion_list.dart';
import '../utils/ddatabase.dart';
import '../widgets/bottomnavigation.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Color.fromARGB(255, 11, 56, 13,),
       // backgroundColor: appBgColor,
        toolbarHeight: 80.0,
        title: Row(
          children: [
            Text(
              "Welcome to My_Yoyo",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
      backgroundColor: Color.fromARGB(255, 197, 216, 197,),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            children: [
              SuggestionList(
                  "Recommendation for you", Hotel.recommendation),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const MyBottomNavigationBar(),
    );
  }
}
