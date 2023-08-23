import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:showbook/home/data/models/profil_model.dart';

import '../../../shared/utils/app_colors.dart';

@RoutePage()
class PastEventProfilScreen extends StatelessWidget {
  final ProfilModel profilModel;
  const PastEventProfilScreen({super.key, required this.profilModel,});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const [
        Column(
          children: [
            Row(
              children: [
                Text(
                  'date',
                  style: TextStyle(fontSize: 14, color: AppColors.primary),
                ),
                Column(
                  children: [
                    Text(
                      'event',
                      style: TextStyle(
                        fontSize: 14,
                      ),
                    ),
                    Text(
                      'location',
                      style: TextStyle(
                        fontSize: 12,
                      ),
                    ),
                  ],
                )
              ],
            ),
            Divider(
              height: 1,
              color: AppColors.tertiary,
            )
          ],
        )
      ],
    );
  }
}
