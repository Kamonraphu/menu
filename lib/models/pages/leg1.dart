import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
class leg1 extends StatefulWidget {
  const leg1({Key? key}) : super(key: key);

  @override
  _leg1State createState() => _leg1State();
}

class _leg1State extends State<leg1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ข้าวขาหมู'),
        backgroundColor: Colors.purple,
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [

            Image.asset('assets/images/leg.jpg'),
            SizedBox(
              width: 30.0,
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    //mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text('ชื่อเมณู: ข้าวขาหมู',
                        style: GoogleFonts.sarabun(fontSize: 20.0),),
                      Text('ราคา: 25 บาท',style: TextStyle(fontSize: 20.0)),
                    ],
                  ),
                ],
              ),
            ),
            
          ],
        ),
      ),
    );
  }
}
