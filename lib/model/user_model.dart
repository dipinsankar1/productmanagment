import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  String? uid;
  final String? email;
  String? password;
  final String? displayName;
  bool? isVerified;

  UserModel({
    this.uid,
    this.email,
    this.password,
    this.displayName,
    this.isVerified,
  });

  Map<String, dynamic> toMap() {
    return {
      'email': email,
      'displayName': displayName,
    };
  }

  UserModel.fromDocumentSnapshot(DocumentSnapshot<Map<String, dynamic>> doc)
      : uid = doc.id,
        email = doc.data()!["email"],
        displayName = doc.data()!["displayName"];


  UserModel copyWith({
    String? uid,
    String? email,
    String? password,
    String? displayName,
    bool? isVerified,
  }) {
    return UserModel(
        uid: uid ?? this.uid,
        email: email ?? this.email,
        password: password ?? this.password,
        displayName: displayName ?? this.displayName,
        isVerified: isVerified ?? this.isVerified
    );
  }
}