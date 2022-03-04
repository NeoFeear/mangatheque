import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import '../backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

double rapport(
  double nbPossedes,
  double nbTotal,
) {
  double calc = nbPossedes / nbTotal;
  if (calc >= 1) {
    return 1;
  } else {
    return calc;
  }
}

String pourcentage(
  double nbPossedes,
  double nbTotal,
) {
  double calc = nbPossedes / nbTotal * 100;
  String calc2 = calc.toStringAsFixed(2);
  String percent = ' %';
  return '$calc2 $percent';
}
