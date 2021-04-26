import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  final String text;
  final double radious;
  final Function press;

  const RoundedButton({
    Key key,
    this.text,
    this.radious = 29,
    this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: press,
      child: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          color: Color(0xFF393939),
          borderRadius: BorderRadius.circular(radious),
        ),
        child: Text(
          text,
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
