import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:reserva_carro/variaveis.dart';

class SolicitarVeiculo extends StatefulWidget {
  @override
  _SolicitarVeiculoState createState() => _SolicitarVeiculoState();
}

class _SolicitarVeiculoState extends State<SolicitarVeiculo> {
  String valoresInicio = listateste.last;
  int a = 6;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: InkWell(
        onTap: () {
          verificarlogin();

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
                              Text("Veiculo"),
                              DropdownButton<String>(
                                  value: valoresInicio,
                                  onChanged: (String? value) {
                                    setState(() {
                                      valoresInicio = value!;
                                    });
                                  },
                                  items: listateste.map((value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(value),
                                    );
                                  }).toList()),
                            ],
                          ),
                        ),
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

  verificarlogin() async {
    try {
      QuerySnapshot result =
          await FirebaseFirestore.instance.collection("Funcionarios").get();
      result.docs.forEach((element) {
        setState(() {
          teste.add(a++);
          print(teste);
        });
      });
    } catch (e) {}
  }
}
