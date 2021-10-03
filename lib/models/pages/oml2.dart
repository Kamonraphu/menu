import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
class oml2 extends StatefulWidget {
  const oml2({Key? key}) : super(key: key);

  @override
  _oml2State createState() => _oml2State();
}

class _oml2State extends State<oml2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ข้าวใข่เจียว'),
        backgroundColor: Colors.purple,
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [

            Image.asset('assets/images/oml.jpg'),
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
                      Text('ชื่อเมณู: ข้าวใข่เจียว',
                        style: GoogleFonts.sarabun(fontSize: 20.0),),
                      Text('ราคา: 30 บาท',style: TextStyle(fontSize: 20.0)),
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
