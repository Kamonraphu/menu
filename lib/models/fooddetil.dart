import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'Food_Item.dart';
class FoodDetails extends StatelessWidget {
  const FoodDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final args=ModalRoute.of(context)!.settings.arguments as FoodItem;
    return Scaffold(
      appBar: AppBar(
        title: Text(args.name),
        backgroundColor: Colors.purple,
      ),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FittedBox(
              child: Image.asset('assets/images/${args.image}'),
              fit: BoxFit.fill,
            ),
            SizedBox(height: 10.0),
            Row(
              children: [
                SizedBox(
                  width: 10.0,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'ชื่อเมนู: ${args.name}',
                      style: Theme.of(context).textTheme.bodyText2,
                    ),
                    Text(
                      'ราคา: ${args.price} บาท',
                      style: Theme.of(context).textTheme.bodyText2,
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
