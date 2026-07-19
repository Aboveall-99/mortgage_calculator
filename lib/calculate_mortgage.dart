import 'dart:math';


class CalculateMortgage {
  double price;
  double loanLength ;
  double interestRate;
  double downPayment;
  CalculateMortgage({required this.price,required this.interestRate,required this.loanLength,required this.downPayment});


  double loanAmount = 0 ;
  double monthlyInterestRate = 0;
  double totalMonthlyPayments = 0;
  double insuranceRate = 0.5;
  double taxRate = 1.2;


  double calculatePrincipalAndInterest(){
    loanAmount = price - downPayment;
    monthlyInterestRate = (interestRate/100)/12;
    totalMonthlyPayments = loanLength * 12;

    double numerator =monthlyInterestRate * pow((1 + monthlyInterestRate), totalMonthlyPayments);
    double denominator = pow((1 + monthlyInterestRate),totalMonthlyPayments) - 1;
    double result = (numerator / denominator) * loanAmount;
    return result;
  }
  double insurance(){
    double result = ((price * insuranceRate)/100)/12;
    return result;
  }
  double propertyTax(){
    double result = ((price * taxRate)/100)/12;
    return result;
  }
  double calculateMonthlyPayments(){
    double result = insurance() + propertyTax() + calculatePrincipalAndInterest();
    return result;
  }
}

