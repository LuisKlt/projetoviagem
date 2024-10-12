import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:projetoviagem/model/combustivel.dart';
import 'package:projetoviagem/model/destino.dart';
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
  
  final TextEditingController nomeController = TextEditingController();
  final TextEditingController consumoController = TextEditingController();
  final TextEditingController destinoController = TextEditingController();
  final TextEditingController distanciaController = TextEditingController();
  final TextEditingController tipoController = TextEditingController();
  final TextEditingController precoController = TextEditingController();
  
  List<Carro> carroOption = [
    Carro(nome: "BMW M3", consumo: 10.4),
  ];
  List<Destino> destinoOption = [
    Destino(destino: 'Porto Alegre', distancia: 240),
  ];
  List<Combustivel> combustivelOption = [
    Combustivel(tipo: 'Gasolina', preco: 6.6),
  ];

  void openModal() {
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
                        openModalCarro();
                      },
                      child: Text(
                        "Carro",
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
                        openModalDestino();
                      },
                      child: Text(
                        "Destino",
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
                        openModalCombustivel();
                      },
                      child: Text(
                        "Combustível",
                        style: TextStyle(fontSize: 22),
                      )),
                ],
              ),
            ),
          );
        });
  }

  void openModalCarro() {
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

  void openModalDestino() {
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

  void openModalCombustivel() {
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
                    "Cadastrar Combustível",
                    style: TextStyle(fontSize: 24),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 20),
                  Expanded(child: Column()),
                  TextField(
                    controller: tipoController,
                    decoration: InputDecoration(label: Text("Tipo")),
                  ),
                  TextField(
                    controller: precoController,
                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly,
                    ],
                    decoration: InputDecoration(
                      label: Text("Preço"),
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
  
  final destinoValue = ValueNotifier('');
  
  final combustivelValue = ValueNotifier('');
  

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
                      value: '',
                      onChanged: (escolha) =>
                          carroValue.value = escolha.toString(),
                      items: carroOption.cast(),
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
                      value: '',
                      onChanged: (escolha) =>
                          destinoValue.value = escolha.toString(),
                      items: destinoOption.cast(),
                    ),
                  );
                }),
            SizedBox(height: 20),
            ValueListenableBuilder(
                valueListenable: combustivelValue,
                builder: (BuildContext context, String value, _) {
                  return SizedBox(
                    width: 300,
                    child: DropdownButton<String>(
                      hint: const Text('Selecione o Combustível'),
                      isExpanded: true,
                      value: '',
                      onChanged: (escolha) =>
                          combustivelValue.value = escolha.toString(),
                      items: combustivelOption,
                    ),
                  );
                }),
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
