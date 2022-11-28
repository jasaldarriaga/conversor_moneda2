import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Reto1',
      theme: ThemeData(
        primarySwatch: Colors.lightGreen,
      ),
      debugShowCheckedModeBanner: false,
      home: MyHomePage(title: 'Conversor Moneda'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

final txtOrigen = TextEditingController();
final txtDestino = TextEditingController();

String op1 = "COP";
String op2 = "USD";

class calculadora {
  final titulo;
  final color;
  final icono;

  calculadora(this.titulo, this.color, this.icono);
}

List<DropdownMenuItem<String>> dd = <DropdownMenuItem<String>>[
  DropdownMenuItem(value: "USD", child: Text("USD")),
  DropdownMenuItem(value: "EUR", child: Text("EUR")),
  DropdownMenuItem(value: "COP", child: Text("COP"))
];

List<calculadora> cal = <calculadora>[
  calculadora("9", Colors.lightGreen, Icon(Icons.abc)),
  calculadora("8", Colors.lightGreen, Icon(Icons.abc)),
  calculadora("7", Colors.lightGreen, Icon(Icons.abc)),
  calculadora("6", Colors.lightGreen, Icon(Icons.abc)),
  calculadora("5", Colors.lightGreen, Icon(Icons.abc)),
  calculadora("4", Colors.lightGreen, Icon(Icons.abc)),
  calculadora("3", Colors.lightGreen, Icon(Icons.abc)),
  calculadora("2", Colors.lightGreen, Icon(Icons.abc)),
  calculadora("1", Colors.lightGreen, Icon(Icons.abc)),
  calculadora("0", Colors.lightGreen, Icon(Icons.abc)),
  calculadora(
      "Reset", Colors.lightGreen, Icon(Icons.cleaning_services, size: 40)),
  calculadora("Calcular", Colors.lightGreen, Icon(Icons.calculate, size: 40)),
];

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(40),
        child: Column(
          children: [
            const Icon(
              Icons.currency_exchange,
              size: 50,
            ),
            Row(children: [
              const Text(
                "Origen:  ",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              DropdownButton(
                  value: op1,
                  items: dd,
                  onChanged: (String? X) {
                    setState(() {
                      op1 = X.toString();
                    });
                  }),
              const VerticalDivider(
                width: 30,
              ),
              const Text("Destino:  ",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
              DropdownButton(
                  value: op2,
                  items: dd,
                  onChanged: (String? X) {
                    setState(() {
                      op2 = X.toString();
                    });
                  }),
            ]),
            TextField(
              controller: txtOrigen,
              decoration: const InputDecoration(
                  labelText: "Moneda Origen", hintText: "0"),
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
            ),
            TextField(
              controller: txtDestino,
              decoration: const InputDecoration(
                  labelText: "Moneda Destino", hintText: "0"),
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
            ),
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                ),
                itemCount: cal.length,
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    color: cal[index].color,
                    child: ListTile(
                      title: Center(
                        child: index > 9
                            ? cal[index].icono
                            : Text(
                                cal[index].titulo,
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 30),
                              ),
                      ),
                      onTap: () {
                        if (index < 10) {
                          txtOrigen.text = txtOrigen.text + cal[index].titulo;
                        } else if (index == 10) {
                          txtOrigen.text = "";
                          txtDestino.text = "";
                        } else {
                          if (op1 == "USD" && op2 == "COP") {
                            txtDestino.text =
                                (double.parse(txtOrigen.text) * 4866)
                                    .toString();
                          } else if (op1 == "COP" && op2 == "USD") {
                            txtDestino.text =
                                (double.parse(txtOrigen.text) / 4866)
                                    .toString();
                          } else if (op1 == "EUR" && op2 == "COP") {
                            txtDestino.text =
                                (double.parse(txtOrigen.text) * 5039)
                                    .toString();
                          } else if (op1 == "COP" && op2 == "EUR") {
                            txtDestino.text =
                                (double.parse(txtOrigen.text) / 5039)
                                    .toString();
                          } else if (op1 == "EUR" && op2 == "USD") {
                            txtDestino.text =
                                (double.parse(txtOrigen.text) * 1.04)
                                    .toString();
                          } else if (op1 == "USD" && op2 == "EUR") {
                            txtDestino.text =
                                (double.parse(txtOrigen.text) / 1.04)
                                    .toString();
                          } else {
                            txtDestino.text = txtOrigen.text;
                          }
                        }
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
