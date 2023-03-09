//creacion del stream
Stream<int> getNumbers() async* {
  for (var i = 1; i <= 3; i++) {
    yield i;
    //imprime numeros del 1 al 3 con 1 segundo de demora
    await Future.delayed(const Duration(seconds: 1));
  }
}

Stream<int> getNumbersException() async* {
  for (var i = 1; i <= 3; i++) {
    yield i;
    //imprime numeros del 1 al 3 con 1 segundo de demora
    await Future.delayed(const Duration(seconds: 1));
    if (i == 2) {
      //cuando llega al 2 imprime una excepcion
      throw Exception();
    }
  }
}

void main() {
  // listen();
  // awaitFor();
  // isEmpty();
  // first();
  // last();
  // length();
  // lastWhere();
  // single();
  // any();
  // contains();
  // elementAt();
  // firstWhere();
  // join();
  singleWhere();
}

void listen() async {
  //suscripcion al stream
  // getNumbers().listen(print);

  /*-------------Salida: -------------- */
  /*-------------1 -------------- */
  /*-------------2 -------------- */
  /*-------------3 -------------- */

  //   var sum = 0;
  // getNumbers().listen((event) {
  //   //acumulador
  //   sum += event;
  // }).onDone(() {
  //   print(sum);
  // });

  /*-------------Salida: 6 -------------- */

  // getNumbersException()
  //     .listen(print)
  //     .onError((err) => print('ocurrio un error'));

  /*-------------Salida: -------------- */
  /*-------------1 -------------- */
  /*-------------2 -------------- */
  /*-------------ocurrio un error -------------- */
}

void awaitFor() async {
  var sum = 0;
  await for (var number in getNumbers()) {
    sum += number;
    print(number);
  }
  print(sum);
  /*-------------Salida: -------------- */
  /*-------------1 -------------- */
  /*-------------2 -------------- */
  /*-------------3 -------------- */
  /*-------------6 -------------- */
}

void isEmpty() async {
  if (await getNumbers().isEmpty) {
    print("stream is empty");
  } else {
    print("stream is not empty");
  }
  /*-------------Salida: -------------- */
  /*-------------en caso de que en la funcion getNumbers() [yield i;] este descomentado la salida seria: -------------- */
  /*-------------stream is not empty -------------- */
  /*-------------en caso de que en la funcion getNumbers() [yield i;] este comentado la salida seria: -------------- */
  /*-------------stream is empty -------------- */
}

void first() async {
  print(await getNumbers().first);
  /*-------------Salida: -------------- */
  /*-------------1 -------------- */
}

void last() async {
  print(await getNumbers().last);
  /*-------------Salida: -------------- */
  /*-------------3-------------- */
}

void length() async {
  print(await getNumbers().length);
  /*-------------Salida: -------------- */
  /*-------------3-------------- */
}

void lastWhere() async {
  print(await getNumbers().lastWhere((i) => i > 1));
  /*-------------Salida: -------------- */
  /*-------------3-------------- */
}

void single() async {
  print(await getNumbers().single);
  /*-------------Salida:  si poner yield 1; antes del for en la funcion getNumbers()-------------- */
  /*------------ 1--------------- */
}

void any() async {
  if (await getNumbers().any((i) => i == 3)) {
    print('este es el numero 3');
  } else {
    print('este no es el numero 3');
  }
  /*-------------Salida: -------------- */
  /*-------------este es el numero 3-------------- */
}

void contains() async {
  if (await getNumbers().contains(3)) {
    print('contiene el numero 3');
  } else {
    print('no contiene el numero 3');
  }
  /*-------------Salida: -------------- */
  /*-------------este es el numero 3-------------- */
}

void elementAt() async {
  print(await getNumbers().elementAt(2));
  /*-------------Salida: -------------- */
  /*-------------3-------------- */
  /*-------------esto seria lo mismo que tener una lista de numeros y buscar en la posicion 2-------------- */
  /*------------- milista[2] -------------- */
}

void firstWhere() async {
  print(await getNumbers().firstWhere((i) => i > 1));
  /*-------------Salida: -------------- */
  /*-------------2-------------- */
}

void singleWhere() async {
  print(await getNumbers().singleWhere((i) => i <= 1));
  /*-------------Salida: -------------- */
  /*-------------1-------------- */
}
