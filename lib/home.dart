import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
    const HomeScreen({Key? key}) : super(key:key);

    @override
    _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
    int selectedIndex = 0;
    PageController pageController = PageController();

    void onTapped(int index) {
        setState(() {
            selectedIndex = index;
            pageController.animateToPage(index, duration: Duration(milliseconds: 500, curve: Curves.decelerate), );
        });
    }
    @override
    Widget build(BuildContext context) {
        return Scaffold (
            appbar: AppBar(title: Text('Bowling Scorer'),),
            body: PageView(
                controller: pageController,
                children: [
                    Container(color: Colors.red),
                    Container(color: Colors.blue),
                    Container(color: Colors.green),
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
                    BottomNavigationBarItem(
                        icon: Icon(Icons.scoreboard_sharp),
                        label: 'Scores',
                    ),
                ],
                currentIndex: selectedIndex,
                onTap: onTapped
            ),
        );
    }
}