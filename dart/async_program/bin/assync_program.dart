import 'dart:async';
import 'dart:isolate';

import 'package:assync_program/assync_program.dart' as assync_program;

Future<String> fetchUser() {
  return Future.delayed(Duration(seconds: 2), () => 'Caio');
}

Future<String> fetchUser2() async {
  await Future.delayed(Duration(seconds: 2));

  return 'Caio';
}

Future<String> loadData() {
  final completer = Completer<String>();

  Future.delayed(Duration(seconds: 2), () {
    completer.complete('Dados carregados');
  });

  return completer.future;
}

FutureOr<String> getValue(bool async) {
  //Return string or Future
  if (async) {
    return Future.value('Assíncrono');
  }

  return 'Síncrono';
}

int calculateTotal(List<int> values) {
  return values.fold(0, (total, value) => total + value);
}

Future<void> main() async {
  print('Buscando usuário...');

  final user = await fetchUser();

  print('Usuário: $user');

  print('A');

  Future(() => print('B'));

  Future.microtask(() => print('C'));

  print('D');

  fetchUser()
      .then((user) {
        print('Usuário: $user');
      })
      .catchError((error) {
        print('Erro: $error');
      })
      .whenComplete(() {
        print('Finalizado');
      });

  final values = List.generate(1000000, (i) => i);

  final result = await Isolate.run(
    () => calculateTotal(values),
  ); //This Isolate is a paralel execution

  print(result);
}
//dart does not still stucked awaiting the execution of the future objects, the another lines gonna be executeds
