import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  final String? address;
  final String? church;
  final String? gender;
  final String? name;
  final String? participation;
  final String? phone;
  final DateTime? regDate;
  final String? school;
  final String? testimony;

  User({
    this.address,
    this.church,
    this.gender,
    this.name,
    this.participation,
    this.phone,
    this.regDate,
    this.school,
    this.testimony,
  });

  // Factory constructor for creating a new User instance from a map
  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      address: map['address'],
      church: map['church'],
      gender: map['gender'],
      name: map['name'],
      participation: map['participation'],
      phone: map['phone'],
      regDate: map['reg_date'] != null ? (map['reg_date'] as Timestamp).toDate() : null,
      school: map['school'],
      testimony: map['testimony'],
    );
  }

  // Method to convert User instance to a map
  Map<String, dynamic> toMap() {
    return {
      'address': address,
      'church': church,
      'gender': gender,
      'name': name,
      'participation': participation,
      'phone': phone,
      'reg_date': regDate?.toIso8601String(),
      'school': school,
      'testimony': testimony,
    };
  }
}
