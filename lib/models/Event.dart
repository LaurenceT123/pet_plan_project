import 'package:flutter/material.dart';

class Event
{
  final String title;
  final String description;
  final DateTime startTime;
  final DateTime endTime;
  final bool repeat;

  Event(
      {
        required this.title,
        required this.description,
        required this.startTime,
        required this.endTime,
        this.repeat = false,
      });
}