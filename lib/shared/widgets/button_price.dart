import 'package:flutter/material.dart';

import '../utils/app_colors.dart';

class ButtonPriceWidget extends StatelessWidget {
  final String price;
  const ButtonPriceWidget({
    super.key,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 24,
      width: 54,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: AppColors.primaryClair,
      ),
      child: Center(
        child: Text(
          price,
          style: const TextStyle(color: AppColors.primary, fontSize: 12),
        ),
      ),
    );
  }
}
