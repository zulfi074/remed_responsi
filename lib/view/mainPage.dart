import 'package:flutter/material.dart';
import 'package:rev_responsi/view/ListAgentPage.dart';
import 'package:rev_responsi/view/MapPage.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Menu'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                agent(context);
              },
              child: Text('Agent'),
            ),
            SizedBox(height: 20), // Jarak antara kedua tombol
            ElevatedButton(
              onPressed: () {
                map(context);
              },
              child: Text('Map'),
            ),
          ],
        ),
      ),
    );
  }

  void agent(BuildContext context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => ListPage()),
    );
  }

  void map(BuildContext context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => MapPage()),
    );
  }
}
