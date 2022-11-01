import 'package:flutter/material.dart';
import '../components/app_colors.dart';

class CustomRoundedIcon extends StatelessWidget {
  const CustomRoundedIcon({
    super.key,
    required this.icon,
    required this.onPressed,
  });

  final IconData icon;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      constraints: const BoxConstraints.tightFor(width: 50, height: 50),
      fillColor: AppColors.activeCardColor,
      shape: const CircleBorder(),
      onPressed: () {
        onPressed();
      },
      child: Icon(
        icon,
        color: Colors.white,
      ),
    );
  }
}
