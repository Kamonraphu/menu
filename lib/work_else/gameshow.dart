import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class game extends StatefulWidget {
  const game({Key? key}) : super(key: key);

  @override
  _gameState createState() => _gameState();
}

class _gameState extends State<game> {
  var score = 0;
  bool red = true;
  bool whowin = false;
  int teamred = 20;
  int teamblue = 20;
  _numred3() {
    setState(() {
      score += 3;
      if (score + 3 >= 20) {
        whowin = true;
      }
      red = !red;
    });
  }

  _numred2() {
    setState(() {
      score += 2;
      if (score + 2 >= 20) {
        whowin = true;
      }
      red = !red;
    });
  }

  _numred1() {
    setState(() {
      score += 1;
      if (score + 1 >= 20) {
        whowin = true;
      }
      red = !red;
    });
  }

  _numblue3() {
    setState(() {
      score += 3;
      if (score + 3 >= 20) {
        whowin = false;
      }
      red = !red;
    });
  }

  _numblue2() {
    setState(() {
      score += 2;
      if (score + 2 >= 20) {
        whowin = false;
      }
      red = !red;
    });
  }

  _numblue1() {
    setState(() {
      score += 1;

      if (score + 1 >= 20) {
        whowin = false;
      }
      red = !red;
    });
  }

  _newgame() {
    setState(() {
      score = 0;
      red = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          decoration: const BoxDecoration(
            image: const DecorationImage(
              image: const AssetImage("assets/images/bg.jpg"),
              fit: BoxFit
                  .fill, // ยืดเต็มพื้นที่โดยไม่สนใจสัดส่วนของภาพ หรือใช้ BoxFit.cover เพื่อยืดให้เต็มและคงสัดส่วนของภาพไว้ แต่บางส่วนของภาพอาจถูก crop
            ),
          ),
          child: SafeArea(
            // ไม่ให้ layout ไปอยู่ตรงส่วน status bar หรือ notch
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton(
                          onPressed: red && score < 20 ? _numred3 : null,
                          style: ElevatedButton.styleFrom(
                            primary: Colors.red,
                            
                          ),
                          child: Text(
                            '3',
                            style: TextStyle(fontSize: 40.0),
                          ),
                        ),
                        ElevatedButton(
                          onPressed: red && score < 20 ? _numred2 : null,
                          style: ElevatedButton.styleFrom(
                            primary: Colors.red,
                          ),
                          child: Text(
                            '2',
                            style: TextStyle(fontSize: 40.0),
                          ),
                        ),
                        ElevatedButton(
                          onPressed: red && score < 20 ? _numred1 : null,
                          style: ElevatedButton.styleFrom(
                            primary: Colors.red,
                          ),
                          child: Text(
                            '1',
                            style: TextStyle(fontSize: 40.0),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      if (score < 20)
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Column(
                            children: [
                              for (int i = 0; i < score; i++)
                                Icon(
                                  Icons.star,
                                  color: Colors.green,
                                ),
                              for (int i = score; i < 20; i++)
                                Icon(
                                  Icons.star_border,
                                  color: Colors.green,
                                )
                            ],
                          ),
                        ),
                      Expanded(
                          flex: 15,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              if (score < 20)
                                Icon(
                                  Icons.expand_less,
                                  size: 100,
                                ),
                              if (score < 20)
                                Text(
                                  '$score',
                                  style: TextStyle(fontSize: 80.0),
                                ),
                              if (score < 20)
                                Icon(
                                  Icons.expand_more,
                                  size: 100,
                                ),
                              if (score >= 20)
                                Text(
                                  whowin ? 'blue' : 'red',
                                  style: TextStyle(fontSize: 80.0),
                                ),
                              if (score >= 20)
                                OutlinedButton(
                                  onPressed: _newgame,
                                  child: Text(
                                    'NEW GAME',
                                    style: TextStyle(fontSize: 20.0),
                                  ),
                                )
                            ],
                          ))
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton(
                          onPressed: !red && score < 20 ? _numblue1 : null,
                          style: ElevatedButton.styleFrom(
                            primary: Colors.blue,
                          ),
                          child: Text(
                            '1',
                            style: TextStyle(fontSize: 40.0),
                          ),
                        ),
                        ElevatedButton(
                          onPressed: !red && score < 20 ? _numblue2 : null,
                          style: ElevatedButton.styleFrom(
                            primary: Colors.blue,
                          ),
                          child: Text(
                            '2',
                            style: TextStyle(fontSize: 40.0),
                          ),
                        ),
                        ElevatedButton(
                          onPressed: !red && score < 20 ? _numblue3 : null,
                          style: ElevatedButton.styleFrom(
                            primary: Colors.blue,
                          ),
                          child: Text(
                            '3',
                            style: TextStyle(fontSize: 40.0),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ), // Your widget tree
          )),
    );
  }
}
