import 'package:flutter/material.dart';
import 'package:plutocart/src/pages/bottom_navigator_bar.dart';
import 'package:plutocart/src/pages/home/card_wallet.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Center(
          child: const Text(
            "Home",
            style: TextStyle(color: Color(0xFF15616D)),
          ),
        ),
      ),
      body: Container(
        child: Column(
          children: [
            CardWallet()
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigatorBar(),
    );
  }


}
