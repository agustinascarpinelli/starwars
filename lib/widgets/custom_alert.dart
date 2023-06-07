import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

customAlert(
  BuildContext context,
  String title,
  Icon icon,
  String subtitle,
  void Function() function,
) {
  if (Platform.isAndroid) {
    return showDialog(
      context: context,
      builder: (_) => AlertDialog(
        actionsAlignment: MainAxisAlignment.center,
        actionsOverflowAlignment: OverflowBarAlignment.center,
        iconColor: const Color(0xFFFF0000),
        backgroundColor: const Color(0xFF000000),
        icon: icon,
        title: Text(
          title,
          style: const TextStyle(color: Color(0xFFFF0000)),
        ),
        content: Text(
          subtitle,
          textAlign: TextAlign.center,
          style: const TextStyle(color: Color(0xFF757575)),
        ),
        actions: [
          Center(
            child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              MaterialButton(
                color: const Color(0xFF757575),
                onPressed: () => Navigator.pop(context),
                textColor: Colors.white,
                elevation: 5,
                child: const Text(
                  'Cancel',
                  style: TextStyle(fontFamily: 'Poppins'),
                ),
              ),
              const SizedBox(
                width: 40,
              ),
              MaterialButton(
                color: const Color(0xFFFF0000),
                onPressed: function,
                textColor: Colors.white,
                elevation: 5,
                child: const Text(
                  'Ok',
                  style: TextStyle(fontFamily: 'Poppins'),
                ),
              ),
            ]),
          )
        ],
      ),
    );
  }
  showCupertinoDialog(
      context: context,
      builder: (_) => CupertinoAlertDialog(
            title: Text(
              title,
              style: const TextStyle(
                fontFamily: 'Poppins',
                color: Color(0xFFFF0000),
              ),
            ),
            content: Text(
              subtitle,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontFamily: 'Poppins',
                color: Color(0xFFFFFFFF),
              ),
            ),
            actions: [
              CupertinoDialogAction(
                isDefaultAction: true,
                child: const Text(
                  'Cancel',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    color: Color(0xFF757575),
                  ),
                ),
                onPressed: () => Navigator.pop(context),
              ),
              CupertinoDialogAction(
                  isDefaultAction: true,
                  onPressed: function,
                  child: const Text(
                    'Ok',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      color: Color(0xFFFF0000),
                    ),
                  ))
            ],
          ));
}
