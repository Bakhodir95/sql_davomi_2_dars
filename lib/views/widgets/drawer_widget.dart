import 'package:flutter/material.dart';
import 'package:sql_davomi_2_dars/views/screens/admin_screen.dart';
import 'package:sql_davomi_2_dars/views/screens/notes_screen.dart';
import 'package:sql_davomi_2_dars/views/screens/profile_screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          DrawerHeader(
            curve: Curves.bounceInOut,
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Row(
              children: [
                Text(
                  AppLocalizations.of(context)!.menyu,
                  style: TextStyle(fontSize: 50),
                ),
              ],
            ),
          ),
          ListTile(
            tileColor: Colors.amber,
            // splashColor: Colors.red,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const AdminScreen()),
              );
            },
            title: Text(
              AppLocalizations.of(context)!.adminPanel,
            ),
            trailing: const Icon(Icons.arrow_forward_ios_rounded),
          ),
          const SizedBox(
            height: 10,
          ),
          ListTile(
            tileColor: Colors.amber,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const NotesScreen()),
              );
            },
            title: Text(
              AppLocalizations.of(context)!.settings,
            ),
            trailing: const Icon(Icons.arrow_forward_ios_rounded),
          ),
          const SizedBox(
            height: 10,
          ),
          ListTile(
            tileColor: Colors.amber,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ProfileScreen()),
              );
            },
            title: Text(
              AppLocalizations.of(context)!.profile,
            ),
            trailing: const Icon(Icons.arrow_forward_ios_rounded),
          )
        ],
      ),
    );
  }
}
