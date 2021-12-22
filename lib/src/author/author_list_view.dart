import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../settings/settings_view.dart';
import 'author.dart';
import 'author_details_view.dart';

/// Displays a list of Authors.
class AuthorListView extends StatelessWidget {
  AuthorListView({
    Key? key,
  }) : super(key: key);

  static const routeName = '/';

  late List<Author> authors;

  @override
  Widget build(BuildContext context) {
    authors = [
      Author(1, AppLocalizations.of(context)!.aratus),
      Author(2, AppLocalizations.of(context)!.asclepiodotusTacticus),
      Author(3, AppLocalizations.of(context)!.attalus),
      Author(4, AppLocalizations.of(context)!.marcusAurelius),
      Author(5, AppLocalizations.of(context)!.chrysippus),
      Author(6, AppLocalizations.of(context)!.cleanthes),
      Author(7, AppLocalizations.of(context)!.ariusDidymus),
      Author(8, AppLocalizations.of(context)!.epictetus),
      Author(9, AppLocalizations.of(context)!.hierocles),
      Author(10, AppLocalizations.of(context)!.panaetius),
      Author(11, AppLocalizations.of(context)!.posidonius),
      Author(12, AppLocalizations.of(context)!.musoniusRufus),
      Author(13, AppLocalizations.of(context)!.seneca),
      Author(14, AppLocalizations.of(context)!.zeno),
      Author(15, AppLocalizations.of(context)!.zenodotus),
    ];
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.appTitle),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              // Navigate to the settings page. If the user leaves and returns
              // to the app after it has been killed while running in the
              // background, the navigation stack is restored.
              Navigator.restorablePushNamed(context, SettingsView.routeName);
            },
          ),
        ],
      ),

      // To work with lists that may contain a large number of items, it’s best
      // to use the ListView.builder constructor.
      //
      // In contrast to the default ListView constructor, which requires
      // building all Widgets up front, the ListView.builder constructor lazily
      // builds Widgets as they’re scrolled into view.
      body: ListView.builder(
        // Providing a restorationId allows the ListView to restore the
        // scroll position when a user leaves and returns to the app after it
        // has been killed while running in the background.
        restorationId: 'authorListView',
        itemCount: authors.length,
        itemBuilder: (BuildContext context, int index) {
          final author = authors[index];

          return ListTile(
              title: Text(author.name),
              leading: const CircleAvatar(
                // Display the Flutter Logo image asset.
                foregroundImage: AssetImage('assets/images/flutter_logo.png'),
              ),
              onTap: () {
                // Navigate to the details page. If the user leaves and returns to
                // the app after it has been killed while running in the
                // background, the navigation stack is restored.
                Navigator.restorablePushNamed(
                  context,
                  AuthorDetailsView.routeName,
                  arguments: author.toMap(),
                );
              });
        },
      ),
    );
  }
}
