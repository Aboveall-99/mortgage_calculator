import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:mortgage_calculator/constants.dart';
import 'package:mortgage_calculator/customs_widgets.dart';
import 'package:intl/intl.dart';


class ResultsPage extends StatefulWidget {
  const ResultsPage({super.key,required this.propertyTax,required this.homeInsurance,required this.monthlyPayments,required this.principalAndInterest});

  final double principalAndInterest;
  final double homeInsurance;
  final double propertyTax;
  final double monthlyPayments;

  @override
  State<ResultsPage> createState() => _ResultsPageState();
}

class _ResultsPageState extends State<ResultsPage> {
  int touchedIndex = -1;
  List<PieChartSectionData> showingSections() {
    return List.generate(3, (i) {
      final isTouched = i == touchedIndex;
      final fontSize = isTouched ? 25.0 : 16.0;
      final radius = isTouched ? 60.0 : 45.0;
      const shadows = [Shadow(color: Colors.black, blurRadius: 2)];
      return switch (i) {
        0 => PieChartSectionData(
          color: Color.fromRGBO(223, 127, 157, 1),
          value: widget.propertyTax,
          title: '',
          radius: radius,
          titleStyle: TextStyle(
            fontSize: fontSize,
            fontWeight: FontWeight.bold,
            color: Colors.black,
            shadows: shadows,
          ),
        ),
        1 => PieChartSectionData(
          color: Color.fromRGBO(115, 216, 157, 1),
          value: widget.homeInsurance,
          title: '',
          radius: radius,
          titleStyle: TextStyle(
            fontSize: fontSize,
            fontWeight: FontWeight.bold,
            color: Colors.black,
            shadows: shadows,
          ),
        ),
        2 => PieChartSectionData(
          color: Color.fromRGBO(77, 104, 245, 1),
          value: widget.principalAndInterest,
          title: '',
          radius: radius,
          titleStyle: TextStyle(
            fontSize: fontSize,
            fontWeight: FontWeight.bold,
            color: Colors.black,
            shadows: shadows,
          ),
        ),

        _ => throw StateError('Invalid'),
      };
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Stack(
        children: [
          Positioned(
            top: -330,
            // left: -130,
            // right: -120,
            width: 650,
            height: 1150,
            child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color.fromRGBO(225, 230, 255, 1),
                    Colors.white,
                  ],
                ),
                shape: BoxShape.circle,
                color: Color.fromRGBO(225, 230, 255, 1),
              ),
            ),
          ),
          Column(
            children: [
              Expanded(
                child: Center(
                  child: Text(
                    "Payment Breakdown",
                    style: kBigText,
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Expanded(
                child: Text(
                  "How is my monthly payment calculated?",
                  style: kSmallText,
                ),
              ),
              AspectRatio(
                aspectRatio: 1.0,
                child: Row(
                  children: [
                    Expanded(
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          PieChart(
                            PieChartData(
                              pieTouchData: PieTouchData(
                                touchCallback:
                                    (FlTouchEvent event, pieTouchResponse) {
                                  setState(() {
                                    if (!event.isInterestedForInteractions ||
                                        pieTouchResponse == null ||
                                        pieTouchResponse.touchedSection ==
                                            null) {
                                      touchedIndex = -1;
                                      return;
                                    }
                                    touchedIndex = pieTouchResponse
                                        .touchedSection!.touchedSectionIndex;
                                  });
                                },
                              ),
                              borderData: FlBorderData(
                                show: false,
                              ),
                              sectionsSpace: 0,
                              centerSpaceRadius: 135,
                              sections: showingSections(),
                            ),
                          ),
                          Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  NumberFormat.currency(
                                          symbol: "\$", decimalDigits: 0)
                                      .format(widget.monthlyPayments),
                                  style: kBigCurrencyNumber,
                                ),
                                Text(
                                  "Monthly Payment",
                                  style: kSmallText,
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      width: 28,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 60,
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    HelpIcon(
                        text: "",
                        height: 22,
                        width: 22,
                        color: Color.fromRGBO(77, 104, 245, 1)),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      "Principal & interest",
                      style: kSmallText,
                    ),
                    const SizedBox(
                      width: 135,
                    ),
                    Text(
                      NumberFormat.currency(symbol: "\$", decimalDigits: 0)
                          .format(widget.principalAndInterest),
                      style: kCurrencyNumber,
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    HelpIcon(
                        text: "",
                        height: 22,
                        width: 22,
                        color: Color.fromRGBO(115, 216, 157, 1)),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      "Homeowners's insurance",
                      style: kSmallText,
                    ),
                    const SizedBox(
                      width: 100,
                    ),
                    Text(
                      NumberFormat.currency(symbol: "\$", decimalDigits: 0)
                          .format(widget.homeInsurance),
                      style: kCurrencyNumber,
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    HelpIcon(
                        text: "",
                        height: 22,
                        width: 22,
                        color: Color.fromRGBO(223, 127, 157, 1)),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      "Property tax",
                      style: kSmallText,
                    ),
                    const SizedBox(
                      width: 190,
                    ),
                    Text(
                      NumberFormat.currency(symbol: "\$", decimalDigits: 0)
                          .format(widget.propertyTax),
                      style: kCurrencyNumber,
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: GestureButton(
                    text: "Recalculate",
                    onTap: () {
                      Navigator.pop(context);
                    }),
              )
            ],
          ),
        ],
      ),
    ));
  }
}











