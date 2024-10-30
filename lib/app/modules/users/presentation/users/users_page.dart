import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:learning_clean_arch/app/modules/users/users_controller.dart';
// import 'package:flutter_mobx/flutter_mobx.dart';

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

  void getData() async {
    await controller.getData();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: const Center(
            child: Text(
              'Contatos',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
        body: ListView.builder(
            itemCount: controller.contacts.length,
            itemBuilder: (_, index) {
              final model = controller.contacts[index];

              return ListTile(
                leading: CircleAvatar(
                    child:
                        Text(model.name?.substring(0, 2).toUpperCase() ?? '')),
                title: Text(model.name ?? ''),
                subtitle: Text('${model.email ?? ''}\n ${model.phone ?? ''}'),
              );
            }));
  }
}
