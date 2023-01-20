import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'home_page.dart';

class Intro_Page extends StatelessWidget {
  Intro_Page({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            children: [
              //logo
              Padding(
                padding: EdgeInsets.only(
                  left: 80.0,
                  right: 80.0,
                  bottom: 40.0,
                  top: 160.0,
                ),
                child: Image.asset(
                  "lib/images/avocado.png",
                  scale: 2.0,
                ),
              ),

              //we deliver at your doorstep
              Padding(
                padding: EdgeInsets.all(25.0),
                child: Text(
                  "We deliver groceries at your doorstep",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.notoSerif(
                    fontWeight: FontWeight.bold,
                    fontSize: 36.0,
                  ),
                ),
              ),

              SizedBox(
                height: 24.0,
              ),

              //fresh items everyday
              Text(
                "Fresh items everyday",
                style: TextStyle(
                  color: Colors.grey.shade600,
                  fontWeight: FontWeight.bold,
                ),
              ),

              Spacer(),

              //get started button
              TextButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) {
                      return Home_Page();
                    }),
                  );
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.deepPurple,
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  padding: EdgeInsets.all(24.0),
                  child: Text(
                    "Get Started",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),

              Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
