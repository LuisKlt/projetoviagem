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

  final TextEditingController nomeController = TextEditingController();
  final TextEditingController consumoController = TextEditingController();

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
                  SizedBox(height: 20),
                  Expanded(child: Column()),
                  ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor: WidgetStatePropertyAll(Colors.blueGrey),
                          foregroundColor: WidgetStatePropertyAll(Colors.white),
                          minimumSize:
                              WidgetStatePropertyAll(Size.fromHeight(90))),
                      onPressed: () {
                        setState(() {});
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
                              WidgetStatePropertyAll(Size.fromHeight(90))),
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Viagens App"),
        backgroundColor: Colors.blueGrey,
        foregroundColor: Colors.white,
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
          child: const Icon(Icons.add), foregroundColor: Colors.white),
    );
  }
}
