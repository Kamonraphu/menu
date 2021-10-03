import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class front extends StatefulWidget {
  const front({Key? key}) : super(key: key);

  @override
  _frontState createState() => _frontState();
}

class _frontState extends State<front> {
  int count = 0;
  _Sarabun() {
    setState(() {
      count = 1;
    });
  }

  _Prompt() {
    setState(() {
      count = 2;
    });
  }

  _kanit() {
    setState(() {
      count = 3;
    });
  }

  _Itim() {
    setState(() {
      count = 4;
    });
  }

  _sriracha() {
    setState(() {
      count = 5;
    });
  }

  _pattaya() {
    setState(() {
      count = 6;
    });
  }

  _kodchasan() {
    setState(() {
      count = 7;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('THAI FONT VIEWER'),
        backgroundColor: Colors.green,
      ),
      body: Container(
        color: Color(0xFFA7FFEB),
        child: Column(
          children: [
            Expanded(
                flex: 6,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if (count == 1)
                      Text(
                        'Kamonraphu Yenjit',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.sarabun(fontSize: 80.0),
                      ),
                    if (count == 2)
                      Text(
                        'Kamonraphu Yenjit',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.prompt(fontSize: 80.0),
                      ),
                    if (count == 3)
                      Text(
                        'Kamonraphu Yenjit',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.kanit(fontSize: 80.0),
                      ),
                    if (count == 4)
                      Text(
                        'Kamonraphu Yenjit',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.itim(fontSize: 80.0),
                      ),
                    if (count == 5)
                      Text(
                        'Kamonraphu Yenjit',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.sriracha(fontSize: 80.0),
                      ),
                    if (count == 6)
                      Text(
                        'Kamonraphu Yenjit',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.pattaya(fontSize: 80.0),
                      ),
                    if (count == 7)
                      Text(
                        'Kamonraphu Yenjit',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.kodchasan(fontSize: 80.0),
                      )
                  ],
                )),
            Expanded(
                flex: 3,
                child: Column(
                  children: [
                    if(count==1)
                      Text(
                        'Font: Sarabun',
                        style: GoogleFonts.sarabun(fontSize: 20.0),
                      ),
                    if(count==2)
                      Text(
                        'Font: Prompt',
                        style: GoogleFonts.sarabun(fontSize: 20.0),
                      ),
                    if(count==3)
                      Text(
                        'Font: Kanit',
                        style: GoogleFonts.sarabun(fontSize: 20.0),
                      ),
                    if(count==4)
                      Text(
                        'Font: Itim',
                        style: GoogleFonts.sarabun(fontSize: 20.0),
                      ),
                    if(count==5)
                      Text(
                        'Font: Sriracha',
                        style: GoogleFonts.sarabun(fontSize: 20.0),
                      ),
                    if(count==6)
                      Text(
                        'Font: Pattaya',
                        style: GoogleFonts.sarabun(fontSize: 20.0),
                      ),
                    if(count==7)
                      Text(
                        'Font: Kodchasan',
                        style: GoogleFonts.sarabun(fontSize: 20.0),
                      ),

                    Padding(
                      padding: const EdgeInsets.only(left: 30.0,right: 30.0),
                      child: Container(
                        color: Colors.white,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(3.0),
                              child:
                                  Wrap(alignment: WrapAlignment.center, children: [
                                Padding(
                                  padding: const EdgeInsets.all(3.0),
                                  child: ElevatedButton(
                                    onPressed: _Sarabun,
                                    child: Text('Sarabun'),
                                    style: ElevatedButton.styleFrom(
                                      primary: Colors.green,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(3.0),
                                  child: ElevatedButton(
                                      onPressed: _Prompt, child: Text('Prompt'),
                                    style: ElevatedButton.styleFrom(
                                      primary: Colors.green,
                                    ),),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(3.0),
                                  child: ElevatedButton(
                                      onPressed: _kanit, child: Text('Kanit'),
                                    style: ElevatedButton.styleFrom(
                                      primary: Colors.green,
                                    ),),
                                ),
                              ]),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 30.0,right: 30.0),
                      child: Container(
                        color: Colors.white,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(3.0),
                              child:
                                  Wrap(alignment: WrapAlignment.center, children: [
                                Padding(
                                  padding: const EdgeInsets.all(3.0),
                                  child: ElevatedButton(
                                      onPressed: _Itim, child: Text('Itim'),
                                    style: ElevatedButton.styleFrom(
                                      primary: Colors.green,
                                    ),),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(3.0),
                                  child: ElevatedButton(
                                      onPressed: _sriracha,
                                      child: Text('Sriracha'),
                                    style: ElevatedButton.styleFrom(
                                      primary: Colors.green,
                                    ),),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(3.0),
                                  child: ElevatedButton(
                                      onPressed: _pattaya, child: Text('Pattaya'),
                                    style: ElevatedButton.styleFrom(
                                      primary: Colors.green,
                                    ),),
                                ),
                              ]),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 30.0,right: 30.0),
                      child: Container(
                        color: Colors.white,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(3.0),
                              child:
                                  Wrap(alignment: WrapAlignment.center, children: [
                                Padding(
                                  padding: const EdgeInsets.all(3.0),
                                  child: ElevatedButton(
                                      onPressed: _kodchasan,
                                      child: Text('Kodchasan'),
                                    style: ElevatedButton.styleFrom(
                                      primary: Colors.green,
                                    ),),
                                ),
                              ]),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
