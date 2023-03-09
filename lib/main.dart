import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

void main() => runApp(const App());

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      home: Home(),
    );
  }
}

Stream<int> getNumbers() async* {
  for (var i = 1; i <= 3; i++) {
    yield i;
    //imprime numeros del 1 al 3 con 3 segundo de demora
    await Future.delayed(const Duration(seconds: 3));
  }
}

class HomeModel {
  final StreamController<int> _numbersCtrl = StreamController<int>.broadcast();
  Stream<int> get outNumbers => _numbersCtrl.stream;
  Sink<int> get inNumbers => _numbersCtrl.sink;
  void dispose() {
    _numbersCtrl.close();
  }
}

class Home extends StatelessWidget {
  Home({super.key});
  final model = HomeModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[Widget1(model: model), Widget2(model: model)],
        ),
      ),
    );
  }
}

class Widget1 extends StatelessWidget {
  const Widget1({super.key, required this.model});
  final HomeModel model;
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<int>(
      stream: model.outNumbers,
      builder: (context, snapshot) {
        return Text(
          snapshot.hasData ? snapshot.data.toString() : 'No hay data',
          style: const TextStyle(fontSize: 50),
        );
      },
    );
  }
}

class Widget2 extends StatelessWidget {
  const Widget2({super.key, required this.model});
  final HomeModel model;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: () {
        model.inNumbers.add(Random().nextInt(20000));
      },
      color: Colors.red,
      child: const Text('click'),
    );
  }
}
