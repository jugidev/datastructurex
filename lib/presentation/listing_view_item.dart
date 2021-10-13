import 'package:datastructurex/application/listing_view_cubit.dart';
import 'package:datastructurex/domain/datastructurex.dart';
import 'package:datastructurex/presentation/listing_view_item_edit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ListingViewItem extends StatelessWidget {
  final DataStructureX dataStructureX;

  const ListingViewItem({Key? key, required this.dataStructureX})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0, left: 15.0, right: 15.0),
      child: InkWell(
        onLongPress: () {
          showDialog(
              context: context,
              builder: (ctx) {
                return ListingViewItemEdit(
                  dataStructureX: dataStructureX,
                  listingViewCubit: BlocProvider.of<ListingViewCubit>(context),
                );
              });
        },
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(dataStructureX.name),
                Text('${dataStructureX.anzahl}'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
