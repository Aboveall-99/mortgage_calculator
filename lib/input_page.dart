

import 'package:flutter/material.dart';
import 'package:mortgage_calculator/results_page.dart';
import 'constants.dart';
import 'customs_widgets.dart';
import 'package:intl/intl.dart';
import 'calculate_mortgage.dart';




class InputPage extends StatefulWidget {
  const InputPage({super.key});

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {

  double price = 80000;
  double downPayment = 16000;
  late double percentage = (downPayment/price) * 100;
  double loanLength = 10;
  double interestRate = 3;

  double num1 =10;
  double num2 =15;
  double num3 =20;
  double num4 =25;
  double num5 =30;





  @override
  Widget build(BuildContext context) {


    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Center(
                  child: Text("Mortgage Calculator",
                      style: kBigText
                  ),
                ),
              ),

              Expanded(
                child: Center(
                  child: Text("Use our Mortgage Calculator to estimate\nyour monthly mortgage payment.",
                    style: kSmallText,
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              Expanded(
                child: Row(
                  children: [
                    Text("Home price",
                      style: kSmallText,
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Tooltip(
                      message: "The price if the property you want to buy.",
                        child: HelpIcon(text: "?",width: 18,height: 18,color: Colors.grey.withValues(alpha: 0.2),),
                    )
                  ],
                ),
              ),
              Expanded(
                child: Text(NumberFormat.currency(symbol: "\$",decimalDigits: 0).format(price),
                  style: kNumberStyle
                ),
              ),
              Expanded(
                child: MortgageSlider(num: price, min: 50000,divisions: 195,max: 2000000,onChanged: (double value){
                  setState(() {
                    price = value;
                    if(price <= downPayment){
                      price = downPayment;
                    }
                  });
                }
                ),
              ),
              Expanded(
                child: Row(
                  children: [
                    Text("Down payment",
                      style: kSmallText,
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Tooltip(
                      message: "The upfront amount you pay towards the home purchase.",
                      child: HelpIcon(text: "?",width: 18,height: 18,color: Colors.grey.withValues(alpha: 0.2),),
                    )
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(NumberFormat.currency(symbol: "\$",decimalDigits: 0).format(downPayment),
                        style: kNumberStyle
                    ),
                    Text(
                      NumberFormat.percentPattern().format(percentage/100),
                      style: kSmallNumberStyle,
                    )

                  ],
                ),
              ),
              Expanded(
                child: MortgageSlider(num: downPayment, min: 0, max: price,divisions: 100, onChanged: (double value){
                  setState(() {
                    downPayment = value;
                    percentage = (downPayment/price) * 100;
                    if(downPayment > price){
                      downPayment = price;
                    }
                  });
                }
                ),
              ),
              Expanded(
                child: Row(
                  children: [
                    Text("Length of loan in years",
                      style: kSmallText,
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Tooltip(
                      message: "How long you will take to pay off the loan.",
                      child: HelpIcon(text: "?",width: 18,height: 18,color: Colors.grey.withValues(alpha: 0.2),),
                    )
                  ],
                ),
              ),
              Expanded(
                child:Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(num1.toStringAsFixed(0),
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: kDefaultColor1,
                        fontFamily: "MonaSans"
                    ),
                    ),
                    Text(num2.toStringAsFixed(0),
                      style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: kDefaultColor2,
                          fontFamily: "MonaSans"
                      ),
                    ),
                    Text(num3.toStringAsFixed(0),
                      style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: kDefaultColor3,
                          fontFamily: "MonaSans"
                      ),
                    ),
                    Text(num4.toStringAsFixed(0),
                      style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: kDefaultColor4,
                          fontFamily: "MonaSans"
                      ),
                    ),
                    Text(num5.toStringAsFixed(0),
                      style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: kDefaultColor5,
                          fontFamily: "MonaSans"
                      ),
                    ),
                  ],
                )
              ),
              Expanded(
                  child: MortgageSlider(num: loanLength, min: 10, max: 30, divisions: 4,onChanged: (double value){
                    setState(() {
                      loanLength = value;
                      if(loanLength == 10.0){
                        kDefaultColor1 = kActiveColor;
                        kDefaultColor2 = kInactiveColor;
                        kDefaultColor3 = kInactiveColor;
                        kDefaultColor4 = kInactiveColor;
                        kDefaultColor5 = kInactiveColor;
                      }
                      else if(loanLength == 15.0){
                        kDefaultColor1 = kInactiveColor;
                        kDefaultColor2 = kActiveColor;
                        kDefaultColor3 = kInactiveColor;
                        kDefaultColor4 = kInactiveColor;
                        kDefaultColor5 = kInactiveColor;
                      }
                      else if(loanLength == 20.0){
                        kDefaultColor1 = kInactiveColor;
                        kDefaultColor2 = kInactiveColor;
                        kDefaultColor3 = kActiveColor;
                        kDefaultColor4 = kInactiveColor;
                        kDefaultColor5 = kInactiveColor;
                      }
                      else if(loanLength == 25.0){
                        kDefaultColor1 = kInactiveColor;
                        kDefaultColor2 = kInactiveColor;
                        kDefaultColor3 = kInactiveColor;
                        kDefaultColor4 = kActiveColor;
                        kDefaultColor5 = kInactiveColor;
                      }
                      else if(loanLength == 30.0){
                        kDefaultColor1 = kInactiveColor;
                        kDefaultColor2 = kInactiveColor;
                        kDefaultColor3 = kInactiveColor;
                        kDefaultColor4 = kInactiveColor;
                        kDefaultColor5 = kActiveColor;
                      }

                    });
                  })
              ),
              Expanded(
                child: Row(
                  children: [
                    Text("Interest rate",
                      style: kSmallText,
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Tooltip(
                      message: "The annual interest rate charged on your mortgage.",
                      child: HelpIcon(text: "?",width: 18,height: 18,color: Colors.grey.withValues(alpha: 0.2),),
                    )
                  ],
                ),
              ),
              Expanded(
                  child:
                  Text(NumberFormat.decimalPercentPattern(decimalDigits: 3).format(interestRate/100),
                  style: kNumberStyle,
                  ),
              ),
              Expanded(
                  child: 
                  MortgageSlider(num: interestRate, max: 10, min: 2, onChanged: (double value){
                    setState(() {
                      interestRate = value;
                    });
                  },
                      divisions: 80)
              ),
              GestureButton(text: "Calculate", onTap: (){
                CalculateMortgage calc = CalculateMortgage(price: price, interestRate: interestRate, loanLength: loanLength, downPayment: downPayment);

                Navigator.push(context, MaterialPageRoute(builder: (context){
                  return ResultsPage(
                    homeInsurance: calc.insurance(),
                    principalAndInterest: calc.calculatePrincipalAndInterest(),
                    monthlyPayments: calc.calculateMonthlyPayments(),
                    propertyTax: calc.propertyTax(),
                  );
                },),);
              },
              )

            ],
          ),
        ),
      ),
    );
  }
}









