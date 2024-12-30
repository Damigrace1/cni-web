
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cni_web/feature/landing_page/exports.dart';
import 'package:cni_web/shared/widgets/buttons.dart';
import 'package:cni_web/utils/validators.dart';
import 'package:flutter/material.dart';

import '../../utils/decor.dart';

class AppFormField extends StatelessWidget {
  const AppFormField({
    super.key,
    required this.fieldName,
    required this.inputType,
    required this.onSaved,
    this.validator,
    this.maxLines
  });

  final String fieldName;
  final int? maxLines;
  final TextInputType inputType;
  final ValueChanged<String?> onSaved;
  final String? Function(String?)? validator;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              flex: 2,
              child: Text(
                fieldName,
                style: TextStyle(
                  fontSize: 12.sp,
                    fontWeight: FontWeight.bold, color: AppColors.appGreen),
              ),
            ),
            SizedBox(
              width: 20,
            ),
            Expanded(
              flex: 7,
              child: Align(
                alignment: Alignment.centerLeft,
                child: TextFormField(
                  maxLines: maxLines,
                  textInputAction: TextInputAction.next,
                  decoration: decor(),
                  keyboardType: inputType,
                  onSaved: onSaved,
                  validator: validator,
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 12,
        )
      ],
    );
  }
}