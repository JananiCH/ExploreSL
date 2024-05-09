// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Guide {
  final String uid;
  final String name;
  final String email;

  final String document;
  final String phoneNumber;
  final String image;
  final String additionalDetails;
  
  Guide({
    required this.uid,
    required this.name,
    required this.email,
    required this.document,
    required this.phoneNumber,
    required this.image,
    required this.additionalDetails,
  });

  Guide copyWith({
    String? uid,
    String? name,
    String? email,
    String? document,
    String? phoneNumber,
    String? image,
    String? additionalDetails,
  }) {
    return Guide(
      uid: uid ?? this.uid,
      name: name ?? this.name,
      email: email ?? this.email,
      document: document ?? this.document,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      image: image ?? this.image,
      additionalDetails: additionalDetails ?? this.additionalDetails,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'uid': uid,
      'name': name,
      'email': email,
      'document': document,
      'phoneNumber': phoneNumber,
      'image': image,
      'additionalDetails': additionalDetails,
    };
  }

  factory Guide.fromMap(Map<String, dynamic> map) {
    return Guide(
      uid: map['uid'] as String,
      name: map['name'] as String,
      email: map['email'] as String,
      document: map['document'] as String,
      phoneNumber: map['phoneNumber'] as String,
      image: map['image'] as String,
      additionalDetails: map['additionalDetails'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Guide.fromJson(String source) => Guide.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Guide(uid: $uid, name: $name, email: $email, document: $document, phoneNumber: $phoneNumber, image: $image, additionalDetails: $additionalDetails)';
  }

  @override
  bool operator ==(covariant Guide other) {
    if (identical(this, other)) return true;
  
    return 
      other.uid == uid &&
      other.name == name &&
      other.email == email &&
      other.document == document &&
      other.phoneNumber == phoneNumber &&
      other.image == image &&
      other.additionalDetails == additionalDetails;
  }

  @override
  int get hashCode {
    return uid.hashCode ^
      name.hashCode ^
      email.hashCode ^
      document.hashCode ^
      phoneNumber.hashCode ^
      image.hashCode ^
      additionalDetails.hashCode;
  }
}
