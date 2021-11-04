import 'package:brasil_fields/brasil_fields.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:reserva_carro/variaveis.dart';

class SolicitarVeiculo extends StatefulWidget {
  @override
  _SolicitarVeiculoState createState() => _SolicitarVeiculoState();
}

class _SolicitarVeiculoState extends State<SolicitarVeiculo> {
  TextEditingController testecontroller = TextEditingController();
  TextEditingController saidacontroller = TextEditingController();
  TextEditingController chegadacontroller = TextEditingController();
  String valoresInicio = testar.last;
  int a = 6;
  String cracha = "";
  String nome = "";
  String setor = "";
  DateTime date = DateTime.now();
  String date1 = "";
  String horapadrao = "00:00";

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
                                width: MediaQuery.of(context).size.width * 0.4,
                                height: 50,
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
                                              onEditingComplete: () =>
                                                  atualizar(setState),
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
                                          0.2,
                                      child: Column(
                                        children: [
                                          Text("Nome"),
                                          Container(
                                            width: 300,
                                            height: 30,
                                            decoration: BoxDecoration(
                                                border: Border.all()),
                                            child: Align(
                                                alignment: Alignment.centerLeft,
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 3),
                                                  child: Text(nome),
                                                )),
                                          )
                                        ],
                                      ),
                                    ),
                                    Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.1,
                                      child: Column(
                                        children: [
                                          Text("Setor"),
                                          Container(
                                            width: 100,
                                            height: 30,
                                            decoration: BoxDecoration(
                                                border: Border.all()),
                                            child: Center(child: Text(setor)),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                color: Colors.yellow,
                                width: MediaQuery.of(context).size.width * 0.4,
                                height: 50,
                                child: Row(children: [
                                  Column(
                                    children: [
                                      Container(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.15,
                                        child: Column(
                                          children: [
                                            Text("Dia"),
                                            GestureDetector(
                                                onTap: () async {
                                                  date = (await showDatePicker(
                                                      context: context,
                                                      initialDate:
                                                          DateTime.now(),
                                                      firstDate: DateTime.now(),
                                                      lastDate:
                                                          DateTime(2040)))!;

                                                  verify(setState);
                                                },
                                                child: Container(
                                                  width: 100,
                                                  height: 30,
                                                  color: Colors.red,
                                                  child: Text(date1),
                                                ))
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  Column(children: [
                                    Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.15,
                                      child: Column(
                                        children: [
                                          Text("Hora Saida"),
                                          Container(
                                            width: 100,
                                            height: 30,
                                            child: TextFormField(
                                              inputFormatters: [
                                                FilteringTextInputFormatter
                                                    .digitsOnly,
                                                HoraInputFormatter(),
                                              ],
                                              onEditingComplete: () =>
                                                  atualizar(setState),
                                              controller: saidacontroller,
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
                                  ]),
                                  Column(
                                    children: [
                                      Container(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.15,
                                        child: Column(
                                          children: [
                                            Text("Hora Chegada"),
                                            Container(
                                              width: 100,
                                              height: 30,
                                              child: TextFormField(
                                                inputFormatters: [
                                                  FilteringTextInputFormatter
                                                      .digitsOnly,
                                                  HoraInputFormatter(),
                                                ],
                                                onEditingComplete: () =>
                                                    atualizar(setState),
                                                controller: chegadacontroller,
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
                                    ],
                                  ),
                                ]),
                              )
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

  verify(setState) {
    setState(() {
      DateFormat format = DateFormat('dd/MM/yyyy');
      date1 = format.format(date);
    });
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

  atualizar(setState) {
    setState(() {
      cracha = testecontroller.text;
      if (cadastro.containsKey(cracha)) {
        // ignore: unnecessary_statements
        nome = cadastro[cracha]!["Nome"];
        setor = cadastro[cracha]!["Setor"];
      }
    });
  }
}
