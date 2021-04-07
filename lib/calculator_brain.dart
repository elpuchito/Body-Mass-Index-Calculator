import 'dart:math';
import 'input_page.dart';

class CalculatorBrain {
  CalculatorBrain({this.height, this.weight});
  final int height;
  final int weight;
  double _bmi = 0;

  String calculateBmi() {
    _bmi = weight / pow(height / 100, 2);

    return _bmi.toStringAsFixed(1);
  }

  String getResult() {
    if (_bmi >= 25) {
      return 'Sobrepeso';
    } else if (_bmi > 18.5) {
      return 'Normal';
    } else {
      return 'Bajo de Peso';
    }
  }

  List hombre = [
    'Eres un gordito hermoso',
    'Tienes un IMC normal, excelente trabajo!',
    'Eres un flaquito hermoso'
  ];
  List mujer = [
    'Eres un gordita hermosa',
    'Tienes un IMC normal, excelente trabajo!',
    'Eres un flaquita hermosa'
  ];

  String getInterpretation() {
    if (_bmi >= 25 && selectedGender == Gender.male) {
      return hombre[0];
    } else if (_bmi >= 18.5 && selectedGender == Gender.male) {
      return hombre[1];
    } else if (_bmi < 18.5 && selectedGender == Gender.male) {
      return hombre[2];
    } else if (_bmi >= 25 && selectedGender == Gender.female) {
      return mujer[0];
    } else if (_bmi >= 18.5 && selectedGender == Gender.female) {
      return mujer[1];
    } else if (_bmi < 18.5 && selectedGender == Gender.female) {
      return mujer[2];
    }
  }
}
