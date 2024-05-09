// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';


class Tourist {
  final String email;
  final String firstName;
  final String lastName;
  final String country;
  Tourist({
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.country,
  });

  Tourist copyWith({
    String? email,
    String? firstName,
    String? lastName,
    String? country,
  }) {
    return Tourist(
      email: email ?? this.email,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      country: country ?? this.country,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'email': email,
      'firstName': firstName,
      'lastName': lastName,
      'country': country,
    };
  }

  factory Tourist.fromMap(Map<String, dynamic> map) {
    return Tourist(
      email: map['email'] as String,
      firstName: map['firstName'] as String,
      lastName: map['lastName'] as String,
      country: map['country'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Tourist.fromJson(String source) => Tourist.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Tourist(email: $email, firstName: $firstName, lastName: $lastName, country: $country)';
  }

  @override
  bool operator ==(covariant Tourist other) {
    if (identical(this, other)) return true;
  
    return 
      other.email == email &&
      other.firstName == firstName &&
      other.lastName == lastName &&
      other.country == country;
  }

  @override
  int get hashCode {
    return email.hashCode ^
      firstName.hashCode ^
      lastName.hashCode ^
      country.hashCode;
  }
} 
