import 'package:flutter/material.dart';

class Meeting {
  Meeting(
      {@required this.from,
      @required this.to,
      this.background = Colors.green,
      this.isAllDay = false,
      this.eventName = '',
      this.startTimeZone = '',
      this.endTimeZone = '',
      this.description = ''});

  final String eventName;
  final DateTime from;
  final DateTime to;
  final Color background;
  final bool isAllDay;
  final String startTimeZone;
  final String endTimeZone;
  final String description;

  Map<String, dynamic> toJson() => {
        'eventName': eventName,
        'from_hour': from.hour,
        'from_minute': from.minute,
        'to_hour': to.hour,
        'to_minute': to.minute,
        'background': background.toString(),
        'isAllDay': isAllDay,
        'startTimeZone': startTimeZone,
        'endTimeZone': endTimeZone,
        'description': description,
      };
}
