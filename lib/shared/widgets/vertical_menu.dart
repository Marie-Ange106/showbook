import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class VerticalMenuScreen extends StatelessWidget {
  const VerticalMenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(children: [
        const DrawerHeader(
          child: Text('Menu'),
          decoration: BoxDecoration(
            color: Colors.blue,
          ),
        ),
        ListTile(
          title: Text('Page 1'),
          onTap: () {
            // Naviguer vers la page 1
            Navigator.pop(context);
          },
        ),
        ListTile(
          title: Text('Page 2'),
          onTap: () {
            // Naviguer vers la page 2
            Navigator.pop(context);
          },
        ),
        ListTile(
          title: Text('Page 3'),
          onTap: () {
            // Naviguer vers la page 3
            Navigator.pop(context);
          },
        ),
      ]),
    );
  }
}
