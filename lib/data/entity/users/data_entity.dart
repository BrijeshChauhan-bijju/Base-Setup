import 'dart:convert';

import 'package:base_setup/domain/model/users/data_model.dart';

DataEntity dataFromJson(String str) => DataEntity.fromJson(json.decode(str));
String dataToJson(DataEntity data) => json.encode(data.toJson());

class DataEntity {
  DataEntity({
    this.id,
    this.email,
    this.firstName,
    this.lastName,
    this.avatar,
  });

  DataEntity.fromJson(dynamic json) {
    id = json['id'];
    email = json['email'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    avatar = json['avatar'];
  }
  num? id;
  String? email;
  String? firstName;
  String? lastName;
  String? avatar;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['email'] = email;
    map['first_name'] = firstName;
    map['last_name'] = lastName;
    map['avatar'] = avatar;
    return map;
  }

  DataModel toModel() => DataModel(
        id: id,
        email: email,
        firstName: firstName,
        lastName: lastName,
        avatar: avatar,
      );
}
