import 'package:flutter/material.dart';

class Grocery_Item extends StatelessWidget {
  var item_name, item_price, item_image, background_color;

  var on_pressed;

  Grocery_Item({
    Key? key,
    required this.item_name,
    required this.item_price,
    required this.item_image,
    required this.background_color,
    required this.on_pressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(12.0),
      child: Container(
        padding: EdgeInsets.all(12.0),
        decoration: BoxDecoration(
          color: background_color[100],
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            //item image
            Image.asset(
              item_image,
              height: 64.0,
            ),

            //item name
            Text(
              "$item_name",
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),

            //item price + button
            TextButton(
              onPressed: on_pressed,
              style: TextButton.styleFrom(
                backgroundColor: background_color[800],
              ),
              child: Text(
                "\$ $item_price",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
