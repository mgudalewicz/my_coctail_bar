import 'package:flutter/material.dart';

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
                  Text('Przepisy'),
                ],
              ),
      ),
      body: Builder(builder: (context) {
        if (currentIndex == 0) {
          return const Text('Pierwsza strona');
        }
        return const Text('Druga strona');
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
            label: 'Przepisy',
          ),
        ],
      ),
    );
  }
}
