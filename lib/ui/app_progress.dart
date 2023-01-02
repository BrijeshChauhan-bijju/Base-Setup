
import 'package:flutter/material.dart';

class AppProgress {
  AppProgress(BuildContext context) {
    showDialog<Null>(
        context: context,
        barrierDismissible: false,
        barrierColor: Colors.white.withOpacity(0.5),
        useSafeArea: true,
        builder: (BuildContext context) {
          return WillPopScope(
            onWillPop: () async => false,
            child: const Center(
                child: CircularProgressIndicator()),
          );
        });
  }
}
