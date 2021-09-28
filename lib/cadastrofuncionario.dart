import 'package:flutter/material.dart';
import 'package:reserva_carro/variaveis.dart';

class CadastroFuncionarios extends StatefulWidget {
  @override
  _CadastroFuncionariosState createState() => _CadastroFuncionariosState();
}

class _CadastroFuncionariosState extends State<CadastroFuncionarios> {
  TextEditingController nomecontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: InkWell(
        onTap: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return StatefulBuilder(builder: (context, setState) {
                return AlertDialog(
                  title: Text("Cadastre o funcionario"),
                  actions: [
                    TextFormField(
                      controller: nomecontroller,
                      decoration: InputDecoration(
                        labelText: "Nome",
                      ),
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: "Cracha",
                      ),
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: "Setor",
                      ),
                    ),
                    SizedBox(height: 10),
                    Center(
                      child: TextButton(
                          onPressed: () {
                            listateste.add(nomecontroller.text);
                            Navigator.pop(context);
                            nomecontroller.clear();
                          },
                          child: Text("Cadastrar")),
                    ),
                  ],
                );
              });
            },
          );
        },
        child: Text("Cadastro de Funcionarios"),
      ),
    );
  }
}
