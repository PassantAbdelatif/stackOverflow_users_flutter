import 'package:flutter/material.dart';
import 'package:stackoverflow_users/src/styles/colors.dart';


class Separator extends StatelessWidget {
  const Separator({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 10,
        ),
        Container(
          height: 0.5,
          color: OkayColors.lightGrayBorderColor,
        ),
        const SizedBox(
          height: 10,
        ),
      ],
    );
  }
}
