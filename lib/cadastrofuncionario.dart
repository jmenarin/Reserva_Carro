import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class CadastroFuncionarios extends StatefulWidget {
  @override
  _CadastroFuncionariosState createState() => _CadastroFuncionariosState();
}

class _CadastroFuncionariosState extends State<CadastroFuncionarios> {
  TextEditingController nomecontroller = TextEditingController();
  TextEditingController crachacontroller = TextEditingController();

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
                      controller: crachacontroller,
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
                            FirebaseFirestore.instance
                                .collection("Nomes")
                                .doc("Nome1")
                                .set({
                              crachacontroller.text: nomecontroller.text
                            });
                            Navigator.pop(context);
                            nomecontroller.clear();
                            crachacontroller.clear();
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
