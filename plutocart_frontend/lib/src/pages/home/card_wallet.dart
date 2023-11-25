import 'package:flutter/material.dart';

class CardWallet extends StatefulWidget {
  const CardWallet({Key? key}) : super(key: key);

  @override
  _CardWalletState createState() => _CardWalletState();
}

class _CardWalletState extends State<CardWallet> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        child: Column(children: [
          Container(
            width: 336,
            height: 162,
            decoration: ShapeDecoration(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                side: BorderSide(
                  width: 2,
                  strokeAlign: BorderSide.strokeAlignOutside,
                  color: Color(0xFF15616D),
                ),
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),
          SizedBox(
            height: 6,
          ),
          Container(
            width: 8,
            height: 8,
            decoration: ShapeDecoration(
              color: Color(0xFF15616D),
              shape: OvalBorder(),
            ),
          )
        ]),
      ),
    );
  }
}
