import '../../domain/models/user.dart';
import '../entities/user_entity.dart';

User mapUser(UserEntity entity) => User(
      id: entity.id,
      username: entity.username,
    );
