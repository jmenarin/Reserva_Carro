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
    setState(() {});
    return Scaffold(
      body: Column(
        children: [
          menuprincipal(),
          Row(
            children: [
              barralateral(),
              Container(
                child: Column(
                  children: [
                    barradescricao(),
                    listasolicitacao(),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  atualizar(setState) {
    setState(() {});
  }

  barradescricao() {
    return Container(
      color: Colors.grey,
      width: MediaQuery.of(context).size.width * 0.8,
      height: MediaQuery.of(context).size.height * 0.05,
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(border: Border.all(color: Colors.black)),
            height: MediaQuery.of(context).size.height * 0.05,
            width: MediaQuery.of(context).size.width * 0.18,
            child: Center(child: Text("Nome")),
          ),
          Container(
            decoration: BoxDecoration(border: Border.all(color: Colors.black)),
            height: MediaQuery.of(context).size.height * 0.05,
            width: MediaQuery.of(context).size.width * 0.1,
            child: Center(child: Text("Setor")),
          ),
          Container(
            decoration: BoxDecoration(border: Border.all(color: Colors.black)),
            height: MediaQuery.of(context).size.height * 0.05,
            width: MediaQuery.of(context).size.width * 0.05,
            child: Center(child: Text("Cracha")),
          ),
          Container(
            decoration: BoxDecoration(border: Border.all(color: Colors.black)),
            height: MediaQuery.of(context).size.height * 0.05,
            width: MediaQuery.of(context).size.width * 0.1,
            child: Center(child: Text("Veiculo")),
          ),
          Container(
            decoration: BoxDecoration(border: Border.all(color: Colors.black)),
            height: MediaQuery.of(context).size.height * 0.05,
            width: MediaQuery.of(context).size.width * 0.07,
            child: Center(child: Text("Dia")),
          ),
          Container(
            decoration: BoxDecoration(border: Border.all(color: Colors.black)),
            height: MediaQuery.of(context).size.height * 0.05,
            width: MediaQuery.of(context).size.width * 0.05,
            child: Center(child: Text("Saida")),
          ),
          Container(
            decoration: BoxDecoration(border: Border.all(color: Colors.black)),
            height: MediaQuery.of(context).size.height * 0.05,
            width: MediaQuery.of(context).size.width * 0.05,
            child: Center(child: Text("Chegada")),
          ),
          Container(
            decoration: BoxDecoration(border: Border.all(color: Colors.black)),
            height: MediaQuery.of(context).size.height * 0.05,
            width: MediaQuery.of(context).size.width * 0.2,
            child: Center(child: Text("Destino")),
          ),
        ],
      ),
    );
  }

  listasolicitacao() {
    return Container(
        //color: Colors.green,
        width: MediaQuery.of(context).size.width * 0.8,
        height: MediaQuery.of(context).size.height * 0.85,
        child: ListView.builder(
            itemCount: solicitacoes.length,
            itemBuilder: (BuildContext context, index) {
              return InkWell(
                onTap: () {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return StatefulBuilder(builder: (context, setState) {
                          return AlertDialog(
                              title: Text("Deseja excluir?"),
                              actions: [
                                TextButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: Text("Não")),
                                TextButton(
                                    onPressed: () {
                                      solicitacoes.remove(solicitacoes.values
                                          .elementAt(index)["Cracha"]
                                          .toString());
                                      atualizar(setState);

                                      /*FirebaseFirestore.instance
                                          .collection("Funcionarios")
                                          .doc(solicitacoes.values
                                              .elementAt(index)["Cracha"]
                                              .toString());*/

                                      Navigator.pop(context);
                                    },
                                    child: Text("Sim")),
                              ]);
                        });
                      });
                },
                child: Container(
                    height: 30,
                    child: Row(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.black)),
                          width: MediaQuery.of(context).size.width * 0.18,
                          height: 30,
                          child: Center(
                            child: Text(solicitacoes.values
                                .elementAt(index)["Nome"]
                                .toString()),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.black)),
                          width: MediaQuery.of(context).size.width * 0.1,
                          height: 30,
                          child: Center(
                            child: Text(solicitacoes.values
                                .elementAt(index)["Setor"]
                                .toString()),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.black)),
                          width: MediaQuery.of(context).size.width * 0.05,
                          height: 30,
                          child: Center(
                            child: Text(solicitacoes.values
                                .elementAt(index)["Cracha"]
                                .toString()),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.black)),
                          width: MediaQuery.of(context).size.width * 0.1,
                          height: 30,
                          child: Center(
                            child: Text(solicitacoes.values
                                .elementAt(index)["Veiculo"]
                                .toString()),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.black)),
                          width: MediaQuery.of(context).size.width * 0.07,
                          height: 30,
                          child: Center(
                            child: Text(solicitacoes.values
                                .elementAt(index)["Dia"]
                                .toString()),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.black)),
                          width: MediaQuery.of(context).size.width * 0.05,
                          height: 30,
                          child: Center(
                            child: Text(solicitacoes.values
                                .elementAt(index)["Hora-Saida"]
                                .toString()),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.black)),
                          width: MediaQuery.of(context).size.width * 0.05,
                          height: 30,
                          child: Center(
                            child: Text(solicitacoes.values
                                .elementAt(index)["Hora-Chegada"]
                                .toString()),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.black)),
                          width: MediaQuery.of(context).size.width * 0.2,
                          height: 30,
                          child: Center(
                            child: Text(solicitacoes.values
                                .elementAt(index)["Destino"]
                                .toString()),
                          ),
                        ),
                      ],
                    )),
              );
            }));
  }

  barralateral() {
    return Container(
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
                  SizedBox(height: 50),
                  IconButton(
                      onPressed: () {
                        setState(() {});
                      },
                      icon: Icon(Icons.refresh)),
                  Logo(),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  menuprincipal() {
    return Container(
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
    );
  }
}
