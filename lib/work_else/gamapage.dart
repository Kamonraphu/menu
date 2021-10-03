import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'game.dart';

class GamePage extends StatefulWidget {
  const GamePage({Key? key}) : super(key: key);

  @override
  _GamePage createState() => _GamePage();
}

class _GamePage extends State<GamePage> {
  late Game _game;
  final _controller = TextEditingController();
  List<int> nok = [];
  bool whowin = false;
  String? _guessNumber;
  String? _feedback;

  @override
  void initState() {
    super.initState();
    _game = Game();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _showMaterialDialog(String title, String coo) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(coo),
          actions: [
            // ปุ่ม OK ใน dialog
            TextButton(
              child: const Text(
                'OK',
                style: TextStyle(fontSize: 20.0),
              ),
              onPressed: () {
                // ปิด dialog
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('GUESS THE NUMBER'),
        backgroundColor: Colors.blue,
      ),
      body: Container(
        color: Colors.orange.shade50,
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildHeader(),
                _buildMainContent(),
                _buildInputPanel(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Column(
      children: [
        Image.asset(
          'assets/images/logo_number.png',
          width: 240.0,
        ),
        Text(
          'GUESS THE NUMBER',
          style: GoogleFonts.kanit(fontSize: 22.0, color: Colors.blue),
        ),
      ],
    );
  }

  Widget _buildMainContent() {
    return _guessNumber == null
        ? Text(
            "I'm thinking of a number\n between 1 and 100.\n\n  Can You Guess it?",
            style: TextStyle(fontSize: 18),
          )
        : Column(
            children: [
              Text(
                _guessNumber!,
                style: TextStyle(fontSize: 50),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  whowin
                      ? Icon(
                          Icons.done,
                          color: Colors.green,
                          size: 40.0,
                        )
                      : Icon(
                          Icons.error_outline,
                          color: Colors.green,
                          size: 40.0,
                        ),
                  Text(
                    _feedback!,
                    style: TextStyle(fontSize: 20),
                  ),
                ],
              ),
              whowin
                  ? OutlinedButton(
                      onPressed: () {
                        setState(() {
                          _game = Game();

                          whowin = false;
                          _guessNumber = null;
                          nok.clear();
                        });
                      },
                      child: Text(
                        'NEW GAME',
                        style: TextStyle(fontSize: 30.0),
                      ),
                    )
                  : SizedBox.shrink(),
            ],
          );
  }

  Widget _buildInputPanel() {
    return Row(
      children: [
        Expanded(
          child: TextField(
            controller: _controller,
            keyboardType: TextInputType.number,
            style: const TextStyle(
              color: Colors.deepOrangeAccent,
              fontSize: 30.0,
              fontWeight: FontWeight.bold,
            ),
            cursorColor: Colors.yellow,
            textAlign: TextAlign.center,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.all(9.0),
              isDense: true,
              // กำหนดลักษณะเส้น border ของ TextField ในสถานะปกติ
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.deepOrangeAccent.withOpacity(0.4),
                ),
              ),
              // กำหนดลักษณะเส้น border ของ TextField เมื่อได้รับโฟกัส
              focusedBorder: const UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.black),
              ),
              hintText: 'Enter the number here',
              hintStyle: TextStyle(
                color: Colors.black.withOpacity(0.5),
                fontSize: 16.0,
              ),
            ),
          ),
        ),
        TextButton(
          onPressed: () {
            setState(() {
              _guessNumber = _controller.text;

              int? guess = int.tryParse(_guessNumber!);

              if (guess != null) {
                var result = _game.doGuess(guess);

                nok.add(guess);

                if (result == 0) {
                  //ถูก
                  whowin = true;
                  String name = '';
                  for (int i = 0; i < nok.length - 1; i++) {
                    name = name + nok[i].toString() + ' -> ';
                  }
                  int count = nok.length;
                  name = name + nok[nok.length - 1].toString();

                  _showMaterialDialog('GOOD JOB!',
                      'The Answer is $guess\nYou have made $count guesses\n$name');
                  _feedback = 'CORRECT!';
                } else if (result == 1) {
                  //มากไป
                  whowin = false;
                  _feedback = 'TOO HIGH!';
                } else {
                  //น้อยไป
                  whowin = false;
                  _feedback = 'TOO LOW!';
                }

                _controller.clear();
              } else {
                _guessNumber = null;
                _showMaterialDialog('Error', 'Please enter the number.');
              }
            });
          },
          child: Text(
            'GUESS',
            style: TextStyle(fontSize: 20.0, color: Colors.deepOrange),
          ),
        )
      ],
    );
  }
}
