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
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is ListingViewInitial &&
        o.datastructurexList == datastructurexList;
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
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    bool change = false;
    if (o is ListingViewLoaded) {
      if (o.datastructurexList == datastructurexList) {
        change = false;
      }
      for (int i = 0; i < o.datastructurexList.length; i++) {
        if (o.datastructurexList[i].anzahl != datastructurexList[i].anzahl) {
          change = true;
          break;
        }
      }
    }
    return o is ListingViewLoaded && change;
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
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is ListingViewError && o.message == message;
  }

  @override
  int get hashCode => message.hashCode;
}
