import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'constants.dart';

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
          color: Colors.white,
        ),
        SizedBox(height: 15.0),
        Text(
          label,
          style: kLabelTextStyle,
        )
      ],
    );
  }
}