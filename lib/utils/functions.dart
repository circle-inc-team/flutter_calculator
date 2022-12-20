import '../constants/operation_list.dart';

bool disableOperation({
  required String value,
  required String operation,
}) {
  return operation.isNotEmpty && operationList.contains(value);
}

bool shouldCaluculate({
  required String prev,
  required String next,
  required String operation,
  required String value,
}) {
  return prev.isNotEmpty &&
      next.isNotEmpty &&
      operation.isNotEmpty &&
      value == '=';
}

double calculate({
  required String prev,
  required String next,
  required String operation,
}) {
  switch (operation) {
    case '+':
      return double.parse(prev) + double.parse(next);
    case '-':
      return double.parse(prev) - double.parse(next);
    case 'x':
      return double.parse(prev) * double.parse(next);
    case '÷':
      return double.parse(prev) / double.parse(next);
    default:
      throw Exception('Invalid operation');
  }
}
