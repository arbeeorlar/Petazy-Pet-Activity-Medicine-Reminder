import 'package:flutter/material.dart';

class CategorySelector extends StatefulWidget {
  @override
  _CategorySelector createState() => _CategorySelector();
}

class _CategorySelector extends State<CategorySelector> {
  TextStyle style =
      TextStyle(fontFamily: 'Montserrat', fontSize: 18.0, color: Colors.white);
  int _currentIndex = 0;
  var category = ["Messages", "Online", "Groups", "Requests", "News"];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      child: ListView.builder(
        itemCount: category.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
              onTap: () {
                setState(() {
                  _currentIndex = index;
                });
              },
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 30.0),
                child: Text(
                  category[index],
                  style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 18.0,
                      color: index == _currentIndex
                          ? Colors.white
                          : Colors.white30),
                ),
              ));
        },
      ),
    );
  }
}
