/// ***
/// This class consists of the DateWidget that is used in the ListView.builder
///
/// Author: Vivek Kaushik <me@vivekkasuhik.com>
/// github: https://github.com/iamvivekkaushik/
/// ***
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'gestures/tap.dart';

class DateWidget extends StatelessWidget {
  final double width;
  final DateTime date;
  final TextStyle monthTextStyle, dayTextStyle, dateTextStyle;
  final Color selectionColor;
  final DateSelectionCallback onDateSelected;
  final String locale;

  DateWidget({
    this.date,
    this.monthTextStyle,
    this.dayTextStyle,
    this.dateTextStyle,
    this.selectionColor,
    this.width,
    this.onDateSelected,
    this.locale,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Column(
        children: [
          Container(
            width: 50,
            height: 70,
            margin: EdgeInsets.all(6.0),
            padding: EdgeInsets.all(3),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20.0)),
                color: selectionColor,
                border: Border.all(
                    color: Colors.white60.withOpacity(0.10), width: 0.50)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                // Text(
                //     new DateFormat("MMM", locale)
                //         .format(date)
                //         .toUpperCase(), // Month
                //     style: monthTextStyle),
                Text(
                    new DateFormat("E", locale)
                        .format(date)
                        .toUpperCase(), // WeekDay
                    style: TextStyle(color: Colors.grey, fontSize: 12)),
                SizedBox(height: 5),
                Text(date.day.toString(), // Date
                    style: dateTextStyle),
                SizedBox(height: 5),
              ],
            ),
          ),
          Row(
            children: <Widget>[
              Container(
                height: 5,
                width: 5,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(8.0)),
                  color: Colors.grey,
                ),
              ),
              SizedBox(width: 5),
              Container(
                height: 5,
                width: 5,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(8.0)),
                  color: Color(0xFFFFD1C1).withOpacity(0.95),
                ),
              ),
              SizedBox(width: 5),
              Container(
                height: 5,
                width: 5,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(8.0)),
                  color: Colors.grey,
                ),
              ),
            ],
          )
        ],
      ),
      onTap: () {
        // Check if onDateSelected is not null
        if (onDateSelected != null) {
          // Call the onDateSelected Function
          onDateSelected(this.date);
        }
      },
    );
  }
}
