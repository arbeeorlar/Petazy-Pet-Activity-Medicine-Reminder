import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:teamapt/datelib/flutter_time_picker_spinner.dart';

class AddToDoScreen2 extends StatefulWidget {
  const AddToDoScreen2({Key key}) : super(key: key);

  @override
  _AddToDoScreen2State createState() => _AddToDoScreen2State();
}

class _AddToDoScreen2State extends State<AddToDoScreen2> {
  var scaffoldKey = GlobalKey<ScaffoldState>();
  TextEditingController reminderName = TextEditingController();
  TextEditingController duration = TextEditingController();

  ValueNotifier<int> currentPill = ValueNotifier(0);
  ValueNotifier<String> filterNotifier = ValueNotifier(null);
  int _pillIndex = 0;
  int activeSlide = 0;
  DateTime _dateTime = DateTime.now();
  int counter = 1;

  bool chnageTap = false;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        SafeArea(
          top: false,
          bottom: false,
          child: WillPopScope(
            onWillPop: () async {
              return false;
            },
            child: Scaffold(
              key: scaffoldKey,
              backgroundColor: Color(0xFF0e333d),
              appBar: AppBar(
                backgroundColor: Colors.transparent,
                elevation: 0.0,
                centerTitle: true,
                leading: Builder(
                  builder: (BuildContext context) {
                    return Container(
                      child: Column(
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Container(
                              alignment: Alignment.center,
                              padding: EdgeInsets.all(10),
                              margin: EdgeInsets.only(left: 10),
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: Colors.white60.withOpacity(0.10),
                                      width: 1.0),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10.0))),
                              child: Icon(Icons.arrow_back,
                                  color: Color(0xFFffeb3b)),
                              // child: IconButton(
                              //   icon: Icon(Icons.add),
                              //   color: Colors.black,
                              //   onPressed: controller.moveToAddBeneficiary,
                              // ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
                title: Container(
                    child: Text("Add Reminder",
                        textAlign: TextAlign.center,
                        style:
                            TextStyle(color: Color(0xFFFFD1C1), fontSize: 15))),
                actions: [
                  // SizedBox(height: 50),
                  // Container(
                  //     child: Text("Save",
                  //         textAlign: TextAlign.center,
                  //         style: TextStyle(color: Color(0xFFFFD1C1))))
                ],
              ),
              body: Container(
                color: Color(0xFF0e333d),
                child: Column(
                  children: <Widget>[
                    SizedBox(height: 20),
                    SizedBox(height: 20),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 20.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            alignment: Alignment.center,
                            child: Text(
                              "Add daily Reminder",
                              style: TextStyle(
                                  fontFamily: 'Montserrat',
                                  fontSize: 22.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                          ),
                          SizedBox(height: 5),
                          Text(
                            "Add your schedule",
                            style: TextStyle(
                                fontFamily: 'Montserrat',
                                fontSize: 12.0,
                                fontWeight: FontWeight.normal,
                                color: Colors.blueGrey),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 40),
                    Expanded(
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: Color(0xFFFAFCF9).withOpacity(0.95),
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(30.0),
                                topRight: Radius.circular(30.0))),
                        child: SingleChildScrollView(
                          child: Column(
                            children: <Widget>[
                              SizedBox(height: 25),
                              Container(
                                alignment: Alignment.topLeft,
                                margin: EdgeInsets.only(left: 20),
                                child: Text(
                                  "Medicine Type".toUpperCase(),
                                  style: TextStyle(
                                      fontFamily: 'Montserrat',
                                      fontSize: 13,
                                      fontWeight: FontWeight.bold,
                                      color:
                                          Color(0xFF0e333d).withOpacity(0.40)),
                                ),
                              ),
                              SizedBox(height: 15),
                              Container(
                                alignment: Alignment.topLeft,
                                margin: EdgeInsets.symmetric(horizontal: 20),
                                child: Row(children: <Widget>[
                                  pill(
                                      index: 0,
                                      title: "Vaccine",
                                      icon: Icon(Icons.category,
                                          size: 15,
                                          color: Colors.yellowAccent)),
                                  SizedBox(width: 15),
                                  pill(
                                      index: 1,
                                      title: "Medicine",
                                      icon: Icon(Icons.style,
                                          size: 15, color: Colors.green)),
                                  SizedBox(width: 15),
                                  pill(
                                      index: 2,
                                      title: "Liquid",
                                      icon: Icon(Icons.hourglass_bottom,
                                          size: 15,
                                          color: Colors.deepPurpleAccent)),
                                ]),
                              ),
                              SizedBox(height: 25),
                              Container(
                                alignment: Alignment.topLeft,
                                margin: EdgeInsets.only(left: 20),
                                child: Text(
                                  "REMINDER NAME",
                                  style: TextStyle(
                                      fontFamily: 'Montserrat',
                                      fontSize: 13,
                                      fontWeight: FontWeight.bold,
                                      color:
                                          Color(0xFF0e333d).withOpacity(0.40)),
                                ),
                              ),
                              Row(
                                children: <Widget>[
                                  Expanded(
                                    child: Container(
                                      margin:
                                          EdgeInsets.only(left: 25, right: 25),
                                      child: TextFormField(
                                        controller: reminderName,
                                        showCursor: true,
                                        keyboardType: TextInputType.text,
                                        textInputAction: TextInputAction.next,
                                        autocorrect: false,
                                        textAlign: TextAlign.left,
                                        decoration: InputDecoration(
                                          hintText: "NewGard Chewables",
                                          hintStyle: TextStyle(
                                              fontSize: 14.0,
                                              color: Colors.black45),
                                        ),
                                        style: TextStyle(
                                          fontWeight: FontWeight.normal,
                                          fontSize: 14.0,
                                        ),
                                        inputFormatters: [],
                                        onChanged: (text) {},
                                        onSaved: (String val) {},
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Container(
                                alignment: Alignment.topLeft,
                                margin: EdgeInsets.only(left: 20),
                                child: Text(
                                  "DURATION",
                                  style: TextStyle(
                                      fontFamily: 'Montserrat',
                                      fontSize: 13,
                                      fontWeight: FontWeight.bold,
                                      color:
                                          Color(0xFF0e333d).withOpacity(0.40)),
                                ),
                              ),
                              Row(
                                children: <Widget>[
                                  Expanded(
                                    child: Container(
                                      margin:
                                          EdgeInsets.only(left: 25, right: 25),
                                      child: TextFormField(
                                        controller: duration,
                                        showCursor: true,
                                        keyboardType:
                                            TextInputType.emailAddress,
                                        textInputAction: TextInputAction.next,
                                        autocorrect: false,
                                        textAlign: TextAlign.left,
                                        decoration: InputDecoration(
                                            hintText: "3 Days",
                                            hintStyle: TextStyle(
                                                fontSize: 14.0,
                                                color: Colors.black45),
                                            suffixText: chnageTap == false
                                                ? "Add"
                                                : "Change",
                                            suffixStyle:
                                                TextStyle(color: Colors.green)),
                                        style: TextStyle(
                                          fontWeight: FontWeight.normal,
                                          fontSize: 14.0,
                                        ),
                                        inputFormatters: [],
                                        onChanged: (text) {},
                                        onSaved: (String val) {},
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Container(
                                alignment: Alignment.topLeft,
                                margin: EdgeInsets.only(left: 20),
                                child: Text(
                                  "TIME",
                                  style: TextStyle(
                                      fontFamily: 'Montserrat',
                                      fontSize: 13,
                                      fontWeight: FontWeight.bold,
                                      color:
                                          Color(0xFF0e333d).withOpacity(0.40)),
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  showSuccessDialog1(context);
                                },
                                child: Container(
                                  height: 50,
                                  margin: EdgeInsets.only(left: 25, right: 25),
                                  decoration: BoxDecoration(
                                    //color: Colors.grey.shade200,
                                    // borderRadius:
                                    // BorderRadius.circular(20.0),
                                    border: Border(
                                      bottom: BorderSide(
                                          style: BorderStyle.solid,
                                          width: 1.0,
                                          color: Colors.grey.withOpacity(0.40)),
                                    ),
                                  ),
                                  padding: EdgeInsets.symmetric(horizontal: 15),
                                  child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        Expanded(
                                          child: Text(
                                            "00:00 AM",
                                            textAlign: TextAlign.left,
                                            //"\u20A623,000",
                                            style: TextStyle(
                                                fontWeight: FontWeight.normal,
                                                fontSize: 14.0,
                                                fontFamily: 'Source Sans Pro'),
                                          ),
                                        ),
                                        InkWell(
                                            onTap: () async {},
                                            child: Text(
                                              "Change",
                                              style: TextStyle(
                                                  color: Colors.green),
                                            )),
                                      ]),
                                ),
                              ),
                              // Row(
                              //   children: <Widget>[
                              //     Expanded(
                              //       child: Container(
                              //         margin:
                              //             EdgeInsets.only(left: 25, right: 25),
                              //         child: TextFormField(
                              //           controller: duration,
                              //           showCursor: true,
                              //           keyboardType:
                              //               TextInputType.emailAddress,
                              //           textInputAction: TextInputAction.next,
                              //           autocorrect: false,
                              //           textAlign: TextAlign.left,
                              //           decoration: InputDecoration(
                              //               hintText: "00:00 AM",
                              //               hintStyle: TextStyle(
                              //                   fontSize: 14.0,
                              //                   color: Colors.black45),
                              //               suffixText: chnageTap == false
                              //                   ? "Add"
                              //                   : "Change",
                              //               suffixStyle:
                              //                   TextStyle(color: Colors.green)),
                              //           style: TextStyle(
                              //             fontWeight: FontWeight.normal,
                              //             fontSize: 14.0,
                              //           ),
                              //           inputFormatters: [],
                              //           onChanged: (text) {},
                              //           onSaved: (String val) {},
                              //         ),
                              //       ),
                              //     ),
                              //   ],
                              // ),
                              SizedBox(
                                height: 20,
                              ),
                              Container(
                                alignment: Alignment.topLeft,
                                margin: EdgeInsets.only(left: 20),
                                child: Text(
                                  "AMOUNT",
                                  style: TextStyle(
                                      fontFamily: 'Montserrat',
                                      fontSize: 13,
                                      fontWeight: FontWeight.bold,
                                      color:
                                          Color(0xFF0e333d).withOpacity(0.40)),
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Container(
                                margin: EdgeInsets.only(left: 20),
                                child: Row(children: <Widget>[
                                  InkWell(
                                    onTap: () {
                                      if (counter == 1) {
                                        return;
                                      }
                                      if (counter >= 1) {
                                        setState(() {
                                          --counter;
                                        });
                                      } else {
                                        setState(() {
                                          counter = 1;
                                        });
                                      }
                                    },
                                    child: Container(
                                        height: 50,
                                        width: 50,
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(50.0)),
                                            border: Border.all(
                                                color: Colors.grey,
                                                width: 0.50)),
                                        child: Icon(Icons.remove,
                                            size: 20, color: Colors.black)),
                                  ),
                                  SizedBox(width: 20),
                                  Container(
                                    alignment: Alignment.center,
                                    child: Text(
                                      "$counter Pills",
                                      style: TextStyle(
                                          fontFamily: 'Montserrat',
                                          fontSize: 13,
                                          fontWeight: FontWeight.bold,
                                          color: Color(0xFF0e333d)
                                              .withOpacity(0.40)),
                                    ),
                                  ),
                                  SizedBox(width: 20),
                                  InkWell(
                                    onTap: () {
                                      if (counter >= 1) {
                                        setState(() {
                                          ++counter;
                                        });
                                      } else {
                                        setState(() {
                                          counter = 1;
                                        });
                                      }
                                    },
                                    child: Container(
                                        height: 50,
                                        width: 50,
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(50.0)),
                                            border: Border.all(
                                                color: Colors.grey,
                                                width: 0.50)),
                                        child: Icon(Icons.add,
                                            size: 20, color: Colors.black)),
                                  ),
                                ]),
                              ),
                              SizedBox(height: 30),
                              Container(
                                margin: EdgeInsets.only(
                                    left: 30.0, right: 30.0, top: 0.0),
                                child: SizedBox(
                                  width: double.infinity,
                                  child: RaisedButton(
                                    shape: new RoundedRectangleBorder(
                                        borderRadius:
                                            new BorderRadius.circular(15.0)),
                                    color: Color(0xFFFFD1C1),
                                    onPressed: () async {
                                      AwesomeDialog(
                                        context: context,
                                        animType: AnimType.SCALE,
                                        dialogType: DialogType.INFO,
                                        // body: Container(
                                        //   child: Text(
                                        //     'If the body is specified, then title and description will be ignored, this allows to further customize the dialogue.',
                                        //     style: TextStyle(
                                        //         fontStyle: FontStyle.normal),
                                        //   ),
                                        // ),
                                        title: 'Pill added Successfully',
                                        desc:
                                            'You pill added successfully. Thanks for using our service',
                                      )..show();
                                    },
                                    elevation: 0,
                                    child: Text(
                                      "Add",
                                      style: TextStyle(color: Colors.black),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),

//              body: PageStorage(bucket: pageStorageBucket, child: _children[_currentIndex]),
            ),
          ),
        ),
      ],
    );
  }

  showSuccessDialog1(BuildContext context, {String buttonText = "DONE"}) {
    SuccessDialog.show(
      context,
      successDialogContent(buttonText: buttonText),
      barrierDismissible: false,
    );
  }

  Widget successDialogContent({String buttonText = "DONE"}) {
    return Container(
      height: 300,
      padding: EdgeInsets.only(top: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          TimePickerSpinner(
            is24HourMode: false,
            onTimeChange: (time) {
              setState(() {
                _dateTime = time;
              });
            },
          ),
          Container(
            width: double.infinity,
            height: 38,
            margin: EdgeInsets.only(top: 30, bottom: 20, left: 30, right: 30),
            child: RaisedButton(
              shape: new RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(15.0)),
              color: Color(0xFFFFD1C1),
              onPressed: () async {
                Navigator.pop(context, _dateTime);
              },
              elevation: 0,
              child: Text("$buttonText"),
            ),
          ),
        ],
      ),
    );
  }

  Widget pill({int index, String title, Icon icon, VoidCallback onPressed}) {
    return Container(
      height: 70,
      width: 60,
      child: RaisedButton(
        onPressed: onPressed ??
            () {
              setState(() {
                _pillIndex = index;
              });
            },
        elevation: 0,
        color: _pillIndex == index ? Colors.white : Colors.white,
        //textColor: _pillIndex == index ? Colors.white : PoColors.blackText,
        padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          side: BorderSide(
              color: _pillIndex == index
                  ? Color(0xFFFFD1C1)
                  : Colors.white60.withOpacity(0.10)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            icon,
            SizedBox(height: 5),
            Text(
              title,
              style: TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SuccessDialog extends StatefulWidget {
  final Widget child;

  SuccessDialog(this.child);

  @override
  State<StatefulWidget> createState() => _SuccessDialog();

  static Future<void> show(BuildContext context, Widget child,
      {bool barrierDismissible = true}) async {
    return await showDialog(
        context: context,
        builder: (context) {
          return SuccessDialog(child);
        },
        barrierDismissible: barrierDismissible);

    /*await showGeneralDialog(context: context, pageBuilder: (context, anim, secondaryAnim) {
      return Container(child: Text("Be Like I will display as a card view, That will be very long and will make all things available for all"),);
    });*/
  }
}

class _SuccessDialog extends State<SuccessDialog> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: widget.child,
    );

    /*return  Material(
      child: ,
    );*/
  }
}
