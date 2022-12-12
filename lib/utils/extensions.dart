import 'dart:io';

import 'package:beere_mobile/helpers.dart';
import 'package:intl/intl.dart';

extension FileExtension on File {
  String get contentType => getContentType(path.split('.').last);

  String get fileName => path.split('/').last;
}

extension Format on double {
  String get formatToAmount {
    // const naira = '₦';
    // Locale locale = Localizations.localeOf(Get.context!);
    var format =
        NumberFormat.simpleCurrency(locale: Platform.localeName, name: 'NGN');
    return this == 0
        ? '${format.currencySymbol}0'
        : '${format.currencySymbol}${NumberFormat('######0.##').format(this)}';
  }
}

extension DateTimeExtension on DateTime {
  String get formatDayMonth {
    String dayText = day.toString().endsWith('1') && day != 11
        ? 'st'
        : day.toString().endsWith('2') && day != 12
            ? 'nd'
            : day.toString().endsWith('3') && day != 13
                ? 'rd'
                : 'th';
    String monthText = DateFormat('MMMM').format(this);
    return '$day$dayText, $monthText';
  }
}
