import 'package:flutter/material.dart';
import 'package:reserva_carro/variaveis.dart';

class CadastroVeiculos extends StatefulWidget {
  @override
  _CadastroVeiculosState createState() => _CadastroVeiculosState();
}

class _CadastroVeiculosState extends State<CadastroVeiculos> {
  TextEditingController marcacontroller = TextEditingController();
  TextEditingController modelocontroller = TextEditingController();
  TextEditingController motorcontroller = TextEditingController();
  TextEditingController anocontroller = TextEditingController();
  TextEditingController placacontroller = TextEditingController();
  TextEditingController combustivelcontroller = TextEditingController();
  TextEditingController carropcdcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: InkWell(
        onTap: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title:
                    Center(child: Text("Descreva as informações do veiculo")),
                actions: [
                  TextFormField(
                    controller: marcacontroller,
                    decoration: InputDecoration(
                      labelText: "Marca",
                    ),
                  ),
                  TextFormField(
                    controller: modelocontroller,
                    decoration: InputDecoration(
                      labelText: "Modelo",
                    ),
                  ),
                  TextFormField(
                    controller: motorcontroller,
                    decoration: InputDecoration(
                      labelText: "Motor",
                    ),
                  ),
                  TextFormField(
                    controller: anocontroller,
                    decoration: InputDecoration(
                      labelText: "Ano",
                    ),
                  ),
                  TextFormField(
                    controller: placacontroller,
                    decoration: InputDecoration(
                      labelText: "Placa",
                    ),
                  ),
                  TextFormField(
                    controller: combustivelcontroller,
                    decoration: InputDecoration(
                      labelText: "Combustivel",
                    ),
                  ),
                  TextFormField(
                    controller: carropcdcontroller,
                    decoration: InputDecoration(
                      labelText: "Carro PCD",
                    ),
                  ),
                  SizedBox(height: 10),
                  Center(
                    child: TextButton(
                        onPressed: () {
                          if (marcacontroller.text != "" &&
                              modelocontroller.text != "" &&
                              motorcontroller.text != "" &&
                              anocontroller.text != "" &&
                              placacontroller.text != "" &&
                              combustivelcontroller.text != "") {
                            /*FirebaseFirestore.instance
                                .collection("Veiculos")
                                .doc(placacontroller.text)
                                .set({
                              "Marca": marcacontroller.text,
                              "Modelo": modelocontroller.text,
                              "Motor": motorcontroller.text,
                              "Ano": anocontroller.text,
                              "Combustivel": combustivelcontroller.text,
                            });*/
                            veiculos.addAll({
                              placacontroller.text: {
                                "Marca": marcacontroller.text,
                                "Modelo": modelocontroller.text,
                                "Motor": motorcontroller.text,
                                "Ano": anocontroller.text,
                                "Combustivel": combustivelcontroller.text,
                                "CarroPCD": carropcdcontroller.text,
                              }
                            });
                            Navigator.pop(context);
                            marcacontroller.clear();
                            modelocontroller.clear();
                            anocontroller.clear();
                            motorcontroller.clear();
                            placacontroller.clear();
                            combustivelcontroller.clear();
                            carropcdcontroller.clear();
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                backgroundColor: Colors.green,
                                content: Text("Veiculo cadastrado")));
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                backgroundColor: Colors.red,
                                content: Text("Existe campos em branco")));
                          }
                        },
                        child: Text("Cadastrar")),
                  )
                ],
              );
            },
          );
        },
        child: Text("Cadastro de Veiculos"),
      ),
    );
  }
}
