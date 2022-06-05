import 'package:bowling_app/scorecard.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;
  PageController pageController = PageController();

  void onTapped(int index) {
    setState(() {
      selectedIndex = index;
      pageController.animateToPage(
        index,
        duration: const Duration(milliseconds: 500),
        curve: Curves.decelerate,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GradientAppBarFb1(),
      body: PageView(
        controller: pageController,
        children: [
          BackgroundImageFb1(
            child: Container(
              padding: const EdgeInsets.only(top: 16.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.center,
                children: const <Widget>[
                  Text('Welcome',
                      style: TextStyle(
                          fontSize: 60.0,
                          fontFamily: 'CGPRO',
                          color: Color.fromARGB(255, 208, 34, 34))),
                ],
              ),
            ),
          ),
          const ScoreCard(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
          selectedIconTheme: const IconThemeData(color: Colors.blueGrey),
          selectedItemColor: Colors.blueGrey,
          selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home_sharp),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.add_sharp),
              label: 'New Game',
            ),
          ],
          currentIndex: selectedIndex,
          onTap: onTapped),
    );
  }
}

class BackgroundImageFb1 extends StatelessWidget {
  final Widget child;
  const BackgroundImageFb1({required this.child, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // Place as the child widget of a scaffold
      width: double.infinity,
      height: double.infinity,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/bowling_background.jpeg'),
          fit: BoxFit.cover,
        ),
      ),
      child: child,
    );
  }
}

class GradientAppBarFb1 extends StatelessWidget with PreferredSizeWidget {
  @override
  final Size preferredSize;

  GradientAppBarFb1({Key? key})
      : preferredSize = const Size.fromHeight(56.0),
        super(key: key);
  @override
  Widget build(BuildContext context) {
    const primaryColor = Color(0xff4338CA);
    const secondaryColor = Color(0xff6D28D9);
    const accentColor = Color(0xffffffff);
    const backgroundColor = Color(0xffffffff);
    const errorColor = Color(0xffEF4444);

    return AppBar(
      title:
          const Text("Bowling Scorer", style: TextStyle(color: Colors.white)),
      backgroundColor: primaryColor,
      flexibleSpace: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [primaryColor, secondaryColor],
            stops: [0.5, 1.0],
          ),
        ),
      ),
    );
  }
}
