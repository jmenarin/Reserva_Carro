import 'package:flutter/material.dart';
import 'package:reserva_carro/variaveis.dart';

class CadastroFuncionarios extends StatefulWidget {
  @override
  _CadastroFuncionariosState createState() => _CadastroFuncionariosState();
}

class _CadastroFuncionariosState extends State<CadastroFuncionarios> {
  TextEditingController nomecontroller = TextEditingController();
  TextEditingController crachacontroller = TextEditingController();
  TextEditingController setorcontroller = TextEditingController();
  TextEditingController precisamotoristacontroller = TextEditingController();
  TextEditingController carropcdcontroller = TextEditingController();
  bool botao = true;

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
                      controller: setorcontroller,
                      decoration: InputDecoration(
                        labelText: "Setor",
                      ),
                    ),
                    TextFormField(
                      controller: carropcdcontroller,
                      decoration: InputDecoration(
                        labelText: "Precisa de carro PCD?",
                      ),
                    ),
                    TextFormField(
                      controller: precisamotoristacontroller,
                      decoration: InputDecoration(
                        labelText: "Precisa de motorista?",
                      ),
                    ),
                    SizedBox(height: 10),
                    Center(
                      child: TextButton(
                          onPressed: () {
                            if (nomecontroller.text != "" &&
                                crachacontroller.text != "" &&
                                setorcontroller.text != "" &&
                                precisamotoristacontroller.text != "" &&
                                carropcdcontroller.text != "") {
                              /*FirebaseFirestore.instance
                                  .collection("Funcionarios")
                                  .doc(crachacontroller.text)
                                  .set({
                                "Nome": nomecontroller.text,
                                "Setor": setorcontroller.text,
                              });*/
                              cadastro.addAll({
                                crachacontroller.text: {
                                  "Nome": nomecontroller.text,
                                  "Setor": setorcontroller.text,
                                  "CarroPCD": carropcdcontroller.text,
                                  "Motorista": precisamotoristacontroller.text,
                                }
                              });
                              Navigator.pop(context);
                              nomecontroller.clear();
                              crachacontroller.clear();
                              setorcontroller.clear();
                              precisamotoristacontroller.clear();
                              carropcdcontroller.clear();
                              ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                      backgroundColor: Colors.green,
                                      content: Text("Funcionario cadastrado")));
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                      backgroundColor: Colors.red,
                                      content:
                                          Text("Existe campos em branco")));
                            }
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
