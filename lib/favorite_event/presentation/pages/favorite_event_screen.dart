import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:showbook/shared/utils/app_colors.dart';
import 'package:showbook/shared/widgets/vertical_menu.dart';

@RoutePage()
class FavoriteEVentScreen extends StatefulWidget {
  const FavoriteEVentScreen({super.key});

  @override
  State<FavoriteEVentScreen> createState() => _MyEventScreenState();
}

class _MyEventScreenState extends State<FavoriteEVentScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 2,
        backgroundColor: AppColors.white,
        title: const Text(
          'Favorite events',
          style: TextStyle(
            fontSize: 20,
          ),
        ),
      ),
      drawer: const VerticalMenuScreen(),
    );
  }
}
