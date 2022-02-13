import 'dart:io';

import 'calculator.dart';

void main(List<String> args) {
  double number1 = 0, number2 = 0, sum = 0;
  String? temp;
  String islem = '';
  void sonuc(double value) {
    print('Sonuc: $number1 $islem $number2 = $value');
  }

  bool isNumeric(String? s) {
    if (s == null) {
      return false;
    }
    return double.tryParse(s) != null;
  }

  print('============HESAP MAKİNESİ============');

  print('İlk sayıyı giriniz');
  temp = stdin.readLineSync() ?? '';

  if (isNumeric(temp)) {
    number1 = double.parse(temp);
  } else {
    print('Hatalı işlem yaptınız.');
    return;
  }

  print('İşlemi giriniz: +,-,*,/');
  islem = stdin.readLineSync()!;

  print('ikinci sayıyı giriniz:');
  temp = stdin.readLineSync() ?? '';

  if (isNumeric(temp)) {
    number2 = double.parse(temp);
  } else {
    print('Hatalı işlem yaptınız.');
    return;
  }

  final operator = Calculator(number1, number2);
  switch (islem) {
    case '+':
      sum = operator.add(number1, number2);
      sonuc(sum);
      break;
    case '-':
      sum = operator.sub(number1, number2);
      sonuc(sum);
      break;
    case '*':
      sum = operator.mul(number1, number2);
      sonuc(sum);
      break;
    case '/':
      sum = operator.div(number1, number2);
      sonuc(sum);

      break;

    default:
      print('hatalı islem yaptınız');
  }
}
