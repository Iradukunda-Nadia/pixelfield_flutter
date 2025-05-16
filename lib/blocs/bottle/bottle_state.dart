import '../../data/models/bottle_model.dart';

abstract class BottleState {}

class BottleLoading extends BottleState {}

class BottleLoaded extends BottleState {
  final List<Bottle> bottles;
  BottleLoaded(this.bottles);
}

class BottleError extends BottleState {
  final String message;
  BottleError(this.message);
}