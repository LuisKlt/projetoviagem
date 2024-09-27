import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'model/carro.dart';
import 'cardwidget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "App Lista para Widget",
      home: ModalMenu(),
    );
  }
}

class ModalMenu extends StatefulWidget {
  const ModalMenu({super.key});

  @override
  State<ModalMenu> createState() => _ModalMenuState();
}

class _ModalMenuState extends State<ModalMenu> {
  List<Carro> lista = [
    Carro(nome: "BMW M3", consumo: 10.4),
  ];

  void removerItem(int index) {
    setState(() {
      lista.removeAt(index);
    });
  }

  final TextEditingController nomeController = TextEditingController();
  final TextEditingController consumoController = TextEditingController();

  void openModal() {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return Container(
            width: MediaQuery.of(context).size.width,
            height: 500,
            child: Padding(
              padding: const EdgeInsets.all(30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    "Cadastro de Carros",
                    style: TextStyle(fontSize: 24),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 20),
                  TextField(
                    controller: nomeController,
                    decoration: InputDecoration(label: Text("Nome")),
                  ),
                  TextField(
                    controller: consumoController,
                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly,
                    ],
                    decoration: InputDecoration(
                      label: Text("Consumo"),
                    ),
                  ),
                  Expanded(child: Column()),
                  ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor: WidgetStatePropertyAll(Colors.amber),
                          foregroundColor: WidgetStatePropertyAll(Colors.black),
                          minimumSize:
                              WidgetStatePropertyAll(Size.fromHeight(60))),
                      onPressed: () {
                        setState(() {
                          lista.add(Carro(
                            nome: nomeController.text,
                            consumo: double.parse(consumoController.text),
                          ));
                        });
                        Navigator.pop(context);
                        nomeController.clear();
                        consumoController.clear();
                      },
                      child: Text(
                        "Cadastrar",
                        style: TextStyle(fontSize: 22),
                      )),
                ],
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Lista de cadastros"),
        backgroundColor: Colors.amber,
      ),
      body: ListView.builder(
        itemCount: lista.length,
        itemBuilder: (context, index) {
          return Cardwidget(
            nome: lista[index].nome,
            consumo: lista[index].consumo.toString(),
            onRemove: () => removerItem(index),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            openModal();
          },
          backgroundColor: Colors.blueGrey,
          child: const Icon(Icons.add)),
    );
  }
}
