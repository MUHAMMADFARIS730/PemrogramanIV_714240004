import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Page"),
        backgroundColor: Colors.lightBlue,
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            ListTile(title: Text('Homepage')),
            ListTile(title: Text('Settings')),
          ],
        ),
      ),
      body: MyContainer(),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
      ),
    );
  }
}

class MyContainer extends StatelessWidget {
  const MyContainer({super.key});
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // 1. MainAxisAlignment.spaceEvenly
        const Text('MainAxisAlignment.spaceEvenly'),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: const [
            Icon(Icons.share),
            Icon(Icons.thumb_up),
            Icon(Icons.thumb_down),
          ],
        ),
        const SizedBox(height: 20),

        // 2. MainAxisAlignment.spaceAround
        const Text('MainAxisAlignment.spaceAround'),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: const [
            Icon(Icons.share),
            Icon(Icons.thumb_up),
            Icon(Icons.thumb_down),
          ],
        ),
        const SizedBox(height: 20),

        // 3. MainAxisAlignment.spaceBetween
        const Text('MainAxisAlignment.spaceBetween'),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            Icon(Icons.share),
            Icon(Icons.thumb_up),
            Icon(Icons.thumb_down),
          ],
        ),
        const SizedBox(height: 20),

        // 4. MainAxisAlignment.start
        const Text('MainAxisAlignment.start'),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: const [
            Icon(Icons.share),
            Icon(Icons.thumb_up),
            Icon(Icons.thumb_down),
          ],
        ),
        const SizedBox(height: 20),

        // 5. MainAxisAlignment.center
        const Text('MainAxisAlignment.center'),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(Icons.share),
            Icon(Icons.thumb_up),
            Icon(Icons.thumb_down),
          ],
        ),
        const SizedBox(height: 20),

        // 6. MainAxisAlignment.end
        const Text('MainAxisAlignment.end'),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: const [
            Icon(Icons.share),
            Icon(Icons.thumb_up),
            Icon(Icons.thumb_down),
          ],
        ),
      ],
    );
  }
}
