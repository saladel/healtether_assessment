import 'package:flutter/foundation.dart';
import 'package:healtether_assessment/model/user_model.dart';
import 'package:healtether_assessment/networking/user_service.dart';

enum UserState { loading, loaded, error }

class UserProvider with ChangeNotifier {
  UserState _state = UserState.loading;
  List<User> _users = [];
  List<User> _filteredUsers = [];
  String _error = '';
  String _searchQuery = '';

  UserState get state => _state;
  List<User> get users => _filteredUsers;
  String get error => _error;

  final UserService _userService;

  UserProvider({required UserService userService}) : _userService = userService {
    fetchUsers();
  }

  Future<void> fetchUsers() async {
    _state = UserState.loading;
    _error = '';
    notifyListeners();

    try {
      _users = await _userService.fetchUsers();
      _applySearch();
      _state = UserState.loaded;
    } catch (e) {
      _error = e.toString();
      _state = UserState.error;
    }

    notifyListeners();
  }

  void searchUsers(String query) {
    _searchQuery = query.toLowerCase();
    _applySearch();
    notifyListeners();
  }

  void _applySearch() {
    if (_searchQuery.isEmpty) {
      _filteredUsers = List.from(_users);
    } else {
      _filteredUsers = _users
          .where((user) => user.name.toLowerCase().contains(_searchQuery))
          .toList();
    }
  }
}