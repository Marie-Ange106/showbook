import 'package:flutter/material.dart';

import '../utils/app_colors.dart';
import '../widgets/button_widget.dart';

class SubscriptionScreen extends StatefulWidget {
  const SubscriptionScreen({super.key});

  @override
  State<SubscriptionScreen> createState() => _SubscriptionScreenState();
}

class _SubscriptionScreenState extends State<SubscriptionScreen> {
  String? category;
  String? date;
  String? location;
  int? price;

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: Padding(
      padding: EdgeInsets.only(left: 20, right: 20, top: 100),
      child: Card(
          color: AppColors.white,
          child: SizedBox(
            height: 300,
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Follow Profiles',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Get a news feed consisting of the events of the profils you like.',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  ButtonWidget(
                    text: 'See profiles',
                    textColor: AppColors.white,
                    bgColor: AppColors.primary,
                    borderColor: AppColors.primary,
                    height: 40,
                    width: 130,
                    fontSize: 16,
                  ),
                ],
              ),
            ),
          )),
    ));
  }
}
