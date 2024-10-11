// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'model/carro.dart';

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
                          backgroundColor:
                              WidgetStatePropertyAll(Colors.blueGrey),
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
                          backgroundColor:
                              WidgetStatePropertyAll(Colors.blueGrey),
                          foregroundColor: WidgetStatePropertyAll(Colors.white),
                          minimumSize:
                              WidgetStatePropertyAll(Size.fromHeight(60))),
                      onPressed: () {
                        setState(() {});
                        openModalDestinos();
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

  void openModalCarros() {
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
                          backgroundColor:
                              WidgetStatePropertyAll(Colors.blueGrey),
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

  final TextEditingController destinoController = TextEditingController();
  final TextEditingController distanciaController = TextEditingController();

  void openModalDestinos() {
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
                    "Cadastrar Destino",
                    style: TextStyle(fontSize: 24),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 20),
                  Expanded(child: Column()),
                  TextField(
                    controller: nomeController,
                    decoration: InputDecoration(label: Text("Destino")),
                  ),
                  TextField(
                    controller: consumoController,
                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly,
                    ],
                    decoration: InputDecoration(
                      label: Text("Distancia"),
                    ),
                  ),
                  SizedBox(height: 60),
                  ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor:
                              WidgetStatePropertyAll(Colors.blueGrey),
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

  final carroValue = ValueNotifier('');
  final carroOption = ['Audi', 'BMW'];
  final destinoValue = ValueNotifier('');
  final destinoOption = ['Santa Maria', 'Porto Alegre'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Viagens App"),
        backgroundColor: Colors.blueGrey,
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 200),
            Text(
              'Calcule o preço da sua viagem',
              style: TextStyle(fontSize: 22),
            ),
            SizedBox(height: 60),
            ValueListenableBuilder(
                valueListenable: carroValue,
                builder: (BuildContext context, String value, _) {
                  return SizedBox(
                    width: 300,
                    child: DropdownButton<String>(
                      hint: const Text('Selecione o Carro'),
                      isExpanded: true,
                      value: (value.isEmpty) ? null : value,
                      onChanged: (escolha) =>
                          carroValue.value = escolha.toString(),
                      items: carroOption
                          .map(
                            (op) => DropdownMenuItem(
                              value: op,
                              child: Text(op),
                            ),
                          )
                          .toList(),
                    ),
                  );
                }),
            SizedBox(height: 20),
            ValueListenableBuilder(
                valueListenable: destinoValue,
                builder: (BuildContext context, String value, _) {
                  return SizedBox(
                    width: 300,
                    child: DropdownButton<String>(
                      hint: const Text('Selecione o Destino'),
                      isExpanded: true,
                      value: (value.isEmpty) ? null : value,
                      onChanged: (escolha) =>
                          destinoValue.value = escolha.toString(),
                      items: destinoOption
                          .map(
                            (op) => DropdownMenuItem(
                              value: op,
                              child: Text(op),
                            ),
                          )
                          .toList(),
                    ),
                  );
                }),
            SizedBox(height: 20),
            SizedBox(
              width: 300,
              child: TextFormField(
                keyboardType: TextInputType.number,
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.digitsOnly,
                ],
                decoration: InputDecoration(
                  hintText: 'Valor do combustível',
                ),
              ),
            ),
            SizedBox(height: 40),
            SizedBox(
              width: 300,
              height: 40,
              child: ElevatedButton(
                onPressed: () {
                  setState(() {});
                },
                style: ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll(Colors.blueGrey),
                  foregroundColor: WidgetStatePropertyAll(Colors.white),
                ),
                child: Text(
                  'Calcular',
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
            SizedBox(height: 40),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          openModal();
        },
        backgroundColor: Colors.blueGrey,
        foregroundColor: Colors.white,
        child: Icon(Icons.add),
      ),
    );
  }
}
