import 'package:flutter/material.dart';

class CardModel {
  final String bandName;
  final Color image;
  final Image modalImage;
  final String audioPath;

  CardModel({
    required this.modalImage,
    required this.bandName,
    required this.image,
    required this.audioPath,
  });
}
