
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cni_web/feature/landing_page/exports.dart';
import 'package:cni_web/shared/widgets/buttons.dart';
import 'package:cni_web/utils/validators.dart';
import 'package:flutter/material.dart';

InputDecoration decor() =>  InputDecoration(
  constraints: BoxConstraints(maxWidth: 400),
  contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 14),
  enabledBorder: InputBorder.none,
  focusedBorder: InputBorder.none,
  focusedErrorBorder: InputBorder.none,
  border: OutlineInputBorder(),
  filled: true,
  errorBorder:InputBorder.none,
);