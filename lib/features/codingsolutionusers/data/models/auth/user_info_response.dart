import 'package:equatable/equatable.dart';

import 'package:codingsolutionusers/features/codingsolutionusers/domain/entities/auth/user_info.dart';

class UserInfoResponse extends Equatable {
  final String message;

  const UserInfoResponse({required this.message});

  const UserInfoResponse.fromJson(dynamic json) : message = json;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;

    return map;
  }

  UserInfo toEntity() => UserInfo(message);

  @override
  List<Object?> get props => [message];
}
