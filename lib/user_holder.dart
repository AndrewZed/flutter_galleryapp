import 'package:flutter_galleryapp/models/user.dart';

class UserHolder {
  Map<String, User> users = {};

  void registerUser(String name, String phone, String emai) {
    User user = User(name: name, phone: phone, email: emai);
    print(user.toString());
    if (!users.containsKey(user.login)) {
      users.addAll({user.login: user});
      users[user.login] = user;
    } else {
      throw Exception('A user with this name already exist');
    }
  }

  User registerUserByEmail(String fullName, String email) {
    RegExp regExp = RegExp(r"[a-z0-9]+@[a-z0-9]+.+[a-z]");

    String? email1 = email?.replaceAll(regExp, '');

    if (!regExp.hasMatch(email)) {
      throw Exception('Email is not valid');
    }

    User user = User(name: fullName, email: email);
    if (!users.containsKey(user.login)) {
      users.addAll({user.login: user});
      return user;
    } else {
      throw Exception('A user with this name already exist');
    }
  }

  User registerUserByPhone(String fullName, String? phone) {
    String pattern = r"^(?:[+0])?[0-9]{11}";
    phone = phone?.replaceAll(RegExp('[^+\\d]'), '');

    if (phone == null || phone.isEmpty) {
      throw Exception('Enter don`t empty phone number');
    } else if (!RegExp(pattern).hasMatch(phone)) {
      throw Exception(
          'Enter valid phone number starting whith a + and containing 11 digits');
    }

    User user = User(name: fullName, phone: phone);
    if (!users.containsKey(user.login)) {
      users.addAll({user.login: user});
      return user;
    } else {
      throw Exception('A user with this phone already exists');
    }
  }

  User getUserByLogin(String login) {
    if (users.containsKey(login)) {
      return users[login]!;
    } else {
      throw Exception('User is not found');
    }
  }

  void setFriends(String login, List<User> friends) {
    User user = getUserByLogin(login);
    user.addFriends(friends);
  }

  User findUserInFriends(String fullName, User friend) {
    User user = getUserByLogin(fullName);

    List<User> friends = user.friends;

    if (friends.contains(friend)) {
      return friend;
    } else {
      throw Exception('${friend.login} is not a friend of the login');
    }
  }

  List<User> importUsers(List<String> userList) {
    List<User> users = [];
    for (String userString in userList) {
      userString = userString.replaceAll("\n", " ");

      List<String> userParams = userString.split(';');

      for (var i = 0; i < userParams.length; i++) {
        userParams[i] = userParams[i].trim();
      }

      User user =
          User(name: userParams[0], email: userParams[1], phone: userParams[2]);
      users.add(user);
    }

    return users;
  }
}
