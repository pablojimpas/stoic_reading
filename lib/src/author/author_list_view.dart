import 'package:flutter/material.dart';

import '../settings/settings_view.dart';
import 'author.dart';
import 'author_details_view.dart';

/// Displays a list of Authors.
class AuthorListView extends StatelessWidget {
  const AuthorListView({
    Key? key,
    this.authors = const [
      Author(1, "Marcus Aurelius"),
      Author(2, "Seneca"),
      Author(3, "Epictetus")
    ],
  }) : super(key: key);

  static const routeName = '/';

  final List<Author> authors;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Stoic Reading'),
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
