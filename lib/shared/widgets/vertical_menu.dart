import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:showbook/shared/routes/routes.gr.dart';
import 'package:showbook/shared/utils/app_colors.dart';
import 'package:showbook/shared/widgets/button_widget.dart';

import 'header_menu_widget.dart';

@RoutePage()
class VerticalMenuScreen extends StatelessWidget {
  const VerticalMenuScreen({super.key});

  Future<void> _showLoginDialog(BuildContext context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible:
          false, // empêche l'utilisateur de fermer la boîte de dialogue en cliquant à l'extérieur
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Log in'),
          content: const SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('You must login to add an event.'),
              ],
            ),
          ),
          actions: [
            ElevatedButton(
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            ElevatedButton(
              child: const Text(
                'Login',
                style: TextStyle(
                  color: AppColors.primary,
                ),
              ),
              onPressed: () {
                context.router.push(const LoginRoute());
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(children: [
        Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Image.asset(
            'assets/images/logo-showbook.png',
            height: 50,
            width: 50,
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(top: 8.0),
          child: Divider(),
        ),
        HeaderMenuWidget(),
        Padding(
          padding: const EdgeInsets.only(left: 20, right: 15),
          child: Column(
            children: [
              ListTile(
                iconColor: AppColors.secondary,
                textColor: AppColors.secondary,
                selectedTileColor: AppColors.primary,
                leading: const Icon(
                  Icons.info,
                ),
                title: const Text(
                  'About us',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              const SizedBox(
                height: 15,
              ),
              ListTile(
                iconColor: AppColors.secondary,
                textColor: AppColors.secondary,
                selectedTileColor: AppColors.primary,
                leading: const Icon(
                  Icons.article,
                ),
                title: const Text(
                  'Blogs',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              const SizedBox(
                height: 15,
              ),
              ListTile(
                iconColor: AppColors.secondary,
                textColor: AppColors.secondary,
                selectedTileColor: AppColors.primary,
                leading: const Icon(
                  Icons.contact_page,
                ),
                title: const Text(
                  'Contact',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              const SizedBox(
                height: 15,
              ),
              const ListTile(
                iconColor: AppColors.secondary,
                textColor: AppColors.secondary,
                selectedTileColor: AppColors.primary,
                title: Text(
                  'Dark Mode',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                trailing: Icon(Icons.dark_mode_sharp),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 100,
        ),
        Center(
          child: GestureDetector(
            onTap: () {
              Navigator.pop(context); // ferme le drawer
              _showLoginDialog(
                  context); // affiche la boîte de dialogue de connexion
            },
            child: const Stack(
              alignment: Alignment.centerLeft,
              children: [
                ButtonWidget(
                  text: 'Add event',
                  borderColor: Color.fromARGB(255, 251, 222, 222),
                  bgColor: Color.fromARGB(255, 251, 222, 222),
                  height: 50,
                  width: 235,
                  fontSize: 20,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 30),
                  child: Icon(
                    Icons.add,
                  ),
                ),
              ],
            ),
          ),
        ),
      ]),
    );
  }
}

