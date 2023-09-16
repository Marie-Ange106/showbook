import 'package:flutter/material.dart';

import '../utils/app_colors.dart';

class ButtonLikeWidget extends StatefulWidget {
  const ButtonLikeWidget({
    super.key,
  });

  @override
  State<ButtonLikeWidget> createState() => _ButtonLikeWidgetState();
}

class _ButtonLikeWidgetState extends State<ButtonLikeWidget> {
  bool _isLiked = true;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
            height: 30,
            width: 30,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: const Color.fromARGB(255, 177, 177, 177),
            ),
            child: Center(
              child: IconButton(
                onPressed: () {
                  setState(() {
                    _isLiked = !_isLiked;
                  });
                },
                icon: _isLiked
                    ? const Icon(
                        Icons.favorite_border_outlined,
                        color: AppColors.secondary,
                        size: 16,
                      )
                    : const Icon(
                        Icons.favorite,
                        color: AppColors.primary,
                        size: 16,
                      ),
              ),
            )),
      ],
    );
  }
}
