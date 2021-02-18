// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProfileModels _$ProfileModelsFromJson(Map json) {
  return ProfileModels(
    name: json['name'] as String,
    email: json['email'] as String,
    password: json['password'] as String,
    confirmPassword: json['confirmPassword'] as String,
    secondName: json['secondName'] as String,
    country: json['country'] as String,
    age: json['age'] as String,
    phoneNumber: json['phoneNumber'] as String,
  );
}

Map<String, dynamic> _$ProfileModelsToJson(ProfileModels instance) =>
    <String, dynamic>{
      'name': instance.name,
      'email': instance.email,
      'password': instance.password,
      'confirmPassword': instance.confirmPassword,
      'secondName': instance.secondName,
      'country': instance.country,
      'age': instance.age,
      'phoneNumber': instance.phoneNumber,
    };
