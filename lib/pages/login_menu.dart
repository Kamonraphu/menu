import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:randomscore/pages/profile.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  static const pin = '123456';
  var input = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            /*stops: [
              0.0,
              0.95,
              1.0,
            ],*/
            colors: [
              Colors.white,
              //Color(0xFFD8D8D8),
              //Color(0xFFAAAAAA),
              Theme.of(context).colorScheme.background.withOpacity(0.5),
              //Theme.of(context).colorScheme.background.withOpacity(0.6),
              //Colors.white,
            ],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.lock_outline,
                          size: 90.0,
                          color: Theme.of(context).textTheme.headline1?.color,
                        ),
                        Text(
                          'LOGIN',
                          style: Theme.of(context).textTheme.headline1,
                        ),
                        SizedBox(height: 6.0),
                        Text(
                          'Enter PIN to login',
                          style: Theme.of(context).textTheme.bodyText2,
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        for (var i = 0; i < input.length; i++)
                          Container(
                            margin: EdgeInsets.all(4.0),
                            width: 24.0,
                            height: 24.0,
                            decoration: BoxDecoration(
                                color: Theme.of(context).colorScheme.primary,
                                shape: BoxShape.circle),
                          ),
                        for (var i = input.length; i < 6; i++)
                          Container(
                            margin: EdgeInsets.all(4.0),
                            width: 24.0,
                            height: 24.0,
                            decoration: BoxDecoration(
                              color: Theme.of(context)
                                  .colorScheme
                                  .primary
                                  .withOpacity(0.2),
                              shape: BoxShape.circle,
                            ),
                          ),
                      ],
                    )
                  ],
                ),
              ),
              _buildNumPad(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNumPad() {
    return Container(
      padding: EdgeInsets.all(16.0),
      child: Column(
        children: [
          [1, 2, 3],
          [4, 5, 6],
          [7, 8, 9],
          [-2, 0, -1],
        ].map((row) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: row.map((item) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: LoginButton(
                  number: item,
                  onClick: () {
                    _handleClickButton(item);
                  },
                ),
              );
            }).toList(),
          );
        }).toList(),
      ),
    );
  }

  void _handleClickButton(int num) {
    print('You pressed $num');

    setState(() {
      if (num == -1) {
        if (input.length > 0) input = input.substring(0, input.length - 1);
      } else {
        input = '$input$num';
      }

      if (input.length == pin.length) {
        if (input == pin) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const HomePage()),
          );
        } else {
          _showMaterialDialog('ERROR', 'Invalid PIN. Please try again.');
        }

        input = '';
      }
    });
  }

  void _showMaterialDialog(String title, String msg) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(msg, style: Theme.of(context).textTheme.bodyText2),
          actions: [
            // ปุ่ม OK ใน dialog
            TextButton(
              child: const Text('OK'),
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
}

class LoginButton extends StatelessWidget {
  final int number;
  final Function() onClick;

  const LoginButton({
    required this.number,
    required this.onClick,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      customBorder: CircleBorder(),
      onTap: number == -2 ? null : onClick,
      child: Container(
        width: 75.0,
        height: 75.0,
        decoration: number == -2
            ? null
            : BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white.withOpacity(0.5),
                border: Border.all(
                  width: 3.0,
                  color: Theme.of(context).textTheme.headline1!.color!,
                ),
              ),
        child: Center(
          child: number >= 0
              ? Text(
                  '$number', // number.toString()
                  style: Theme.of(context).textTheme.headline6,
                )
              : (number == -1
                  ? Icon(
                      Icons.backspace_outlined,
                      size: 28.0,
                    )
                  : SizedBox.shrink()),
        ),
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  static const routeName = '/home';

  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var _subPageIndex = 1;
  var _selectedBottomNavIndex = 0;
  var title = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: title==1?Text('FOOD'):Text('PROFILE'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.purple,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(40.0),
                    child: Container(
                      width: 80.0,
                      height: 80.0,

                      child: Image.asset('assets/images/me.jpg', width: 51.0,),
                    ),
                  ),
                  Text(
                    'Kamonraphu Yenjit',
                    style: TextStyle(fontSize: 20.0, color: Colors.white),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: Text(
                      'Nok0623157331@hotmail.com',
                      style: TextStyle(fontSize: 15.0, color: Colors.white70),
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              title: _buildDrawerItem(
                  Icon(Icons.fastfood, color: Colors.purple), 'Food'),
              onTap: () => _showSubPage(1),
            ),
            ListTile(
              title: _buildDrawerItem(
                  Icon(
                    Icons.person,
                    color: Colors.purple,
                  ),
                  'Profile'),
              onTap: () => _showSubPage(2),
            ),
          ],
        ),
      ),
      bottomNavigationBar:
          _subPageIndex == 1 ? buildBottomNavigationBar() : SizedBox.shrink(),
      body: Container(child: _subPageIndex == 1? _buildSubPage(): picture()),
    );
  }


  BottomNavigationBar buildBottomNavigationBar() {
    return BottomNavigationBar(
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.menu_book),
          label: 'Menu',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.shopping_cart),
          label: 'Your Order',
        ),
      ],
      currentIndex: _selectedBottomNavIndex,
      onTap: (index) {
        setState(() {
          _selectedBottomNavIndex = index;
        });
      },
    );
  }

  _showSubPage(int index) {
    setState(() {
     if(index==1){
       title=1;
     }
     if(index==2){
       title=2;
     }
      _subPageIndex = index;
    });
    Navigator.of(context).pop();
  }

  Widget _buildSubPage() {
    switch (_subPageIndex) {
      // case 0: // home page
      // return Center(
      //   child: Text('THIS IS A HOME PAGE',
      //    style: Theme.of(context).textTheme.headline1),
      // );
      case 1:
        return Center(
          child: _selectedBottomNavIndex == 1 && _subPageIndex == 1
              ? Text('YOUR ORDER' ,style: TextStyle(fontSize: 30.0, ))
              : Text('FOOD MENU',style: TextStyle(fontSize: 30.0, )),
        );
      case 2:
        return Center(
          child: Text('Profile'),
        );
      //return _nani();

      default:
        return SizedBox.shrink();
    }
  }


  Column picture() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(40.0),
                  child: Container(
                    width: 80.0,
                    height: 80.0,

                    child: Image.asset('assets/images/me.jpg', width: 100.0,),
                  ),
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text('Kamonraphu Yenjit',style: TextStyle(fontSize: 30.0),),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text('Nok0623157331@hotmail.com',style: TextStyle(fontSize: 20.0),),
        ),


      ],

    );
  }

  Row _buildDrawerItem(Widget icon, String title) {
    return Row(
      children: [
        icon,
        SizedBox(width: 8.0),
        Text(
          title,
          style: TextStyle(color: Colors.purple, fontSize: 18.0),
        ),
      ],
    );
  }
}



