import 'package:flutter/material.dart';

import 'app_colors.dart';

extension HexColor on Color {
  /// String is in the format "aabbcc" or "ffaabbcc" with an optional leading "#".
  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }

  /// Prefixes a hash sign if [leadingHashSign] is set to `true` (default is `true`).
  String toHex({bool leadingHashSign = true}) => '${leadingHashSign ? '#' : ''}'
      '${alpha.toRadixString(16).padLeft(2, '0')}'
      '${red.toRadixString(16).padLeft(2, '0')}'
      '${green.toRadixString(16).padLeft(2, '0')}'
      '${blue.toRadixString(16).padLeft(2, '0')}';
}

extension ShowSnackBar on BuildContext {
  void showSnackBar({
    required String message,
    int seconds = 4,
  }) {
    ScaffoldMessenger.of(this).removeCurrentSnackBar();
    ScaffoldMessenger.of(this).showSnackBar(SnackBar(
      duration: Duration(seconds: seconds),
      content: Text(message),
    ));
  }

  void showErrorSnackBar({required String message}) {
    showSnackBar(message: message);
  }
}

extension StringExtension on String {
  String habitDoing() {
    switch (this) {
      case 'Cook':
        return 'Cooking';
      case 'Draw':
        return 'Drawing';
      case 'Exercise':
        return 'Exercising';
      case 'Meditate':
        return 'Meditating';
      case 'Play':
        return 'Playing';
      case 'Read':
        return 'Reading';
      case 'Run':
        return 'Running';
      case 'Walk':
        return 'Walking';
      case 'Work':
        return 'Working';
      default:
        return 'Growing';
    }
  }

  String habitDid() {
    switch (this) {
      case 'Cook':
        return 'Cooked';
      case 'Draw':
        return 'Drew';
      case 'Exercise':
        return 'Exercised';
      case 'Meditate':
        return 'Meditated';
      case 'Play':
        return 'Played';
      case 'Read':
        return 'Read';
      case 'Run':
        return 'Ran';
      case 'Walk':
        return 'Walked';
      case 'Work':
        return 'Worked';
      default:
        return 'Grew';
    }
  }

  String toDate() {
    final parsedDate = DateTime.parse(this);

    return '${parsedDate.month}/${parsedDate.day}/${parsedDate.year}';
  }

  String capitalize() {
    return "${this[0].toUpperCase()}${substring(1)}";
  }
}

extension IntExtension on int {
  String toMonthLong() {
    switch (this) {
      case 1:
        return 'January';
      case 2:
        return 'February';
      case 3:
        return 'March';
      case 4:
        return 'April';
      case 5:
        return 'May';
      case 6:
        return 'June';
      case 7:
        return 'July';
      case 8:
        return 'August';
      case 9:
        return 'September';
      case 10:
        return 'October';
      case 11:
        return 'November';
      case 12:
        return 'December';
      default:
        return DateTime.now().month.toString();
    }
  }

  Color toColor() {
    switch (this) {
      case 0:
        return AppColors.one;
      case 1:
        return AppColors.two;
      case 2:
        return AppColors.three;
      case 3:
        return AppColors.four;
      case 4:
        return AppColors.five;
      case 5:
        return AppColors.six;
      case 6:
        return AppColors.seven;
      case 7:
        return AppColors.eight;
      case 8:
        return AppColors.nine;
      case 9:
        return AppColors.ten;
      default:
        return AppColors.eleven.withOpacity(0.2);
    }
  }

  String toMonthShort() {
    switch (this) {
      case 1:
        return 'Jan';
      case 2:
        return 'Feb';
      case 3:
        return 'Mar';
      case 4:
        return 'Apr';
      case 5:
        return 'May';
      case 6:
        return 'Jun';
      case 7:
        return 'Jul';
      case 8:
        return 'Aug';
      case 9:
        return 'Sep';
      case 10:
        return 'Oct';
      case 11:
        return 'Nov';
      case 12:
        return 'Dec';
      default:
        return DateTime.now().month.toString();
    }
  }

  String toWeekdayLong() {
    switch (this) {
      case 1:
        return 'Monday';
      case 2:
        return 'Tuesday';
      case 3:
        return 'Wednesday';
      case 4:
        return 'Thursday';
      case 5:
        return 'Friday';
      case 6:
        return 'Saturday';
      case 7:
        return 'Sunday';
      default:
        return 'n/a';
    }
  }

  String toWeekdayShort() {
    switch (this) {
      case 1:
        return 'Mon';
      case 2:
        return 'Tue';
      case 3:
        return 'Wed';
      case 4:
        return 'Thur';
      case 5:
        return 'Fri';
      case 6:
        return 'Sat';
      case 7:
        return 'Sun';
      default:
        return 'n/a';
    }
  }
}
