
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cni_web/feature/landing_page/exports.dart';
import 'package:cni_web/shared/widgets/buttons.dart';
import 'package:cni_web/utils/validators.dart';
import 'package:flutter/material.dart';

import '../../utils/decor.dart';

class DropDownField extends StatefulWidget {
  const DropDownField(
      {Key? key,
        required this.hint,
        required this.title,
        required this.options,
        required this.onChanged,
        this.validator})
      : super(key: key);
  final String hint;
  final String title;

  final List<String> options;
  final ValueChanged<String?> onChanged;
  final String? Function(String?)? validator;

  @override
  State<DropDownField> createState() => _DropDownFieldState();
}

class _DropDownFieldState extends State<DropDownField> {
  String? selectedVal;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              flex: 2,
              child: Text(
                widget.title,
                style: TextStyle(
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
                child: DropdownButtonFormField<String>(
                  value: selectedVal,
                  validator: widget.validator,
                  isExpanded: true,
                  decoration: decor(),
                  hint: Text(widget.hint),
                  items: widget.options.map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      selectedVal = newValue ?? '';
                      widget.onChanged(newValue);
                    });
                  },
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