
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';

class BottomNavigatorBar extends StatelessWidget {
  const BottomNavigatorBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StyleProvider(
      style: Style(),
      child: ConvexAppBar(
        initialActiveIndex: 1,
        height: 60,
        top: -10,
        curveSize: 70,
        style: TabStyle.react,
        activeColor: Color(0XFF15616D),
        items: [
          TabItem(icon: Icons.home  , title: 'Home'),
          TabItem(icon: ImageIcon(AssetImage('assets/icon/transaction_icon.png') , color: Color(0XFF15616D)) , title: 'Transactions'),
          TabItem(icon: ImageIcon(AssetImage('assets/icon/graph_icon.png') , color: Color(0XFF15616D)) ,title: 'Graphs'),
          TabItem(icon: ImageIcon(AssetImage('assets/icon/goal_icon.png') , color: Color(0XFF15616D)), title: 'Goals'),
          TabItem(icon: ImageIcon(AssetImage('assets/icon/debt_icon.png') , color: Color(0XFF15616D)), title: 'Debts'),
        ],
        backgroundColor: Color(0XFFFFFF),
        color: Color(0XFF15616D),
      ),
    );
  }
}

class Style extends StyleHook {
  @override
  double get activeIconSize => 40;

  @override
  double get activeIconMargin => 10;

  @override
  double get iconSize => 24;
  @override
  TextStyle textStyle(Color color, String? fontFamily) {
    return TextStyle(fontSize: 12, color: Color(0XFF707070));
  }
}
