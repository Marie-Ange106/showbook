import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:showbook/home/data/models/profil_model.dart';

import '../../../shared/utils/app_colors.dart';

@RoutePage()
class Coming extends StatelessWidget {
  final ProfilModel profilModel;
  const Coming({
    super.key,
    required this.profilModel,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const [
        Padding(
          padding: EdgeInsets.only(top: 20),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Date',
                    style: TextStyle(fontSize: 14, color: AppColors.primary),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
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
                height: 0.25,
                color: Color.fromARGB(71, 112, 112, 112),
              )
            ],
          ),
        )
      ],
    );
  }
}
