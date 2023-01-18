// Flutter imports:
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Alert {
  Alert._();

  static void showAlert(
    BuildContext context,
    String? message, {
    String acceptButton = 'Đồng ý',
    String errorDefault = 'Có lỗi xảy ra, vui lòng thử lại sau',
    String title = '',
    Function()? onPressOK,
    bool isPop = true,
  }) {
    showDialog<void>(
      context: context,
      builder: (context) => WillPopScope(
        child: CupertinoAlertDialog(
          title: Text(
            title,
            style: const TextStyle(fontSize: 16),
          ),
          content: Text(
            message ?? errorDefault,
            style: const TextStyle(
              color: Color(0xff7e7e7e),
              height: 1.5,
              fontSize: 13,
              fontWeight: FontWeight.w400,
              fontStyle: FontStyle.normal,
            ),
          ),
          actions: <Widget>[
            TextButton(
              style: ButtonStyle(
                textStyle: MaterialStateProperty.all(
                  const TextStyle(
                    color: Color(0xff2f81ff),
                  ),
                ),
              ),
              onPressed: () {
                if (isPop) {
                  Navigator.of(context).pop();
                }
                if (onPressOK != null) {
                  onPressOK();
                }
              },
              child: Text(acceptButton),
            )
          ],
        ),
        onWillPop: () async => false,
      ),
    );
  }
}
