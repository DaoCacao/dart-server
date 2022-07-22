import 'dart:math';

import '../../domain/models/user.dart';
import '../entities/user_entity.dart';
import '../mappers/mapper.dart';

class UserDao {
  final List<UserEntity> _users;

  UserDao(this._users);

  Future<User> createUser(String username, String password) async {
    final id = _users.map((e) => e.id).reduce(max) + 1;
    final user = UserEntity(
      id: id,
      username: username,
      password: password,
    );
    _users[user.id] = user;
    return mapUser(user);
  }

  Future<User?> getUserById(int userId) async {
    try {
      final user = _users.firstWhere((e) => e.id == userId);
      return mapUser(user);
    } on StateError {
      return null;
    }
  }

  Future<User?> getUserByCredentials(String username, String password) async {
    try {
      final user = _users
          .firstWhere((e) => e.username == username && e.password == password);
      return mapUser(user);
    } on StateError {
      return null;
    }
  }
}
