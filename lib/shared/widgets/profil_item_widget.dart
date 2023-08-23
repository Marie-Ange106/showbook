
import 'package:flutter/material.dart';

import '../utils/app_colors.dart';
import 'button_widget.dart';

class ProfilWidget extends StatelessWidget {
  const ProfilWidget({
    super.key,
    required this.imagePath,
    required this.typeProfil,
    required this.profilName,
    required this.follower,
  });

  final String imagePath;
  final String typeProfil;
  final String profilName;
  final String follower;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Row(
        children: [
          Container(
            height: 100,
            width: 100,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              // color: Colors.amber,
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: Image.network(
                imagePath,
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 130,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Type',
                        style: TextStyle(
                          fontSize: 14,
                          color: AppColors.primary,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                      Column(
                        children: [
                          Text(
                           profilName,
                            softWrap: true,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                        ],
                      ),
                      Text(
                        follower.toString(),
                        style: const TextStyle(
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
                 const Row(
                  children: [
                    ButtonWidget(
                      borderColor: AppColors.primary,
                      bgColor: AppColors.primary,
                      text: 'Follow',
                      textColor: AppColors.white,
                      height: 34,
                      width: 115,
                      fontSize: 14,
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
