import 'daos/user_dao.dart';
import 'daos/user_to_token_dao.dart';

class Database {
  final UserDao userDao;
  final UserToTokenDao userToTokenDao;

  Database({
    required this.userDao,
    required this.userToTokenDao,
  });
}
