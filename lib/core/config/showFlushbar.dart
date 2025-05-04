import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';




Future<void> showFlushbar(BuildContext context, String message, bool isSuccess) async {
 await Flushbar(
    textDirection: TextDirection.rtl,
    duration: const Duration(seconds: 3),
    backgroundColor: isSuccess ? Colors.green : Colors.red,
    flushbarPosition: FlushbarPosition.TOP,
    margin: const EdgeInsets.all(8),
    borderRadius: BorderRadius.circular(8),
    icon: Icon(
      isSuccess ? Icons.check : Icons.error,
      color: Colors.white,
    ),
    messageText: Directionality(
      textDirection: TextDirection.rtl, // جهت‌دهی به متن پیام
      child: Text(
        message,
        style: const TextStyle(color: Colors.white),
      ),
    ),
  ).show(context);
}



