import 'dart:math';

class Calculator{
  final int height,weight;
  double _bmi;
  Calculator(this.height,this.weight);

  String  calculatorBMI(){
    _bmi=weight/pow(height/100,2);
    return _bmi.toStringAsFixed(1);
  }

  String result(){
    if(_bmi>=25){
      return 'Overweight';
    }
    else if(_bmi<18){
      return 'Underweight';
    }
    else{
      return 'Normal';
    }
  }

  String getInterpretation(){
    if(_bmi>=25){
      return 'You have a higher than normal body weight. Try to exercise more';
    }
    else if(_bmi<18){
      return 'You have lower than normal body weight. You can eat a bit more';
    }
    else{
      return 'You have a normal body weight. Good job!';
    }
  }
}

