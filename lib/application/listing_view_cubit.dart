import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:datastructurex/domain/datastructurex.dart';
import 'package:equatable/equatable.dart';

part 'listing_view_state.dart';

class ListingViewCubit extends Cubit<ListingViewState> {
  List<DataStructureX> _datastructurexList = [];

  ListingViewCubit() : super(ListingViewInitial());

  Future<void> initializeData() async {
    try {
      _datastructurexList = await Future.value(List.generate(
          15,
          (index) =>
              DataStructureX(name: 'DataStructure$index', anzahl: index)));
      emit(ListingViewLoaded(_datastructurexList));
    } on Exception {
      emit(const ListingViewError('Die Liste konnte nicht geladen werden.'));
    }
  }

  Future<void> updateData() async {
    try {
      emit(ListingViewLoaded(_datastructurexList));
    } on Exception {
      emit(const ListingViewError('Die Liste konnte nicht geladen werden.'));
    }
  }
}
