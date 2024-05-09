// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Guide {
  final String uid;
  final String name;
  final String email;
  final String dob;
  final String experience;
  final String languages;
  final String document;
  final String phoneNumber;
  final String image;
  final String additionalDetails;

  Guide({
    required this.uid,
    required this.name,
    required this.email,
    required this.dob,
    required this.experience,
    required this.languages,
    required this.document,
    required this.phoneNumber,
    required this.image,
    required this.additionalDetails,
  });

  Guide copyWith({
    String? uid,
    String? name,
    String? email,
    String? dob,
    String? experience,
    String? languages,
    String? document,
    String? phoneNumber,
    String? image,
    String? additionalDetails,
  }) {
    return Guide(
      uid: uid ?? this.uid,
      name: name ?? this.name,
      email: email ?? this.email,
      dob: dob ?? this.dob,
      experience: experience ?? this.experience,
      languages: languages ?? this.languages,
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
      'dob': dob,
      'experience': experience,
      'languages': languages,
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
      dob: map['dob'] as String,
      experience: map['experience'] as String,
      languages: map['languages'] as String,
      document: map['document'] as String,
      phoneNumber: map['phoneNumber'] as String,
      image: map['image'] as String,
      additionalDetails: map['additionalDetails'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Guide.fromJson(String source) =>
      Guide.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Guide(uid: $uid, name: $name, email: $email, dob: $dob, experience: $experience, languages: $languages, document: $document, phoneNumber: $phoneNumber, image: $image, additionalDetails: $additionalDetails)';
  }

  @override
  bool operator ==(covariant Guide other) {
    if (identical(this, other)) return true;

    return other.uid == uid &&
        other.name == name &&
        other.email == email &&
        other.dob == dob &&
        other.experience == experience &&
        other.languages == languages &&
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
        dob.hashCode ^
        experience.hashCode ^
        languages.hashCode ^
        document.hashCode ^
        phoneNumber.hashCode ^
        image.hashCode ^
        additionalDetails.hashCode;
  }
}
