import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cni_web/feature/landing_page/exports.dart';
import 'package:cni_web/shared/widgets/buttons.dart';
import 'package:cni_web/utils/validators.dart';
import 'package:flutter/material.dart';

class RegForm extends StatefulWidget {
  const RegForm({super.key});

  @override
  _RegFormState createState() => _RegFormState();
}

class _RegFormState extends State<RegForm> {
  final _formKey = GlobalKey<FormState>();

  String? _name;
  String? _school;
  String? _phone;
  String? _address;
  String? _church;
  String? _gender;
  String? _testimony;
  String? _participation;

  bool registering = false;
  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      ignoring: registering,
      child: Padding(
        padding: EdgeInsets.only(
          left: 20.0,
          right: 20.0,
          bottom: MediaQuery.of(context).viewInsets.bottom, // Adjust for keyboard
          top: 20.0,
        ),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 12),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  'Enter Your Details',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 20),
                AppFormField(
                  fieldName: 'Name',
                  inputType: TextInputType.name,
                  validator: (v) => AppValidator.validateEmptyText('Name', v),
                  onSaved: (v) {
                    _name = v;
                  },
                ),
                DropDownField(
                  options: ['Male', 'Female'],
                  validator: (v) =>
                      AppValidator.validateEmptyText('This field', v),
                  onChanged: (v) {
                    _gender = v;
                  },
                  hint: 'Select gender',
                ),
                SizedBox(
                  height: 20,
                ),
                AppFormField(
                  fieldName: 'Address',
                  validator: (v) => AppValidator.validateEmptyText('Address', v),
                  inputType: TextInputType.text,
                  onSaved: (v) {
                    _address = v;
                  },
                ),
                AppFormField(
                  fieldName: 'Phone Number (Whatsapp preferably)',
                  inputType: TextInputType.number,
                  validator: (v) => AppValidator.validatePhoneNumber(v),
                  onSaved: (v) {
                    _phone = v;
                  },
                ),
                AppFormField(
                  fieldName: 'Church',
                  inputType: TextInputType.name,
                  onSaved: (v) {
                    _church = v;
                  },
                ),
                DropDownField(
                  options: ['Full', 'Partial'],
                  onChanged: (v) {
                    _participation = v;
                  },
                  validator: (v) =>
                      AppValidator.validateEmptyText('This field', v),
                  hint: 'Are you doing full camping or partial?',
                ),
                SizedBox(
                  height: 20,
                ),
                AppFormField(
                  fieldName: 'School (optional)',
                  inputType: TextInputType.name,
                  onSaved: (v) {
                    _school = v;
                  },
                ),
                AppFormField(
                  fieldName: 'Testimony (if you have one)',
                  inputType: TextInputType.name,
                  onSaved: (v) {
                    _testimony = v;
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                const SizedBox(height: 20),
                AppButton(
                  centerAlign: true,
                  loading: registering,
                  onTap: () async {

                    if (_formKey.currentState?.validate() ?? false) {
                      _formKey.currentState?.save();
                      try {
                        setState(() {
                          registering = true;
                        });
                        final FirebaseFirestore firestore =
                            FirebaseFirestore.instance;
                        await firestore.collection('users').doc('$_name (${DateTime.now()})').set({
                          'name': _name,
                          'address': _address,
                          'phone': _phone,
                          'testimony': _testimony,
                          'school': _school,
                          'participation': _participation,
                          'gender': _gender,
                          'church': _church,
                          'reg_date': FieldValue.serverTimestamp()
                        });
                        setState(() {
                          registering = false;
                        });
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text('Registration Successful'),
                              content: Text('You have successfully registered for this program.'),
                              actions: <Widget>[
                                TextButton(
                                  child: Text('OK'),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                    Navigator.of(context).pop();
                                  },
                                ),
                              ],

                            );
                          },
                        );
                      } catch (e) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                              content: Text(
                                  'Failed to register you at this time. Try later or contact us.')),
                        );
                      }
                    }
                  },
                  text: 'Submit',
                  width: 200,
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class AppFormField extends StatelessWidget {
  const AppFormField({
    super.key,
    required this.fieldName,
    required this.inputType,
    required this.onSaved,
    this.validator,
  });

  final String fieldName;
  final TextInputType inputType;
  final ValueChanged<String?> onSaved;
  final String? Function(String?)? validator;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        TextFormField(
          decoration: InputDecoration(
            labelText: fieldName,
            enabledBorder: OutlineInputBorder(),
            focusedBorder: OutlineInputBorder(),
            focusedErrorBorder: OutlineInputBorder(),
            border: OutlineInputBorder(),
            errorBorder: OutlineInputBorder(
                borderSide: BorderSide(color: AppColors.appRed)),
          ),
          keyboardType: inputType,
          onSaved: onSaved,
          validator: validator,
        ),
        SizedBox(
          height: 20,
        )
      ],
    );
  }
}

class DropDownField extends StatefulWidget {
  const DropDownField(
      {Key? key,
      required this.hint,
      required this.options,
      required this.onChanged,
      this.validator})
      : super(key: key);
  final String hint;

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
    return DropdownButtonFormField<String>(
      value: selectedVal,
      validator: widget.validator,
      isExpanded: true,
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(),
        focusedBorder: OutlineInputBorder(),
        focusedErrorBorder: OutlineInputBorder(),
        border: OutlineInputBorder(),
        errorBorder:
            OutlineInputBorder(borderSide: BorderSide(color: AppColors.appRed)),
      ),
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
    );
  }
}
