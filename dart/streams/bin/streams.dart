import 'dart:async';

import 'package:streams/streams.dart' as streams;

//Streams are websockets connections

Stream<int> count() async* {
  yield 1;
  yield 2;
  yield 3;
}

Stream<double> balanceUpdates() async* {
  yield 1000.00;

  await Future.delayed(Duration(seconds: 1));
  yield 1250.00;

  await Future.delayed(Duration(seconds: 1));
  yield 900.00;
}

void main() async {
  await for (final value in count()) {
    print(value);
  }

  await for (final value in balanceUpdates()) {
    print('saldo atualizado $value');
  }

  final controller = StreamController<double>();

  final subscription = controller.stream.listen((balance) {
    print('Novo saldo: $balance');
  });

  controller.add(1000.00);
  controller.add(1500.00);
  //subscription.cancel(); we cancel an subscriptions
  controller.add(850.00);

  controller.close();

  final controller2 = StreamController<int>();

  controller2.stream.listen(
    (value) {
      print('Valor: $value');
    },
    onError: (error) {
      print('Erro: $error');
    },
    onDone: () {
      print('Stream finalizada');
    },
  );

  controller2.add(10);
  controller2.addError(Exception('Falha ao processar evento'));
  controller2.add(20);

  controller2.close();

  final numbers = Stream.fromIterable([1, 2, 3]);

  final doubled = numbers.map((number) => number * 2);
}
