import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plutocart/src/blocs/wallet_bloc/bloc/wallet_bloc.dart';

import './pill_gesture.dart';

class SlideDialog extends StatefulWidget {
  final Widget child;
  final Color backgroundColor;
  final Color pillColor;
  final double hightCard;

  SlideDialog({
    required this.child,
    required this.pillColor,
    required this.backgroundColor,
    required this.hightCard,
  });

  @override
  _SlideDialogState createState() => _SlideDialogState();
}


class _SlideDialogState extends State<SlideDialog> {
  var _initialPosition = 0.0;
  var _currentPosition = 0.0;

  @override
  Widget build(BuildContext context) {
    final deviceWidth = MediaQuery.of(context).size.width;
    final deviceHeight = MediaQuery.of(context).size.height;

    return BlocBuilder<WalletBloc, WalletState>(
      builder: (context, state) {
       double height =  MediaQuery.of(context).viewInsets.bottom > 0 ? 8.0  : widget.hightCard;
        return AnimatedPadding(
          padding: MediaQuery.of(context).viewInsets +
              EdgeInsets.only(top: deviceHeight / height + _currentPosition),
          duration: Duration(milliseconds: 70),
          curve: Curves.decelerate,
          child: MediaQuery.removeViewInsets(
            removeLeft: true,
            removeTop: true,
            removeRight: true,
            removeBottom: true,
            context: context,
            child: Center(
              child: Container(
                width: deviceWidth,
                height: deviceHeight / 1.5,
                child: Material(
                  color: widget.backgroundColor,
                  elevation: 24.0,
                  type: MaterialType.card,
                  child: SingleChildScrollView(
                    child: Column(
                      children: <Widget>[
                        PillGesture(
                          pillColor: widget.pillColor,
                          onVerticalDragStart: _onVerticalDragStart,
                          onVerticalDragEnd: _onVerticalDragEnd,
                          onVerticalDragUpdate: _onVerticalDragUpdate,
                        ),
                        widget.child,
                      ],
                    ),
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20.0),
                      topRight: Radius.circular(20.0),
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  void _onVerticalDragStart(DragStartDetails drag) {
    setState(() {
      _initialPosition = drag.globalPosition.dy;
    });
  }

  void _onVerticalDragUpdate(DragUpdateDetails drag) {
    setState(() {
      final temp = _currentPosition;
      _currentPosition = drag.globalPosition.dy - _initialPosition;
      if (_currentPosition < 0) {
        _currentPosition = temp;
      }
    });
  }

  void _onVerticalDragEnd(DragEndDetails drag) {
    if (_currentPosition > 100.0) {
      Navigator.pop(context);
      return;
    }
    setState(() {
      _currentPosition = 0.0;
    });
  }
}
