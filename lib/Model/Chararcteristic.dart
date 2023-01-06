// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:agr_app/data/data.dart';
import 'package:flutter/material.dart';

class Characteristic {
  Color contColour;
  double percentage;
  String imagepath;
  String title;
  String subtitle;
  Characteristic({
    required this.contColour,
    required this.percentage,
    required this.imagepath,
    required this.title,
    required this.subtitle,
  });
}

List<Characteristic> charlist = [
  Characteristic(
      contColour: CustomColor.kpendingyellow,
      percentage: 50,
      imagepath: "3rd Ave road, Ikot Ansa",
      title: "Soil",
      subtitle: "Clay Type"),
  Characteristic(
      contColour: CustomColor.klightishblue,
      percentage: 75,
      imagepath: "7th avenue, Ashok Nagar road",
      title: "Water",
      subtitle: "Normal Level"),
  Characteristic(
      contColour: CustomColor.kblack.withOpacity(0.3),
      percentage: 359,
      imagepath: "7th street, SDAT Cricket Ground",
      title: "Insect",
      subtitle: "Normal Level"),
  Characteristic(
      contColour: CustomColor.klightgrey,
      percentage: 3.2,
      imagepath: "Apples eatery, marian road",
      title: "Health",
      subtitle: "Normal Level"),
];
