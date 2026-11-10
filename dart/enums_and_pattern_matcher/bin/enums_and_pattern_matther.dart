import 'package:enums_and_pattern_matther/enums_and_pattern_matther.dart'
    as enums_and_pattern_matther;

enum TransactionType {
  income('Receita'),
  expense('Despesa'),
  transfer('Transferência');

  final String label;

  const TransactionType(this.label);

  bool get isIncome => this == TransactionType.income;

  String getLabel(TransactionType type) {
    return switch (type) {
      TransactionType.income => 'Entrada',
      TransactionType.expense => 'Saída',
      TransactionType.transfer => 'Transferência',
    };
  }
}

(String, double) getTransaction() {
  return ('Mercado', 120.50);
}

void process(Object value) {
  switch (value) {
    case int number:
      print('Inteiro: $number');

    case String text:
      print('Texto: $text');

    case double number:
      print('Decimal: $number');

    default:
      print('Tipo desconhecido');
  }
}

void main(List<String> arguments) {
  final type = TransactionType.income;

  if (type == TransactionType.income) {
    print('Receita');
  }

  print(type.label);
  // Erro de compilação

  print(type.isIncome);
  print(type.getLabel(type));

  //Pattern Matching

  process("1");

  //Desconstruction

  (String, double) transaction = ('Mercado', 120.50);

  var (description, amount) = transaction;

  print(description);
  print(amount);

  switch (transaction) {
    case (String description, double amount):
      print('$description: $amount');
  }

  //Record

  final transaction2 = getTransaction();
  print(transaction2.$1);
  print(transaction2.$2);
}
