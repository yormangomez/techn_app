import 'package:flutter/material.dart';

class HomeItemModel {
  HomeItemModel({
    required this.title,
    required this.iconData,
    required this.onPressed,
    this.color,
  });

  String title;
  IconData iconData;
  VoidCallback onPressed;
  Color? color;

  factory HomeItemModel.fromJson(Map<String, dynamic> json) => HomeItemModel(
        title: json["title"],
        iconData: json["icon"],
        onPressed: json["onPressed"],
        color: json["color"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "icon": iconData,
        "onPressed": onPressed,
        "color": color,
      };
}
