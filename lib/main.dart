import 'package:flutter/material.dart';
import 'package:grocery_ui/models/cart_model.dart';
import 'package:grocery_ui/pages/intro_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    Main(),
  );
}

class Main extends StatelessWidget {
  Main({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) {
        return Cart_Model();
      },
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Intro_Page(),
      ),
    );
  }
}
