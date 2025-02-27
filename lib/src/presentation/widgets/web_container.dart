import 'package:flutter/material.dart';

class WebContainer extends StatelessWidget {
  final Widget child;

  const WebContainer({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: EdgeInsets.all(20.0),
        height: double.infinity,
        width: 380.0,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            border: Border.all(color: Colors.black38)),
        child: child,
      ),
    );
  }
}
