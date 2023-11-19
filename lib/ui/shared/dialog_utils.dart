// Các hộp thoại thông báo

import 'package:flutter/material.dart';

Future<bool?> showConfirmDialog(BuildContext context, String message) {
  return showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: const Text('Are you sure?'),
      content: Text(message),
      actions: <Widget>[
        TextButton(
          child: const Text('NO'),
          onPressed: () {
            Navigator.of(context).pop(false);
          },
        ),
        TextButton(
          child: const Text("Yes"),
          onPressed: () {
            Navigator.of(context).pop(true);
          },
        ),
      ],
    ),
  );
}

Future<void> showErrorDialog(BuildContext context, String message) {
  return showDialog(
      context: context,
      builder: (context) => AlertDialog(
            title: const Text('An error occurred'),
            content: Text(message),
            actions: <Widget>[
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text('OK'),
              )
            ],
      ),
  );
}
