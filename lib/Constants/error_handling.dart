import 'dart:convert';

import 'package:MartCart/Utils/snackbar.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

// ignore: non_constant_identifier_names
void error_handling({
  required http.Response res,
  required BuildContext context,
  required VoidCallback onSuccess,
}) {
  switch (res.statusCode) {
    case 200:
      onSuccess();
      break;
    case 400:
      showError(context, jsonDecode(res.body)['msg']);
      break;
    case 500:
      showError(context, jsonDecode(res.body)['error']);
      break;
    default:
      showError(context, res.body);
      break;
  }
}
