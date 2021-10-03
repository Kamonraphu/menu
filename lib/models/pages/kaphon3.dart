import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
class kaphon extends StatefulWidget {
  const kaphon({Key? key}) : super(key: key);

  @override
  _kaphonState createState() => _kaphonState();
}

class _kaphonState extends State<kaphon> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ข้าวกระเพรา'),
        backgroundColor: Colors.purple,
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [

            Image.asset('assets/images/kahph.jpg'),
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
                      Text('ชื่อเมณู: ข้าวกระเพรา',
                        style: GoogleFonts.sarabun(fontSize: 20.0),),
                      Text('ราคา: 40 บาท',style: TextStyle(fontSize: 20.0)),
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
