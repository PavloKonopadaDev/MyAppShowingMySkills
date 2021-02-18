import 'package:json_annotation/json_annotation.dart';

part 'profile_models.g.dart';

// @JsonKey(name: '_id')// TODO: міняє ім'я на бек, тобто тут називаю як хочу а там буде те що задав тут в JsonKey
// final String id;//
@JsonSerializable(anyMap: true)
class ProfileModels {
  final String name;
  final String email;
  final String password;
  final String confirmPassword;
  final String secondName;
  final String country;
  final String age;
  final String phoneNumber;

  ProfileModels({
    this.name,
    this.email,
    this.password,
    this.confirmPassword,
    this.secondName,
    this.country,
    this.age,
    this.phoneNumber,
  });

  ProfileModels copyWith({
    String name,
    String email,
    String password,
    String confirmPassword,
    String secondName,
    String country,
    String age,
    String phoneNumber,
  }) {
    return ProfileModels(
      name: name ?? this.name,
      email: email ?? this.email,
      password: password ?? this.password,
      confirmPassword: confirmPassword ?? this.confirmPassword,
      secondName: secondName ?? this.secondName,
      country: country ?? this.country,
      age: age ?? this.age,
      phoneNumber: phoneNumber ?? this.phoneNumber,
    );
  }

  factory ProfileModels.fromJson(Map json) => _$ProfileModelsFromJson(json);

  Map<String, dynamic> toJson() => _$ProfileModelsToJson(this);
}
