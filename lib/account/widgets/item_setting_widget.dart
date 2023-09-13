import 'package:flutter/material.dart';

import '../../shared/utils/app_colors.dart';

class ItemSettingWidget extends StatelessWidget {
  final String name;
  final IconData icon;
  final double? width;
  const ItemSettingWidget({
    super.key,
    required this.name,
    required this.icon,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color.fromARGB(255, 255, 248, 248),
      child: SizedBox(
        height: 50,
        width: width,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                name,
                style: const TextStyle(
                  fontSize: 16,
                ),
              ),
              Icon(
                icon,
                color: AppColors.primary,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
