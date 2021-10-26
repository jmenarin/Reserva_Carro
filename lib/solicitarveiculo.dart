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
  String ver = "";

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
                          child: Column(
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width * 0.5,
                                height: 100,
                                child: Row(
                                  children: [
                                    Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.1,
                                      child: Column(
                                        children: [
                                          Text("Cracha"),
                                          Container(
                                            width: 100,
                                            height: 30,
                                            child: TextFormField(
                                              controller: testecontroller,
                                              textAlign: TextAlign.center,
                                              decoration: InputDecoration(
                                                border: OutlineInputBorder(),
                                                contentPadding:
                                                    EdgeInsets.symmetric(
                                                        horizontal: 10),
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.1,
                                      child: Column(
                                        children: [
                                          Text("Ola"),
                                          Container(
                                            height: 35,
                                            child: Text(ver),
                                          )
                                        ],
                                      ),
                                    ),
                                    Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.1,
                                      child: Column(
                                        children: [Text("Ola"), Text("3")],
                                      ),
                                    ),
                                    Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.1,
                                      child: Column(
                                        children: [Text("Ola"), Text("4")],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              IconButton(
                                  onPressed: () {
                                    ver = testecontroller.text;
                                  },
                                  icon: Icon(Icons.add))
                            ],
                          ),
                        )
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

  atualizar() {
    setState(() {});
  }
}
