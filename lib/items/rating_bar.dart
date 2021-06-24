import 'package:flutter/material.dart';

class RatingBar extends StatelessWidget {
  final int starCount;
  final double rating;
  final Color color;

  RatingBar(
      {this.starCount = 5, this.rating = 0.0, this.color = Colors.black87});

  Widget starBuilder(BuildContext context, int index) {
    IconData iconName = Icons.star;
    Color iconColor = color;
    if (index >= rating) {
      iconName = Icons.star_border;
    } else if (index > rating - 1 && index < rating) {
      iconName = Icons.star_half;
    }

    return Icon(
      iconName,
      size: 16,
      color: iconColor,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(starCount, (i) => starBuilder(context, i)),
    );
  }
}
