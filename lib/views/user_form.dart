import 'package:flutter/material.dart';
import 'package:flutter_crud/models/user.dart';
import 'package:flutter_crud/provider/users.dart';
import 'package:provider/provider.dart';

// ignore: use_key_in_widget_constructors
class UserForm extends StatelessWidget {
  final _form = GlobalKey<FormState>();
  final Map<String, String> _formData = {};
  void _loadFormData(User user) {
    _formData['id'] = user.id;
    _formData['name'] = user.name;
    _formData['email'] = user.email;
    _formData['avatarUrl'] = user.avatarUrl;
  }

  @override
  Widget build(BuildContext context) {
    final User? user = ModalRoute.of(context)!.settings.arguments as User?;
    _loadFormData(user!);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Formulário de Usuário'),
        actions: [
          IconButton(
            onPressed: () {
              _form.currentState!.save();

              Provider.of<Users>(context, listen: false).put(
                User(
                  id: _formData['id']!,
                  name: _formData['name']!,
                  email: _formData['email']!,
                  avatarUrl: _formData['avatarUrl']!,
                ),
              );

              Navigator.of(context).pop();
            },
            icon: const Icon(Icons.save_rounded),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Form(
            key: _form,
            child: Column(children: [
              TextFormField(
                initialValue: _formData['name'],
                decoration: const InputDecoration(labelText: 'Nome'),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Nome inválido';
                  }
                  if (value.trim().length < 3) {
                    return 'Nome muito pequeno. No mínimo 3 caracteres.';
                  }
                  return null;
                },
                onSaved: (value) => _formData['name'] = value!,
              ),
              TextFormField(
                initialValue: _formData['email'],
                decoration: const InputDecoration(labelText: 'E-Mail'),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'E-Mail inválido';
                  }
                  if (value.trim().length < 3) {
                    return 'E-Mail muito pequeno. No mínimo 3 caracteres.';
                  }
                  return null;
                },
                onSaved: (value) => _formData['email'] = value!,
              ),
              TextFormField(
                initialValue: _formData['avatarUrl'],
                decoration: const InputDecoration(labelText: 'URL do Avatar'),
                onSaved: (value) => _formData['avatarUrl'] = value!,
              )
            ])),
      ),
    );
  }
}
