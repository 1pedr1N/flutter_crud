import 'package:flutter_crud/components/user_tile.dart';

import 'package:flutter/material.dart';
import 'package:flutter_crud/models/user.dart';
import 'package:flutter_crud/provider/users.dart';
import 'package:provider/provider.dart';

class UserList extends StatelessWidget {
  const UserList({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final Users users = Provider.of(
      context,
    );
    return Scaffold(
        appBar: AppBar(
          title: const Text('Lista de Usuários'),
          actions: [
            IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed('/user-form');
              },
              icon: const Icon(Icons.add),
            ),
          ],
        ),
        body: ListView.builder(
            itemBuilder: (ctx, i) => UserTile(users.byIndex(i)),
            itemCount: users.count));
  }
}
