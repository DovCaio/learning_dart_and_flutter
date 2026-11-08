import 'package:advanced_leasons/advanced_leasons.dart' as advanced_leasons;

void main(List<String> arguments) {
  //Nullable types

  String? name;

  name = "caio";
  name = null;

  print(name?.toLowerCase());

  String displayName = name ?? "Nome do usuário"; //Null-coalescing operator

  print(displayName);

  name ??= "Caio"; //Null-aware assignment - if the variable has value then nothing is done, otherwise the value is assingmented
  print(name);

  name = "Caio";

  print(
    name!.toLowerCase(),
  ); //Null assertion operator - aware the compilator that name have a a value
}
