import '../domain/models/user.dart';
import '../gen/api.pb.dart';

UserRaw mapUser(User user) => UserRaw(
      id: user.id,
      username: user.username,
    );
