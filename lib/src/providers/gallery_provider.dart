import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpoddemo/src/services/services.dart';

import '../data/models/photo.dart';

final apiServiceProvider = Provider<ApiServices>((ref) => ApiServices());

// Async Notifier for API data
final galleryProvider = FutureProvider<List<Photo>>((ref) async {
  final apiService = ref.read(apiServiceProvider);
  return apiService.fetchPhotos();
});