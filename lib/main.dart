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
      title: "Viagens App",
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

  void openModal() {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return Container(
            width: MediaQuery.of(context).size.width,
            height: 300,
            child: Padding(
              padding: const EdgeInsets.all(30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    "Cadastros",
                    style: TextStyle(fontSize: 24),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 40),
                  ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor: WidgetStatePropertyAll(Colors.blueGrey),
                          foregroundColor: WidgetStatePropertyAll(Colors.white),
                          minimumSize:
                              WidgetStatePropertyAll(Size.fromHeight(60))),
                      onPressed: () {
                        setState(() {});
                        openModalCarros();
                      },
                      child: Text(
                        "Carros",
                        style: TextStyle(fontSize: 22),
                      )),
                  SizedBox(height: 20),
                  ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor: WidgetStatePropertyAll(Colors.blueGrey),
                          foregroundColor: WidgetStatePropertyAll(Colors.white),
                          minimumSize:
                              WidgetStatePropertyAll(Size.fromHeight(60))),
                      onPressed: () {
                        setState(() {});
                      },
                      child: Text(
                        "Destinos",
                        style: TextStyle(fontSize: 22),
                      )),
                ],
              ),
            ),
          );
        });
  }

  final TextEditingController nomeController = TextEditingController();
  final TextEditingController consumoController = TextEditingController();

  void openModalCarros(){
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return Container(
            width: MediaQuery.of(context).size.width,
            height: 350,
            child: Padding(
              padding: const EdgeInsets.all(30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    "Cadastrar Carro",
                    style: TextStyle(fontSize: 24),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 20),
                  Expanded(child: Column()),
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
                  SizedBox(height: 60),
                  ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor: WidgetStatePropertyAll(Colors.blueGrey),
                          foregroundColor: WidgetStatePropertyAll(Colors.white),
                          minimumSize:
                              WidgetStatePropertyAll(Size.fromHeight(60))),
                      onPressed: () {
                        setState(() {});
                        nomeController.clear();
                        consumoController.clear();
                        Navigator.pop(context);
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
        title: Text("Viagens App"),
        backgroundColor: Colors.blueGrey,
        foregroundColor: Colors.white,
      ),
      
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            openModal();
          },
          backgroundColor: Colors.blueGrey,
          child: const Icon(Icons.add), foregroundColor: Colors.white),
    );
  }
}
