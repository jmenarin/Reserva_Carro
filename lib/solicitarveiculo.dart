import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:reserva_carro/variaveis.dart';

class SolicitarVeiculo extends StatefulWidget {
  @override
  _SolicitarVeiculoState createState() => _SolicitarVeiculoState();
}

class _SolicitarVeiculoState extends State<SolicitarVeiculo> {
  TextEditingController testecontroller = TextEditingController();
  String valoresInicio = testar.last;
  int a = 6;

  @override
  Widget build(BuildContext context) {
    verificar();
    return Align(
      alignment: Alignment.centerLeft,
      child: InkWell(
        onTap: () {
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return StatefulBuilder(
                  builder: (context, setState) {
                    return AlertDialog(
                      title: Center(
                          child: Text("Descreva as informações do veiculo")),
                      actions: [
                        Container(
                          color: Colors.black12,
                          height: 30,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text("Nome"),
                              DropdownButton<String>(
                                  value: valoresInicio,
                                  onChanged: (String? value) {
                                    setState(() {
                                      valoresInicio = value!;
                                    });
                                  },
                                  items: testar.map((value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(value),
                                    );
                                  }).toList()),
                            ],
                          ),
                        ),
                        Container(
                          color: Colors.black12,
                          height: 30,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text("Nome"),
                              DropdownButton<String>(
                                  value: valoresInicio,
                                  onChanged: (String? value) {
                                    setState(() {
                                      valoresInicio = value!;
                                    });
                                  },
                                  items: testar.map((value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(value),
                                    );
                                  }).toList()),
                            ],
                          ),
                        ),
                        Container(
                            color: Colors.black12,
                            height: 30,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text("Nome"),
                                Container(
                                  height: 20,
                                  width: 100,
                                  child: TextFormField(
                                    decoration:
                                        InputDecoration(hintText: "OLa"),
                                  ),
                                ),
                              ],
                            )),
                      ],
                    );
                  },
                );
              });
        },
        child: Text("Nova solicitação"),
      ),
    );
  }

  verificar() async {
    try {
      QuerySnapshot result =
          await FirebaseFirestore.instance.collection("Funcionarios").get();
      result.docs.forEach((element) {
        testar.add(element.get("Nome"));
      });
    } catch (e) {}
  }
}
