import 'package:flutter/material.dart';

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
                  Image.asset("assets/images/carro.png")
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
                            Align(
                              alignment: Alignment.centerLeft,
                              child: InkWell(
                                onTap: () {
                                  showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        title: Center(
                                            child: Text(
                                                "Descreva as informações do veiculo")),
                                        actions: [
                                          TextFormField(
                                            decoration: InputDecoration(
                                              labelText: "Marca",
                                            ),
                                          ),
                                          TextFormField(
                                            decoration: InputDecoration(
                                              labelText: "Modelo",
                                            ),
                                          ),
                                          TextFormField(
                                            decoration: InputDecoration(
                                              labelText: "Motor",
                                            ),
                                          ),
                                          TextFormField(
                                            decoration: InputDecoration(
                                              labelText: "Ano",
                                            ),
                                          ),
                                          TextFormField(
                                            decoration: InputDecoration(
                                              labelText: "Placa",
                                            ),
                                          ),
                                          SizedBox(height: 10),
                                          Center(
                                            child: TextButton(
                                                onPressed: () {},
                                                child: Text("Cadastrar")),
                                          )
                                        ],
                                      );
                                    },
                                  );
                                },
                                child: Text("Cadastro de Veiculos"),
                              ),
                            ),
                            SizedBox(height: 20),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: InkWell(
                                onTap: () {
                                  showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return StatefulBuilder(
                                          builder: (context, setState) {
                                        return AlertDialog(
                                          title: Text("Cadastre o funcionario"),
                                          actions: [
                                            DropdownButton(
                                                value: valoresInicio,
                                                onChanged: (String? value) {
                                                  setState(() {
                                                    valoresInicio = value!;
                                                  });
                                                },
                                                items: ["1", "2", "3"]
                                                    .map((value) {
                                                  return DropdownMenuItem(
                                                    value: value,
                                                    child: Text(value),
                                                  );
                                                }).toList())
                                          ],
                                        );
                                      });
                                    },
                                  );
                                },
                                child: Text("Cadastro de Funcionarios"),
                              ),
                            ),
                            SizedBox(height: 20),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: InkWell(
                                onTap: () {},
                                child: Text("Nova Solicitação"),
                              ),
                            ),
                            Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.6,
                                alignment: Alignment.bottomCenter,
                                child: Image.asset(
                                  "assets/images/logo-univesp.png",
                                )),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                color: Colors.blue,
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
