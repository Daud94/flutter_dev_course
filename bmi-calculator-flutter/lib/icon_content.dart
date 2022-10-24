import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

const labelTextStyle = TextStyle(
    fontSize: 18.0,
    color: Colors.white
);

class IconContent extends StatelessWidget {
  final IconData icon;
  final String label;

  const IconContent({super.key, required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          icon,
          size: 90.0,
        ),
        SizedBox(height: 15.0),
        Text(
          label,
          style: labelTextStyle,
        )
      ],
    );
  }
}