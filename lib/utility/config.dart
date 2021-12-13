import 'package:flutter/material.dart';

class Config {
  static final User steven = User(
    id: 1,
    title: "NexGard Chewables, 10mg",
    description: '1 Tablet, per day',
    timeRange: '12:20 - 01:20',
    time: '12AM',
    color: Colors.blueAccent,
  );
  static final User sam = User(
    id: 2,
    title: "Vet Appointments,for vaccination",
    description: 'Canine Rabies',
    timeRange: '2:00 - 02:50',
    time: '2PM',
    color: Colors.orangeAccent,
  );
  static final User olivia = User(
    id: 3,
    title: "Walk with Tommy",
    description: 'Evening Exercise',
    timeRange: '4.30 - 5:50',
    time: '4PM',
    color: Colors.purpleAccent,
  );

  List<User> favourite = [steven, sam, olivia];
}

class User {
  int id;
  String title;
  String description;
  String timeRange;
  String time;
  Color color;

  User(
      {this.id,
      this.title,
      this.description,
      this.timeRange,
      this.time,
      this.color});
}
