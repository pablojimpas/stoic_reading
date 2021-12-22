import 'package:flutter/material.dart';
import 'package:stoic_reading/src/author/author.dart';

/// Displays detailed information about a Author.
class AuthorDetailsView extends StatelessWidget {
  const AuthorDetailsView({Key? key}) : super(key: key);

  static const routeName = '/author';

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    Author author = Author.fromMap(args);
    return Scaffold(
      appBar: AppBar(
        title: Text(author.name),
      ),
      body: Center(
        child: Text('${author.name} is the philosopher with id ${author.id}'),
      ),
    );
  }
}
