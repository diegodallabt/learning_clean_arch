import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:learning_clean_arch/app/modules/users/domain/models/dtos/user_dto.dart';
import 'package:learning_clean_arch/app/modules/users/presentation/add_user/add_controller.dart';

class AddPage extends StatefulWidget {
  const AddPage({this.userDto, super.key});

  final UserDto? userDto;

  @override
  State<AddPage> createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  final controller = Modular.get<AddController>();
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  @override
  void initState() {
    super.initState();

    if (widget.userDto != null) {
      _nameController.text = widget.userDto!.name ?? '';
      _emailController.text = widget.userDto!.email ?? '';
      _phoneController.text = widget.userDto!.phone ?? '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        title: Center(
          child: Text(
            widget.userDto == null ? 'Adicionar contato' : 'Alterar contato',
          ),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Nome completo'),
              TextFormField(
                controller: _nameController,
                validator: (v) {
                  if (v!.isEmpty) return 'Campo necessário';
                  return null;
                },
                cursorColor: Colors.blue,
                decoration: const InputDecoration(
                  hintText: "Fulano de Tal",
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue, width: 2.0),
                  ),
                ),
              ),
              const SizedBox(height: 18),
              const Text('E-mail'),
              TextFormField(
                controller: _emailController,
                validator: (v) {
                  if (v!.isEmpty) return 'Campo necessário';
                  return null;
                },
                cursorColor: Colors.blue,
                decoration: const InputDecoration(
                  hintText: "fulano@detal.com.br",
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue, width: 2.0),
                  ),
                ),
              ),
              const SizedBox(height: 18),
              const Text('Telefone'),
              TextFormField(
                controller: _phoneController,
                validator: (v) {
                  if (v!.isEmpty) return 'Campo necessário';
                  return null;
                },
                cursorColor: Colors.blue,
                decoration: const InputDecoration(
                  hintText: "(XX) XXXX-XXXX",
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue, width: 2.0),
                  ),
                ),
              ),
              const SizedBox(height: 18),
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.all<Color>(Colors.blue),
                  foregroundColor: WidgetStateProperty.all<Color>(Colors.white),
                  shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                ),
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    if (widget.userDto == null) {
                      var res = await controller.addContact(UserDto(
                        name: _nameController.text,
                        email: _emailController.text,
                        phone: _phoneController.text,
                      ));

                      if (res.success) {
                        await alertMessage('Contato adicionado!');
                        Modular.to.pop();
                        Modular.to.pop(true);
                      } else {
                        await alertMessage(res.message ?? 'ERROR');
                      }
                    } else {
                      var res = await controller.updateContact(UserDto(
                        id: widget.userDto!.id,
                        createdAt: widget.userDto!.createdAt,
                        name: _nameController.text,
                        email: _emailController.text,
                        phone: _phoneController.text,
                      ));

                      if (res.success) {
                        await alertMessage('Contato editado!');
                        Modular.to.pop();
                        Modular.to.pop(true);
                      } else {
                        await alertMessage(res.message ?? 'ERROR');
                      }
                    }
                  }
                },
                child: Text(widget.userDto == null ? 'Adicionar' : 'Alterar'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future alertMessage(String message) async {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Aviso"),
          content: Text(message),
          actions: <Widget>[
            ElevatedButton(
              onPressed: () => Modular.to.pop(),
              child: const Text("Fechar"),
            ),
          ],
        );
      },
    );
  }
}
