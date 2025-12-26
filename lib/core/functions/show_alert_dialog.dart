import 'package:flutter/material.dart';

void showBlockingDialog(BuildContext context) {
  showDialog(
    context: context,
    barrierDismissible: false,
    barrierColor: Colors.transparent,
    builder: (context) {
      // ignore: deprecated_member_use
      return WillPopScope(
        onWillPop: () async => false,
        child: const SizedBox.expand(
          // child: Center(
          //   child: CircularProgressIndicator(),
          // ),
        ),
      );
    },
  );
}
