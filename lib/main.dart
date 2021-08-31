import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Residencial Avenida',
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Residencial Avenida'),
      ),
      body: appBody(context),
    );
  }

  Column appBody(BuildContext context) {
    return Column(
      children: <Widget>[
        appBodyTitle(),
        appBodyImages(),
        appBodyButtons(context),
      ],
    );
  }

  Container appBodyTitle() {
    return Container(
      padding: EdgeInsets.all(16),
      color: Colors.white,
      child: Center(
        child: Text(
          'Visita online',
          style: TextStyle(
            fontSize: 24,
            color: Colors.blue,
            fontWeight: FontWeight.bold,
            fontStyle: FontStyle.italic,
          ),
        ),
      ),
    );
  }

  Container appBodyImages() {
    return Container(
      padding: EdgeInsets.all(16),
      height: 280,
      child: PageView(
        children: <Widget>[
          appBodyImage("images/avenida.jpg"),
          appBodyImage("images/salao.jpg"),
          appBodyImage("images/piscina.jpeg"),
          appBodyImage("images/play.jpg"),
        ],
      ),
    );
  }

  Image appBodyImage(String path) {
    return Image.asset(
      path,
      fit: BoxFit.contain,
    );
  }

  Column appBodyButtons(BuildContext context) {
    return Column(
      children: <Widget>[
        appBodyButton("Veja as Plantas dos Aptos", mostraPlantas, context),
        SizedBox(
          height: 10,
        ),
        appBodyButton("Opções de Financiamento", mostraFinanciamento, context),
        SizedBox(
          height: 10,
        ),
        appBodyButton("Registre o seu Interesse", registreInteresse, context),
      ],
    );
  }

  ElevatedButton appBodyButton(String texto, Function telaNav, BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: Colors.orange, // background
        onPrimary: Colors.white, // foreground
      ),
      onPressed: () {
        telaNav(context);
      },
      child: Text(
        texto,
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  void mostraPlantas(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => PlantasRoute()),
    );
  }

  void mostraFinanciamento(BuildContext context) {
    print("Financiamento");
  }

  void registreInteresse(BuildContext context) {
    print("Interessado");
  }
}

class PlantasRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Plantas dos Aptos de 2 dorms."),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // Navigate back to first route when tapped.
            Navigator.pop(context);
          },
          child: Text('Voltar'),
        ),
      ),
    );
  }
}
