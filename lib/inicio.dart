import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:reserva_carro/cadastrofuncionario.dart';
import 'package:reserva_carro/cadastroveiculos.dart';
import 'package:reserva_carro/logo.dart';
import 'package:reserva_carro/solicitarveiculo.dart';
import 'package:reserva_carro/variaveis.dart';

class PageInicio extends StatefulWidget {
  @override
  _PageInicioState createState() => _PageInicioState();
}

class _PageInicioState extends State<PageInicio> {
  String valoresInicio = "1";
  String ver = "";
  String olhar = "";
  String seila = "";
  String nome = "";
  String tes = "";

  @override
  Widget build(BuildContext context) {
    verifica();
    return Scaffold(
      body: Column(
        children: [
          Container(
            color: Colors.red,
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.1,
            child: Padding(
              padding: const EdgeInsets.only(left: 20, right: 100),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Reserve seu carro",
                    style: TextStyle(color: Colors.white, fontSize: 50),
                  ),
                  Image.asset("assets/images/carro.png"),
                ],
              ),
            ),
          ),
          Row(
            children: [
              Container(
                color: Colors.grey,
                width: MediaQuery.of(context).size.width * 0.2,
                height: MediaQuery.of(context).size.height * 0.9,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(5),
                      child: Container(
                          color: Colors.black,
                          width: MediaQuery.of(context).size.width,
                          height: 25,
                          child: Center(
                              child: Text(
                            "Barra de Menu",
                            style: TextStyle(color: Colors.white),
                          ))),
                    ),
                    SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.only(right: 30, left: 30),
                      child: Container(
                        child: Column(
                          children: [
                            CadastroVeiculos(),
                            SizedBox(height: 20),
                            CadastroFuncionarios(),
                            SizedBox(height: 20),
                            SolicitarVeiculo(),
                            Logo(),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                child: Column(
                  children: [
                    Container(
                        color: Colors.green,
                        width: MediaQuery.of(context).size.width * 0.8,
                        height: MediaQuery.of(context).size.height * 0.7,
                        child: ListView.builder(
                            itemCount: cadastro.length,
                            itemBuilder: (BuildContext context, index) {
                              return Container(
                                  color: Colors.red,
                                  height: 30,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Text(cadastro.keys
                                          .elementAt(index)
                                          .toString()),
                                      Text(
                                        cadastro.values
                                            .elementAt(index)["Setor"]
                                            .toString(),
                                      ),
                                      Text(
                                        cadastro.values
                                            .elementAt(index)["Nome"]
                                            .toString(),
                                      )
                                      /*Text(solicitacoes.values
                                          .elementAt(index)["Nome"]
                                          .toString()),
                                      Text(solicitacoes.values
                                          .elementAt(index)["Setor"]
                                          .toString()),
                                      Text(solicitacoes.values
                                          .elementAt(index)["Cracha"]
                                          .toString()),
                                      Text(solicitacoes.values
                                          .elementAt(index)["Carro"]
                                          .toString()),
                                      Text(solicitacoes.values
                                          .elementAt(index)["Hora-Saida"]
                                          .toString()),
                                      Text(solicitacoes.values
                                          .elementAt(index)["Hora-Chegada"]
                                          .toString()),*/
                                    ],
                                  ));
                            })),
                    Container(
                        width: MediaQuery.of(context).size.width * 0.8,
                        height: MediaQuery.of(context).size.height * 0.2,
                        color: Colors.red,
                        child: Row(
                          children: [
                            IconButton(
                                onPressed: () {
                                  setState(() {
                                    //verifica();
                                  });
                                },
                                icon: Icon(Icons.refresh)),
                            TextButton(onPressed: () {}, child: Text("Novo*"))
                          ],
                        ))
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  verifica() async {
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
}
