import 'package:flutter/material.dart';

class PopupMenu extends StatelessWidget {
  const PopupMenu({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
        const PopupMenuItem<String>(
          value: 'partager',
          child: Row(
            children: [
              Icon(Icons.share),
              SizedBox(
                width: 10,
              ),
              Text('Partager'),
            ],
          ),
        ),
        const PopupMenuItem<String>(
          value: 'Booker',
          child: Row(
            children: [
              Icon(Icons.contact_phone),
              SizedBox(
                width: 10,
              ),
              Text('Contacter'),
            ],
          ),
        ),
      ],
      onSelected: (String value) {
        // Faire quelque chose lorsque l'un des éléments est sélectionné
      },
      icon: Icon(Icons.more_vert),
    );
  }
}
