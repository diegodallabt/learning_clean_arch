import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:learning_clean_arch/app/modules/users/presentation/users/users_controller.dart';

import '../../domain/models/dtos/user_dto.dart';

class UserPage extends StatefulWidget {
  const UserPage({super.key});

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  final controller = Modular.get<UserController>();

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        splashColor: Colors.lightBlue,
        shape: const CircleBorder(),
        child: const Icon(Icons.add),
        onPressed: () async {
          var res = await Modular.to.pushNamed('/add');

          if (res == true) {
            getData();
          }
        },
      ),
      appBar: AppBar(
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        title: const Center(
          child: Text(
            'Contatos',
          ),
        ),
      ),
      body: ListView.builder(
          padding: const EdgeInsets.symmetric(vertical: 10),
          itemCount: controller.contacts.length,
          itemBuilder: (_, index) {
            final model = controller.contacts[index];

            return Slidable(
              endActionPane: ActionPane(
                motion: const ScrollMotion(),
                children: [
                  SlidableAction(
                    flex: 2,
                    onPressed: (_) => _updateData(model),
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.white,
                    icon: Icons.edit_outlined,
                    label: 'Editar',
                  ),
                  SlidableAction(
                    flex: 2,
                    onPressed: (_) => deleteData(model, context),
                    backgroundColor: Colors.red,
                    foregroundColor: Colors.white,
                    icon: Icons.delete_outlined,
                    label: 'Remover',
                  ),
                ],
              ),
              child: ListTile(
                leading: CircleAvatar(
                    child: Text(
                  model.name?.substring(0, 2).toUpperCase() ?? '',
                  style: const TextStyle(color: Colors.blue),
                )),
                title: Text(model.name ?? ''),
                subtitle: Text('${model.email ?? ''}\n ${model.phone ?? ''}'),
              ),
            );
          }),
    );
  }

  getData() async {
    await controller.getData();
    setState(() {});
  }

  deleteData(UserDto model, BuildContext context) async {
    var res = await controller.deleteData(model.id);
    if (res.success) {
      setState(() {
        getData();
      });

      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
              backgroundColor: Colors.red,
              content: Text(
                textAlign: TextAlign.center,
                "O contato ${model.name} foi excluído.",
                style: const TextStyle(color: Colors.white),
              )),
        );
      }
    }
  }

  _updateData(UserDto model) async {
    var res = await Modular.to.pushNamed('/add', arguments: model);
    if (res == true) {
      getData();
    }
  }
}
