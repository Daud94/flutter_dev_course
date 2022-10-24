import 'package:flutter/widgets.dart';

class ReusableCard extends StatelessWidget {
  final Color? colour;
  final Widget? cardChild;
  final Function? onPress;

  const ReusableCard({this.colour, this.cardChild, this.onPress, super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress!(),
      child: Container(
        margin: const EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: colour,
        ),
        child: cardChild,
      ),
    );
  }
}