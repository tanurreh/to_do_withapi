// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:agr_app/data/data.dart';
import 'package:flutter/material.dart';

class AgricultureModel {
  String imagepath;
  String title;
  String venue;
  String status;
  Color statusColor;
  AgricultureModel({
    required this.imagepath,
    required this.title,
    required this.venue,
    required this.status,
    required this.statusColor,
  });
}

List<AgricultureModel> gardenlist = [
  AgricultureModel(
      imagepath: CustomAssets.wheat,
      title: 'Vegetable Garden',
      venue: 'Kohat, Sindh',
      status: 'Harvest',
      statusColor: CustomColor.klightishblue),
  AgricultureModel(
      imagepath: CustomAssets.farm,
      title: 'Fruit Garden',
      venue: 'Kunn, Lahore',
      status: 'Started',
      statusColor: CustomColor.kred)
];
