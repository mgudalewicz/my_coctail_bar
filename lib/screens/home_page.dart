import 'package:flutter/material.dart';
import 'package:my_coctail_bar/screens/add_coctail/add_coctail_page.dart';
import 'package:my_coctail_bar/screens/coctails_view/coctails_view_home/coctails_view_home_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: currentIndex == 0
            ? Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text('Dodawanie przepisu'),
                ],
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text('Koktajle'),
                ],
              ),
      ),
      body: Builder(builder: (context) {
        if (currentIndex == 0) {
          return const AddCoctail();
        }
        return const CoctailViewHomeScreen();
      }),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        unselectedItemColor: Colors.grey,
        selectedIconTheme: const IconThemeData(color: Colors.pink),
        fixedColor: Colors.pink,
        onTap: (newIndex) {
          setState(() {
            currentIndex = newIndex;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.add_comment),
            label: 'Dodawawanie przepisu',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.local_bar),
            label: 'Koktajle',
          ),
        ],
      ),
    );
  }
}
