import 'package:internet_connection_checker/internet_connection_checker.dart';

import 'utils/enum.dart';

Future<bool> checkForInternet() async {
  bool result = await InternetConnectionChecker().hasConnection;
  return result;
}

late UserType usertype;
