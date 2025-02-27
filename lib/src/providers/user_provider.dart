// API Service Provider
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpoddemo/src/services/services.dart';

import '../data/models/user.dart';

final apiServiceProvider = Provider<ApiServices>((ref) => ApiServices());

// Async Notifier for API data
final userProvider = FutureProvider<List<User>>((ref) async {
  final apiService = ref.read(apiServiceProvider);
  return apiService.fetchUsers();
});