import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:teamapt/datelib/date_picker_timeline.dart';
import 'package:teamapt/screen/AddToDoScreen2.dart';
import 'package:teamapt/utility/config.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  DatePickerController _controller = DatePickerController();
  DateTime _selectedValue = DateTime.now();

  TextStyle style = TextStyle(
      fontFamily: 'Montserrat',
      fontSize: 15.0,
      fontWeight: FontWeight.normal,
      letterSpacing: 1.0,
      color: Colors.blueGrey);
  Config config = new Config();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFF0e333d),
      child: Column(
        children: <Widget>[
          SizedBox(height: 20),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "Today",
                  style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 15.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                Text(
                  "${DateFormat.yMMMMd('en_US').format(DateTime.now())}",
                  style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 12.0,
                      fontWeight: FontWeight.normal,
                      color: Colors.blueGrey),
                ),
              ],
            ),
          ),
          SizedBox(height: 10),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20.0),
            child: DatePicker(
              DateTime.now(),
              width: 60,
              height: 120,
              controller: _controller,
              dateTextStyle: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.bold),
              initialSelectedDate: DateTime.now(),
              selectionColor: Color(0xFFFFD1C1),
              selectedTextColor: Colors.black,
              inactiveDates: [
                // DateTime.now().add(Duration(days: 3)),
                // DateTime.now().add(Duration(days: 4)),
                // DateTime.now().add(Duration(days: 7))
              ],
              onDateChange: (date) {
                // New date selected
                setState(() {
                  _selectedValue = date;
                });
              },
            ),
          ),
          SizedBox(height: 20),

          //  static Color primary = Color(0xFF61297f);
          //  static Color primary_yellow = Color(0xFFdfa226);
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                  color: Color(0xFFFAFCF9).withOpacity(0.95),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30.0),
                      topRight: Radius.circular(30.0))),
              child: Column(
                children: <Widget>[
                  SizedBox(height: 20),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          "To Take",
                          style: TextStyle(
                              fontFamily: 'Montserrat',
                              fontSize: 15.0,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1.0,
                              color: Color(0xFF0e333d)),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => AddToDoScreen2()));
                          },
                          child: Row(
                            children: [
                              Icon(Icons.add, size: 15, color: Colors.green),
                              Text(
                                "Add",
                                style: TextStyle(
                                    fontFamily: 'Montserrat',
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 1.0,
                                    color: Colors.green),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      padding: EdgeInsets.only(left: 10.0),
                      itemCount: config.favourite.length,
                      scrollDirection: Axis.vertical,
                      itemBuilder: (BuildContext context, int index) {
                        return buildItemSelector(context,
                            user: config.favourite[index]);
                      },
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget buildItemSelector(BuildContext context, {User user}) {
    return InkWell(
      onTap: () {},
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        // height: 66,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              alignment: Alignment.topLeft,
              child: Text("${user.time}"),
            ),
            SizedBox(width: 20),
            Expanded(
              child: Container(
                alignment: Alignment.topCenter,
                padding: EdgeInsets.only(top: 2, bottom: 2, left: 5, right: 2),
                decoration: BoxDecoration(
                    color: user.color, //Color(0xFFFAFCF9).withOpacity(0.95),
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(10.0),
                        bottomRight: Radius.circular(10.0),
                        topLeft: Radius.circular(10.0),
                        topRight: Radius.circular(10.0))),
                child: Container(
                  //height: 90,
                  decoration: BoxDecoration(
                      color: Colors.white, //Color(0x)
                      borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(10.0),
                          topRight: Radius.circular(10.0))),
                  padding: EdgeInsets.all(10),
                  alignment: Alignment.center,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      Container(
                        alignment: Alignment.centerLeft,
                        child: Text("${user.title}",
                            textAlign: TextAlign.left,
                            style: TextStyle(fontWeight: FontWeight.w700)),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Container(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "${user.description} ",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              fontWeight: FontWeight.normal, fontSize: 11),
                        ),
                      ),
                      SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Row(
                            children: [
                              Icon(Icons.access_time_outlined, size: 15),
                              Text(
                                "${user.timeRange}",
                                style: TextStyle(
                                  fontFamily: 'Montserrat',
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                            ],
                          ),
                          Icon(
                            Icons.notification_important_outlined,
                            size: 15,
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
