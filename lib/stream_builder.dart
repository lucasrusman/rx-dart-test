import 'dart:async';

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
      home: const Home(),
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

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: StreamBuilder<int>(
            stream: getNumbers().map((event) => event * 10),
            builder: (context, snapshot) {
              return Text(
                snapshot.hasData ? snapshot.data.toString() : 'No hay data',
                style: const TextStyle(fontSize: 50),
              );
            }),
      ),
    );
  }
}
