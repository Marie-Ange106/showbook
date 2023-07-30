import 'package:flutter/material.dart';

class HeaderFormWidget extends StatelessWidget {
  final String text;
  final String? subtitle;
  const HeaderFormWidget({
    required this.text,
    this.subtitle,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 30,
        ),
        Container(
          height: 150,
          width: 200,
          decoration: const BoxDecoration(
              image: DecorationImage(
            image: AssetImage("assets/images/logo-showbook.png"),
          )),
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              text,
              style: const TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 30,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
