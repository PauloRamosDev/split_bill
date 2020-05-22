import 'package:flutter/material.dart';

class PercentCount extends StatelessWidget {
  final Function(int) percentSelected;
  final List<int> listPercent;
  final int percentCurrect;

  PercentCount(this.percentCurrect, this.listPercent, this.percentSelected);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      mainAxisSize: MainAxisSize.max,
      children: List.generate(
          listPercent.length,
          (index) => GestureDetector(
                onTap: () => percentSelected(listPercent[index]),
                child: AnimatedContainer(
                  duration: Duration(milliseconds: 800),
                  decoration: BoxDecoration(
                      color: percentCurrect != listPercent[index]
                          ? Colors.grey.shade300
                          : Colors.green,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                          color: percentCurrect != listPercent[index]
                              ? Colors.grey.shade300
                              : Colors.green,
                          width: 2)),
                  height: 50,
                  width: 70,
                  child: Center(
                      child: Text(
                    " ${listPercent[index]} %",
                    style: TextStyle(
                        color: percentCurrect != listPercent[index]
                            ? Colors.grey.shade500
                            : Colors.white),
                  )),
                ),
              )),
    );
  }
}
