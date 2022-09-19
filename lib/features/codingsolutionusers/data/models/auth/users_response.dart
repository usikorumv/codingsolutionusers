import 'package:codingsolutionusers/features/codingsolutionusers/domain/entities/auth/users.dart';
import 'package:equatable/equatable.dart';

class UsersResponse extends Equatable {
  const UsersResponse({
    this.page,
    this.perPage,
    this.total,
    this.totalPages,
    this.data,
    this.support,
    this.error,
  });

  factory UsersResponse.fromJson(dynamic json) {
    final dataTemp = json as List<dynamic>?;
    final data = dataTemp != null
        ? dataTemp.map((v) => DataUser.fromJson(v)).toList()
        : <DataUser>[];

    return UsersResponse(data: data);

    // TODO: See
    // final page = json['page'] as int?;
    // final perPage = json['per_page'] as int?;
    // final total = json['total'] as int?;
    // final totalPages = json['total_pages'] as int?;
    // final error = json['error'] as String?;
    // final dataTemp = json['data'] as List<dynamic>?;
    // final data = dataTemp != null
    //     ? dataTemp.map((v) => DataUser.fromJson(v)).toList()
    //     : <DataUser>[];
    // final support =
    //     json['support'] != null ? SupportUser.fromJson(json['support']) : null;

    // return UsersResponse(
    //   page: page,
    //   perPage: perPage,
    //   total: total,
    //   totalPages: totalPages,
    //   data: data,
    //   support: support,
    //   error: error,
    // );
  }

  final int? page;
  final int? perPage;
  final int? total;
  final int? totalPages;
  final List<DataUser>? data;
  final SupportUser? support;
  final String? error;

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
    map['error'] = error;

    return map;
  }

  Users toEntity() {
    final listUser = data!
        .map<User>(
          (model) => User(
            email: model.email ?? "",
            name: model.name ?? "",
            surname: model.surname ?? "",
            referer: model.referer ?? "",
            phone: model.phone ?? "",
            date: model.date ?? "",
          ),
        )
        .toList();

    return Users(listUser, page ?? 1, totalPages ?? 1);
  }

  @override
  List<Object?> get props => [
        page,
        perPage,
        total,
        totalPages,
        data,
        support,
        error,
      ];
}

class SupportUser extends Equatable {
  const SupportUser({
    this.url,
    this.text,
  });

  SupportUser.fromJson(dynamic json)
      : url = json['url'] as String?,
        text = json['text'] as String?;

  final String? url;
  final String? text;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['url'] = url;
    map['text'] = text;

    return map;
  }

  @override
  List<Object?> get props => [
        url,
        text,
      ];
}

class DataUser extends Equatable {
  const DataUser({
    this.email,
    this.name,
    this.surname,
    this.referer,
    this.phone,
    this.date,
  });

  DataUser.fromJson(dynamic json)
      : email = json["email"],
        name = json["name"],
        surname = json["surname"],
        referer = json["referer"],
        phone = json["referer"],
        date = json["date"];

  final String? email;
  final String? name;
  final String? surname;
  final String? referer;
  final String? phone;
  final String? date;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['email'] = email;

    return map;
  }

  @override
  List<Object?> get props => [
        email,
      ];
}
