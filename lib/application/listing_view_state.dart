part of 'listing_view_cubit.dart';

abstract class ListingViewState extends Equatable {
  const ListingViewState();
}

class ListingViewInitial extends ListingViewState {
  final List<DataStructureX> datastructurexList = [];

  ListingViewInitial();

  @override
  List<Object> get props => [datastructurexList];

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ListingViewInitial &&
        other.datastructurexList == datastructurexList;
  }

  @override
  int get hashCode => datastructurexList.hashCode;
}

class ListingViewLoaded extends ListingViewState {
  final List<DataStructureX> datastructurexList;

  const ListingViewLoaded(this.datastructurexList);

  @override
  List<Object> get props => [datastructurexList];

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    bool change = false;
    if (other is ListingViewLoaded) {
      if (other.datastructurexList != datastructurexList) {
        change = true;
      }
      for (int i = 0; i < other.datastructurexList.length; i++) {
        if (other.datastructurexList[i].anzahl !=
            datastructurexList[i].anzahl) {
          change = true;
          break;
        }
      }
    }
    return other is ListingViewLoaded && change;
  }

  @override
  int get hashCode => datastructurexList.hashCode;
}

class ListingViewError extends ListingViewState {
  final String message;

  const ListingViewError(this.message);

  @override
  List<Object> get props => [message];

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ListingViewError && other.message == message;
  }

  @override
  int get hashCode => message.hashCode;
}
