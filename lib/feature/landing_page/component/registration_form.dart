import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cni_web/feature/landing_page/exports.dart';
import 'package:cni_web/shared/widgets/animated_text.dart';
import 'package:cni_web/shared/widgets/buttons.dart';
import 'package:cni_web/utils/validators.dart';
import 'package:flutter/material.dart';

import '../../../shared/widgets/dropown_field.dart';
import '../../../shared/widgets/formfield.dart';

class RegForm extends StatefulWidget {
  const RegForm({super.key, required this.eventName});

  final String eventName;
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
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Container(
                color: AppColors.appYellow.withOpacity(0.4),
                width: double.infinity,
                height: 50,
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: Text(
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        widget.eventName,
                        style:
                            TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                      ),
                    ),

                    AnimatedText(
                      text: 'Register for this event',
                      duration: 100.ms,
                      replay: true,
                      style:
                          TextStyle(fontSize: 14, color: AppColors.appGreen,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
              Expanded(
                child: ListView(
                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 16),
                  children: [
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
                      title: 'Select gender',
                      hint: 'Choose gender',
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    AppFormField(
                      fieldName: 'Address',
                      validator: (v) =>
                          AppValidator.validateEmptyText('Address', v),
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
                      title: 'Are you doing full camping or partial?',
                      hint: 'Choose mode',
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
                      maxLines: 4,
                      onSaved: (v) {
                        _testimony = v;
                      },
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        Expanded(
                            flex:2,
                            child: SizedBox()),

                        SizedBox(
                          width: 20,
                        ),
                        Expanded(
                          flex: 7,
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: AppButton(
                              centerAlign: true,
                              loading: registering,
                              onTap: _register,
                              text: 'Submit',
                              width: 100,
                              padding: EdgeInsets.symmetric(vertical: 14.h),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
  void _register () async {
    if (_formKey.currentState?.validate() ?? false) {
      _formKey.currentState?.save();
      try {

        setState(() {
          registering = true;
        });
        final FirebaseFirestore firestore =
            FirebaseFirestore.instance;
        await firestore
            .collection('users')
            .doc('$_name (${DateTime.now()})')
            .set({
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
              content: Text(
                  'You have successfully registered for this program.'),
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
  }
}




