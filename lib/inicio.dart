import 'package:flutter/material.dart';
import 'package:reserva_carro/cadastrofuncionario.dart';
import 'package:reserva_carro/cadastroveiculos.dart';
import 'package:reserva_carro/logo.dart';
import 'package:reserva_carro/solicitarveiculo.dart';

class PageInicio extends StatefulWidget {
  @override
  _PageInicioState createState() => _PageInicioState();
}

class _PageInicioState extends State<PageInicio> {
  String valoresInicio = "1";

  @override
  Widget build(BuildContext context) {
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
                color: Colors.green,
                width: MediaQuery.of(context).size.width * 0.8,
                height: MediaQuery.of(context).size.height * 0.9,
              ),
            ],
          )
        ],
      ),
    );
  }
}
