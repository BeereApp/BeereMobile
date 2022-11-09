import 'dart:io';

import 'package:beere_mobile/widgets/dialog.dart';
import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';
import 'package:image_picker/image_picker.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:permission_handler/permission_handler.dart';

import 'utils/app_colors.dart';
import 'utils/enum.dart';
import 'widgets/snackbar.dart';

late UserType usertype;

Future<bool> checkForInternet() async {
  bool result = await InternetConnectionChecker().hasConnection;
  return result;
}

///A function to select image from the device.
///Images can either be from the gallery or from the camera
Future<File?> pickImage({required ImageSource source}) async {
  File? file;
  try {
    final image = await ImagePicker().pickImage(source: source);
    if (image != null) {
      //Converting XFile that is returned by Image Picker plugin to File
      file = File(image.path);
    }
  } on PlatformException catch (e) {
    CustomSnackBar.showGet(
        title: 'Error!',
        content: e.message?.toString() ??
            'You need to provide permission'
                ' to use camera and gallery',
        backgroundColor: kPrimaryRed,
        textColor: kWhite);
    Permission.storage.request();
    Permission.camera.request();
  }
  return file;
}

String getContentType(String ext) {
  ext = ext.toLowerCase();
  if (ext == 'jpg' || ext == 'jpeg') {
    return 'image/jpeg';
  } else if (ext == 'png') {
    return 'image/png';
  } else if (ext == 'gif') {
    return 'image/gif';
  } else if (ext == 'apng') {
    return 'image/apng';
  } else if (ext == 'avif') {
    return 'image/avif';
  } else if (ext == 'svg') {
    return 'image/svg+xml';
  } else if (ext == 'webp') {
    return 'image/webp';
  } else if (ext == 'm3u') {
    return 'application/x-mpegurl';
  } else if (ext == 'm3u2') {
    return 'application/vnd.apple.mpegurl';
  } else if (ext == 'ggp3' || ext == '3gp') {
    return 'video/3gpp';
  } else if (ext == 'm1v' || ext == 'mpeg') {
    return 'video/mpeg';
  } else if (ext == 'quicktime') {
    return 'video/quicktime';
  } else if (ext == 'ogg') {
    return 'video/ogg';
  } else if (ext == 'asf') {
    return 'video/ms-asf';
  } else if (ext == 'mp4') {
    return 'video/mp4';
  } else if (ext == 'm4v') {
    return 'video/x-m4v';
  } else if (ext == 'wmv') {
    return 'video/wmv';
  } else if (ext == 'avi') {
    return 'video/x-msvideo';
  } else {
    return 'error';
  }
}

/// Determine the current position of the device.
///
/// When the location services are not enabled or permissions
/// are denied the `Future` will return an error.
Future<Position> getLocation() async {
  bool serviceEnabled;
  LocationPermission permission;

  // Check if location services are enabled.
  serviceEnabled = await Geolocator.isLocationServiceEnabled();
  if (!serviceEnabled) {
    // Location services are not enabled, don't continue
    // accessing the position and request users of the
    // App to enable the location services.
    MyDialog.showInfo('Please enable location services').then((value) {
      Geolocator.openLocationSettings();
    });
    return Future.error('Location services are disabled.');
  }

  permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      // Permissions are denied, next time you could try
      // requesting permissions again (this is also where
      // Android's shouldShowRequestPermissionRationale
      // returned true. According to Android guidelines
      // your App should show an explanatory UI now.
      MyDialog.showInfo('You need to grant permission to access your location')
          .then((value) {
        Geolocator.openLocationSettings();
      });
      return Future.error('Location permissions are denied');
    }
  }

  if (permission == LocationPermission.deniedForever) {
    // Permissions are denied forever, handle appropriately.
    MyDialog.showInfo('You need to grant permission to access your location')
        .then((value) {
      Geolocator.openLocationSettings();
    });
    return Future.error(
        'Location permissions are permanently denied, we cannot request permission.');
  }

  // When we reach here, permissions are granted and we can
  // continue accessing the position of the device.

  return await Geolocator.getCurrentPosition();
}
