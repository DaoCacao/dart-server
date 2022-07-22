import '../domain/models/user.dart';
import 'responses/user_response.dart';

UserResponse mapUser(User user) => UserResponse(
      id: user.id,
      username: user.username,
    );
