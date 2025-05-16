import 'package:flutter_bloc/flutter_bloc.dart';
import 'bottle_event.dart';
import 'bottle_state.dart';
import '../../data/models/bottle_model.dart';
import '../../data/repositories/bottle_repository.dart';

class BottleBloc extends Bloc<BottleEvent, BottleState> {
  final BottleRepository repository;

  BottleBloc(this.repository) : super(BottleLoading()) {
    on<LoadBottlesEvent>((event, emit) async {
      emit(BottleLoading());
      try {
        final bottles = await repository.fetchBottles();
        emit(BottleLoaded(bottles));
      } catch (e) {
        emit(BottleError("Failed to load bottles"));
      }
    });
  }
}