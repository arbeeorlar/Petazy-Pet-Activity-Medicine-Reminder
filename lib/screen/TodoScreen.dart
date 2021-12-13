import 'package:flutter/material.dart';

import 'AddTodoScreen.dart';

class TodoScreen extends StatefulWidget {
  @override
  _TodoScreenState createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
  var scaffoldKey = GlobalKey<ScaffoldState>();

  GlobalKey key = GlobalKey();
  int _currentIndex = 0;
  int _selectedIndex = 0;

  // Bottom Nav Tap Click
  onTapClickEvent(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  List<Widget> _children2 = [HomeScreen()];
  var icon = [
    Icons.home,
    Icons.wallet_travel,
    Icons.stream,
    Icons.recommend,
    Icons.person_outline,
  ];

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
                          Container(
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
                        ],
                      ),
                    );
                  },
                ),
                title: Container(
                    child: Text("Petazy Shop",
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Color(0xFFFFD1C1)))),
              ),
              bottomNavigationBar: bottomNavigationBar(_currentIndex),
              body: Stack(
                children: [
                  IndexedStack(
                    index: _currentIndex,
                    children: _children2,
                  ),
                ],
              ),

//              body: PageStorage(bucket: pageStorageBucket, child: _children[_currentIndex]),
            ),
          ),
        ),
      ],
    );
  }

  Widget bottomNavigationBar(int index) {
    return BottomNavigationBar(
      backgroundColor: Color(0xFF0e333d),
      type: BottomNavigationBarType.fixed,
      currentIndex: index,
      onTap: onTapClickEvent,
      selectedIconTheme: IconThemeData(
        color: Colors.white,
      ),
      showUnselectedLabels: false,
      showSelectedLabels: false,
      unselectedItemColor: Colors.white12,
      selectedItemColor: Colors.white,
      items: [
        BottomNavigationBarItem(
          icon: Container(
            margin: EdgeInsets.only(bottom: 7),
            child: Container(
              height: 15,
              width: 20,
              child: IconButton(
                icon: Icon(
                  icon[0],
                  color: index == 0 ? Colors.white : Colors.white12,
                ),
                // color: Colors.white,
                onPressed: () {},
              ),
            ),
          ),
          label: "",
        ),
        BottomNavigationBarItem(
            icon: Container(
              margin: EdgeInsets.only(bottom: 7),
              child: Container(
                  height: 15,
                  width: 20,
                  child: IconButton(
                    icon: Icon(
                      icon[1],
                      color: index == 1 ? Colors.white : Colors.white12,
                    ),
                    // color: Colors.white,
                    onPressed: () {},
                  )),
            ),
            label: "Transact"),
        BottomNavigationBarItem(
          icon: Container(
            margin: EdgeInsets.only(bottom: 7),
            child: Container(
              height: 15,
              width: 20,
              child: IconButton(
                icon: Icon(
                  icon[2],
                  color: index == 2 ? Colors.white : Colors.white12,
                ),
                // color: Colors.white,
                onPressed: () {},
              ),
            ),
          ),
          label: "",
        ),
        BottomNavigationBarItem(
          icon: Container(
              margin: EdgeInsets.only(bottom: 7),
              child: Container(
                height: 15,
                width: 20,
                child: IconButton(
                  icon: Icon(
                    icon[3],
                    color: index == 3 ? Colors.white : Colors.white12,
                  ),
                  // color: Colors.white,
                  onPressed: () {},
                ),
              )),
          label: "",
        ),
        BottomNavigationBarItem(
          icon: Container(
              margin: EdgeInsets.only(bottom: 7),
              child: Container(
                height: 15,
                width: 20,
                child: IconButton(
                  icon: Icon(
                    icon[4],
                    color: index == 4 ? Colors.white : Colors.white12,
                  ),
                  // color: Colors.white,
                  onPressed: () {},
                ),
              )),
          label: "",
        ),

        // BottomNavigationBarItem(
        //   icon: new Image.asset(
        //     "images/icons/home.png",
        //     width: 18,
        //     height: 18,
        //     color: index == 0 ? Colors.white : Colors.white12,
        //   ),
        //   title: Text(
        //     'Home',
        //     style: TextStyle(fontSize: 14, fontFamily: 'Source Sans Pro'),
        //   ),
        // ),
        // BottomNavigationBarItem(
        //     icon: new Image.asset(
        //       "images/icons/transfer.png",
        //       width: 18,
        //       height: 18,
        //       color: index == 1 ? Colors.white : Colors.white12,
        //     ),
        //     title: Text('Transfer',
        //         style: TextStyle(fontSize: 14, fontFamily: 'Source Sans Pro'))),
        // BottomNavigationBarItem(
        //     icon: new Image.asset(
        //       "images/icons/bill.png",
        //       width: 18,
        //       height: 18,
        //       color: index == 2 ? Colors.white : Colors.white12,
        //     ),
        //     title: Text('Bills',
        //         style: TextStyle(fontSize: 14, fontFamily: 'Source Sans Pro'))),
        // BottomNavigationBarItem(
        //     icon: new Image.asset(
        //       "images/e_naira_cbn.png",
        //       width: 25,
        //       height: 25,
        //       color: index == 3 ? Colors.white : Colors.white12,
        //       //color: PoColors.blackText.withOpacity(0.40),
        //     ),
        //     title: Text('eNaira',
        //         style: TextStyle(fontSize: 14, fontFamily: 'Source Sans Pro'))),
      ],
    );
  }

  AppBar appbarButton() {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0.0,
      leading: Builder(
        builder: (BuildContext context) {
          return Container(
            margin: EdgeInsets.only(left: 13),
            height: 15,
            width: 15,
            child: Transform.scale(
              scale: 1,
              child: IconButton(
                icon: Icon(Icons.arrow_back),
                color: Colors.black,
                onPressed: () {},
              ),
            ),
          ); //
        },
      ),
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.notifications),
          color: Colors.black,
          onPressed: () {},
        ),
      ],
    );
  }
}
