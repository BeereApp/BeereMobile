import 'dart:io';

import 'package:beere_mobile/helpers.dart';

extension FileExtension on File {
  String get contentType => getContentType(path.split('.').last);

  String get fileName => path.split('/').last;
}
