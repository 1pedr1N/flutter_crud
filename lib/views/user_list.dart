import 'package:flutter/src/foundation/key.dart';
import 'package:flutter_crud/data/dummy_users.dart';
import 'package:flutter/material.dart';

class UserList extends StatelessWidget {
  const UserList({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    const users = {...DUMMY_USERS};
    return Scaffold(
        appBar: AppBar(
          title: const Text('Lista de Usuários'),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.add),
            ),
          ],
        ),
        body: ListView.builder(
            itemBuilder: (ctx, i) => Text(users.values.elementAt(i).name),
            itemCount: users.length));
  }
}
