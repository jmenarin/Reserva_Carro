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
  String cracha = "";
  String nome = "";
  String setor = "";
  String carropcd = "";
  String motorista = "";
  DateTime date = DateTime.now();
  String date1 = "";
  String horapadrao = "00:00";
  String dropdownValue = "One";
  String veiculoselecionado = "";

  @override
  Widget build(BuildContext context) {
    verifica();
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
                          child:
                              Text("Descreva as informações da solicitação")),
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
                                          0.075,
                                      child: Column(
                                        children: [
                                          Text("Cracha"),
                                          Container(
                                            width: 100,
                                            height: 30,
                                            child: TextFormField(
                                              onEditingComplete: () =>
                                                  atualizar(setState),
                                              controller: crachacontroller,
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
                                          Text("Nome"),
                                          Container(
                                            width: 300,
                                            height: 30,
                                            decoration: BoxDecoration(
                                                border: Border.all(
                                                    color: Colors.grey),
                                                borderRadius:
                                                    BorderRadius.circular(4)),
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
                                          0.075,
                                      child: Column(
                                        children: [
                                          Text("Setor"),
                                          Container(
                                            width: 100,
                                            height: 30,
                                            decoration: BoxDecoration(
                                                border: Border.all(
                                                    color: Colors.grey),
                                                borderRadius:
                                                    BorderRadius.circular(4)),
                                            child: Center(child: Text(setor)),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.075,
                                      child: Column(
                                        children: [
                                          Text("Possui deficiencia?"),
                                          Container(
                                            width: 100,
                                            height: 30,
                                            decoration: BoxDecoration(
                                                border: Border.all(
                                                    color: Colors.grey),
                                                borderRadius:
                                                    BorderRadius.circular(4)),
                                            child:
                                                Center(child: Text(carropcd)),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.075,
                                      child: Column(
                                        children: [
                                          Text("Precisa de motorista?"),
                                          Container(
                                            width: 100,
                                            height: 30,
                                            decoration: BoxDecoration(
                                                border: Border.all(
                                                    color: Colors.grey),
                                                borderRadius:
                                                    BorderRadius.circular(4)),
                                            child:
                                                Center(child: Text(motorista)),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width * 0.4,
                                height: 50,
                                child: Row(children: [
                                  Column(
                                    children: [
                                      Container(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.1,
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
                                                  // ignore: unnecessary_null_comparison
                                                  if (date != null) {
                                                    verify(setState);
                                                  }
                                                },
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                      border: Border.all(
                                                          color: Colors.grey),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              4)),
                                                  width: 100,
                                                  height: 30,
                                                  child: Center(
                                                      child: Text(date1)),
                                                ))
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  Column(children: [
                                    Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.1,
                                      child: Column(
                                        children: [
                                          Text("Hora Saida"),
                                          Container(
                                            width: 70,
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
                                                0.1,
                                        child: Column(
                                          children: [
                                            Text("Hora Chegada"),
                                            Container(
                                              width: 70,
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
                                  Column(
                                    children: [
                                      Container(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.1,
                                        child: Column(
                                          children: [
                                            Text("Destino"),
                                            Container(
                                              width: 150,
                                              height: 30,
                                              child: TextFormField(
                                                controller: destinocontroller,
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
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width * 0.2,
                                child: Column(
                                  children: [
                                    Text("Veiculo"),
                                    Container(
                                      width: 300,
                                      height: 30,
                                      decoration: BoxDecoration(
                                          border:
                                              Border.all(color: Colors.grey),
                                          borderRadius:
                                              BorderRadius.circular(4)),
                                      child: Align(
                                          alignment: Alignment.centerLeft,
                                          child: Padding(
                                            padding:
                                                const EdgeInsets.only(left: 3),
                                            child: Center(
                                                child:
                                                    Text(veiculoselecionado)),
                                          )),
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(height: 10),
                              Container(
                                width: MediaQuery.of(context).size.width * 0.4,
                                height: 25,
                                decoration: BoxDecoration(
                                    color: Colors.grey[400],
                                    border: Border.all()),
                                child: Center(
                                    child: Text(
                                  "Veiculo Disponiveis",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                )),
                              ),
                              Container(
                                //color: Colors.blue,
                                width: MediaQuery.of(context).size.width * 0.4,
                                height: 25,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                          color: Colors.grey[300],
                                          border: Border.all()),
                                      width: MediaQuery.of(context).size.width *
                                          0.175,
                                      child: Center(
                                          child: Text("Modelo",
                                              style: TextStyle(
                                                  fontWeight:
                                                      FontWeight.bold))),
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                          color: Colors.grey[300],
                                          border: Border.all()),
                                      width: MediaQuery.of(context).size.width *
                                          0.175,
                                      child: Center(
                                          child: Text("Placa",
                                              style: TextStyle(
                                                  fontWeight:
                                                      FontWeight.bold))),
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                          color: Colors.grey[300],
                                          border: Border.all()),
                                      width: MediaQuery.of(context).size.width *
                                          0.05,
                                      child: Center(
                                          child: Text("PCD",
                                              style: TextStyle(
                                                  fontWeight:
                                                      FontWeight.bold))),
                                    )
                                  ],
                                ),
                              ),
                              Container(
                                color: Colors.white,
                                width: MediaQuery.of(context).size.width * 0.4,
                                height: 90,
                                child: ListView.builder(
                                  itemCount: veiculos.length,
                                  itemBuilder: (BuildContext context, index) {
                                    return InkWell(
                                      onTap: () {
                                        veiculoselecionado = veiculos.values
                                            .elementAt(index)["Modelo"]
                                            .toString();

                                        atualizar(setState);
                                      },
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          Container(
                                            decoration: BoxDecoration(
                                                border: Border.all()),
                                            height: 25,
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.175,
                                            child: Center(
                                              child: Text(veiculos.values
                                                  .elementAt(index)["Modelo"]
                                                  .toString()),
                                            ),
                                          ),
                                          Container(
                                            decoration: BoxDecoration(
                                                border: Border.all()),
                                            height: 25,
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.175,
                                            child: Center(
                                              child: Text(veiculos.keys
                                                  .elementAt(index)
                                                  .toString()),
                                            ),
                                          ),
                                          Container(
                                            decoration: BoxDecoration(
                                                border: Border.all()),
                                            height: 25,
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.05,
                                            child: Center(
                                              child: Text(veiculos.values
                                                  .elementAt(index)["CarroPCD"]
                                                  .toString()),
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                ),
                              ),
                              TextButton(
                                  onPressed: () {
                                    addsolicitacao();
                                    atualizar(setState);
                                  },
                                  child: Text("Cadastrar")),
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

  atualizar(setState) {
    setState(() {
      cracha = crachacontroller.text;
      if (cadastro.containsKey(cracha)) {
        // ignore: unnecessary_statements
        nome = cadastro[cracha]!["Nome"];
        setor = cadastro[cracha]!["Setor"];
        carropcd = cadastro[cracha]!["CarroPCD"];
        motorista = cadastro[cracha]!["Motorista"];
      }
    });
  }

  verifica() async {
    try {
      QuerySnapshot result =
          await FirebaseFirestore.instance.collection("Veiculos").get();
      setState(() {});
      result.docs.forEach((element) {
        veiculos.addAll({
          element.id: {
            "Ano": element.get("Ano"),
            "Combustivel": element.get("Combustivel"),
            "Marca": element.get("Marca"),
            "Modelo": element.get("Modelo"),
            "Motor": element.get("Motor"),
          }
        });
      });
    } catch (e) {}
  }

  /*verifica2() async {
    try {
      QuerySnapshot result =
          await FirebaseFirestore.instance.collection("Solicitacoes").get();
      setState(() {});
      result.docs.forEach((element) {
        veiculos.addAll({
          element.id: {
            "Nome": element.get("Nome"),
            "Setor": element.get("Setor"),
            "Cracha": element.get("Cracha"),
            "Hora-Saida": element.get("Hora-Saida"),
            "Hora-Chegada": element.get("Hora-Chegada"),
            "Destino": element.get("Destino"),
            "Dia": element.get("Dia"),
          }
        });
      });
    } catch (e) {}
  }*/

  verificar() async {
    try {
      QuerySnapshot result =
          await FirebaseFirestore.instance.collection("Funcionarios").get();
      setState(() {});
      result.docs.forEach((element) {
        cadastro.addAll({
          element.id: {
            "Nome": element.get("Nome"),
            "Setor": element.get("Setor")
          }
        });
      });
    } catch (e) {}
  }

  addsolicitacao() {
    if (nome != "" &&
        setor != "" &&
        cracha != "" &&
        veiculoselecionado != "" &&
        saidacontroller.text != "" &&
        chegadacontroller.text != "" &&
        destinocontroller.text != "" &&
        date1 != "") {
      solicitacoes.addAll({
        crachacontroller.text: {
          "Nome": nome,
          "Setor": setor,
          "Cracha": cracha,
          "Veiculo": veiculoselecionado,
          "Hora-Saida": saidacontroller.text,
          "Hora-Chegada": chegadacontroller.text,
          "Destino": destinocontroller.text,
          "Dia": date1,
        }
      });

      /*FirebaseFirestore.instance
          .collection("Solicitacoes")
          .doc(crachacontroller.text)
          .set({
        "Nome": nome,
        "Setor": setor,
        "Cracha": cracha,
        "Veiculo": veiculoselecionado,
        "Hora-Saida": saidacontroller.text,
        "Hora-Chegada": chegadacontroller.text,
        "Destino": destinocontroller.text,
        "Dia": date1,
      });*/

      chegadacontroller.clear();
      saidacontroller.clear();
      destinocontroller.clear();
      date1 = "";
      nome = "";
      setor = "";
      crachacontroller.clear();
      veiculoselecionado = "";

      Navigator.pop(context);
      atualizar(setState);

      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: Colors.green,
          content: Text("Solicitacao agendada")));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: Colors.red,
          content: Text("Existe campos em branco")));
    }
  }
}
