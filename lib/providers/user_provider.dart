
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_json/services/user_service.dart';

final userProvider = FutureProvider((ref) => UserService.getUsers());






