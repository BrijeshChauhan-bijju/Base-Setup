import 'package:base_setup/domain/model/users/data_model.dart';
import 'package:base_setup/domain/model/users/support_model.dart';

class UserListModel {
  num? page;
  num? perPage;
  num? total;
  num? totalPages;
  List<DataModel>? data;
  SupportModel? support;

  UserListModel({
    this.page,
    this.perPage,
    this.total,
    this.totalPages,
    this.data,
    this.support,
  });
}
