import 'package:flutter/material.dart';

class CadastroVeiculos extends StatefulWidget {
  @override
  _CadastroVeiculosState createState() => _CadastroVeiculosState();
}

class _CadastroVeiculosState extends State<CadastroVeiculos> {
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
                    child:
                        TextButton(onPressed: () {}, child: Text("Cadastrar")),
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
