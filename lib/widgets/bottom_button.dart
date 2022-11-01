import 'package:flutter/material.dart';

class BottomButton extends StatelessWidget {
  const BottomButton({
    super.key,
    required this.btnName,
    required this.onTap,
  });

  final String btnName;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap();
      },
      child: Container(
        color: Colors.pink,
        child: SizedBox.expand(
          child: Center(
            child: Text(
              btnName.toUpperCase(),
              style: const TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
