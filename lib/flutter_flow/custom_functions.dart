import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';

String? jsonToString(String? jsonParm) {
  return jsonParm;
}

double? waitlistCount(
  dynamic jsonParm,
  String? gubn,
) {
  // when gubn='ALL', total count of json array, when gubn='DONE', count of json field "wtstatus" except  'I','W','N'
  if (jsonParm == null || gubn == null) {
    return null;
  }

  if (jsonParm is List) {
    if (gubn == 'ALL') {
      return jsonParm.length.toDouble(); // Return total count of JSON array.
    } else {
      double count = 0;
      for (var item in jsonParm) {
        if (item is Map && item.containsKey('wtstatus')) {
          // Check if wtstatus is not 'I', 'W', or 'N'.
          if (item['wtstatus'] != 'I' &&
              item['wtstatus'] != 'W' &&
              item['wtstatus'] != 'N' &&
              item['wtstatus'] != 'R') {
            if (gubn == 'DONE') {
              count++;
            }
          } else {
            if (gubn == 'NONE') {
              count++;
            }
          }
        }
      }
      return count; // Return count based on status.
    }
  }

  return null;
}

dynamic getFirstJson(dynamic jsonParm) {
  // get first row of json array
  if (jsonParm is List && jsonParm.isNotEmpty) {
    return jsonParm[0];
  }
  return null;
}

String? getCurrentURL() {
  // Get current URI
  Uri uri = Uri.base;

  // Get parameters 'patid' and 'inspecdate' from URI, set to empty string if null
  String qstr = uri.queryParameters['qstr'] ?? '';

  // Return the JSON object
  return qstr;
}

String? dateFormatKR(String? stringDate) {
  // change format "2024-11-01 or 20241101 " to 2024년 11월 01일
  if (stringDate == null) {
    return null;
  }

  // Remove any non-digit characters from the string
  if (stringDate.length >= 11) {
    stringDate = stringDate.substring(0, 10);
  }
  String cleanedDate = stringDate.replaceAll(RegExp(r'\D'), '');

  // Check if the cleaned date string is in the correct format
  if (cleanedDate.length != 8) {
    return null;
  }

  // Extract year, month, and day from the cleaned date string
  String year = cleanedDate.substring(0, 4);
  String month = cleanedDate.substring(4, 6);
  String day = cleanedDate.substring(6);

  // Return the formatted date string
  return '$year년 $month월 $day일';
}

String? timeFormatKR(String? timeString) {
  // change format 1415 to 14시 15분
  // change format "1415" to "14시 15분"
  if (timeString == null) {
    return null;
  }

  // Check if the timeString is in the correct format
  if (timeString.length != 4) {
    return null;
  }

  // Extract hour and minute from the timeString
  String hour = timeString.substring(0, 2);
  String minute = timeString.substring(2);

  // Return the formatted time string
  return '$hour시 $minute분';
}

FFUploadedFile? base64ToBytes(String? base64String) {
  // Uint8List has error because i can't import dart:typed_data. please replace Uint8List class to other logic
  if (base64String == null) {
    return null;
  }

  return FFUploadedFile(bytes: base64.decode(base64String));
}

String? dDayCalculate(String inputDate) {
  // caculate day today to inputDate
  // Get the current date
  DateTime now = DateTime.now();

  // Remove any non-digit characters from the string
  String cleanedDate = inputDate.replaceAll(RegExp(r'\D'), '');

  // Check if the cleaned date string is in the correct format
  if (cleanedDate.length != 8) {
    return null;
  }

  // Manually extract year, month, and day from the input date string
  int year = int.parse(cleanedDate.substring(0, 4));
  int month = int.parse(cleanedDate.substring(4, 6));
  int day = int.parse(cleanedDate.substring(6, 8));

  // Parse the input date to a DateTime object
  DateTime date = DateTime(year, month, day);

  // Calculate the difference in days between the current date and the input date
  int differenceInDays = date.difference(now).inDays + 1;

  // Return the formatted D-Day string
  if (differenceInDays == 0) {
    return 'D-Day';
  } else if (differenceInDays > 0) {
    return 'D-${differenceInDays}';
  } else {
    return 'D+${differenceInDays.abs()}';
  }
}

String? urlEncode(String plainText) {
  // url encode module
  return Uri.encodeFull(plainText);
}
