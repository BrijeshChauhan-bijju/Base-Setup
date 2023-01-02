import 'package:base_setup/domain/model/users/user_list_model.dart';

import 'data_entity.dart';
import 'support_entity.dart';
import 'dart:convert';

UserListEntity userlistEntityFromJson(String str) =>
    UserListEntity.fromJson(json.decode(str));
String userlistEntityToJson(UserListEntity data) => json.encode(data.toJson());

class UserListEntity {
  UserListEntity({
    this.page,
    this.perPage,
    this.total,
    this.totalPages,
    this.data,
    this.support,
  });

  UserListEntity.fromJson(dynamic json) {
    page = json['page'];
    perPage = json['per_page'];
    total = json['total'];
    totalPages = json['total_pages'];
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(DataEntity.fromJson(v));
      });
    }
    support = json['support'] != null
        ? SupportEntity.fromJson(json['support'])
        : null;
  }
  num? page;
  num? perPage;
  num? total;
  num? totalPages;
  List<DataEntity>? data;
  SupportEntity? support;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['page'] = page;
    map['per_page'] = perPage;
    map['total'] = total;
    map['total_pages'] = totalPages;
    if (data != null) {
      map['data'] = data?.map((v) => v.toJson()).toList();
    }
    if (support != null) {
      map['support'] = support?.toJson();
    }
    return map;
  }

  UserListModel toModel() => UserListModel(
        page: page,
        perPage: perPage,
        total: total,
        totalPages: totalPages,
        data: this.data != null
            ? this.data?.map((e) => e.toModel()).toList()
            : [],
        support: support?.toModel(),
      );
}
