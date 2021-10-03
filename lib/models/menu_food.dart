import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:randomscore/models/fooddetil.dart';
import 'package:randomscore/models/pages/oml2.dart';
import 'package:randomscore/pages/order_food.dart';
import 'package:randomscore/models/pages/leg1.dart';

import 'Food_Item.dart';

class food extends StatefulWidget {
  static const routeName = '/food_list';
  const food({Key? key}) : super(key: key);

  @override
  _foodState createState() => _foodState();
}

class _foodState extends State<food> {
  var items = [
    FoodItem(id: 1, name: 'ข้าวขาหมู', price: 25, image: 'leg.jpg'),
    FoodItem(id: 2, name: 'ข้าวใข่เจียว', price: 30, image: 'oml.jpg'),
    FoodItem(id: 3, name: 'ข้าวกระเพรา', price: 40, image: 'kahph.jpg'),
    FoodItem(id: 4, name: 'ข้าวหมูกรอบ', price: 40, image: 'muo-gorp.jpg'),
    FoodItem(id: 5, name: 'ก๋วยเตี๋ยว', price: 35, image: 'noodle.jpg'),
    FoodItem(id: 6, name: 'เย็นตาโฟ', price: 35, image: 'yen-ta-flow.jpg'),
    FoodItem(id: 7, name: 'หอยทอด', price: 40, image: 'hoi-tord.jpg'),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
          itemCount: items.length,
          itemBuilder: (BuildContext context, int index) {
            var item = items[index];
            return Card(
                margin: const EdgeInsets.all(8.0),
                child: InkWell(
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      '/FoodDetails',
                      arguments: item,
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      children: [
                        Image.asset(
                          'assets/images/${item.image}',
                          width: 70.0,
                          height: 70.0,
                            fit: BoxFit.cover
                        ),
                        SizedBox(
                          width: 8.0,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 5.0),
                              child: Text(
                                item.name,
                                style: TextStyle(fontSize: 20.0),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 5.0),
                              child: Row(
                                children: [
                                  Text(
                                    item.price.toString(),
                                    style: TextStyle(fontSize: 20.0),
                                  ),
                                  Text(
                                    ' บาท',
                                    style: TextStyle(fontSize: 20.0),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ));
          }),
    );
  }
}
