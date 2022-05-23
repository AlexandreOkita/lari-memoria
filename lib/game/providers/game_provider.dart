import 'package:flutter_riverpod/flutter_riverpod.dart';

final chosenCardsProvider = StateProvider<List<String>>((ref) {
  return [];
});

final willForceFlipProvider = StateProvider<bool>((ref) {
  return false;
});

final correctCardsProvider = StateProvider<List<String>>((ref) {
  return [];
});

final isClickableProvider = StateProvider<bool>((ref) {
  return true;
});