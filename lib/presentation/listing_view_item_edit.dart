import 'package:datastructurex/application/listing_view_cubit.dart';
import 'package:datastructurex/domain/datastructurex.dart';
import 'package:flutter/material.dart';

class ListingViewItemEdit extends StatefulWidget {
  final ListingViewCubit listingViewCubit;
  final DataStructureX dataStructureX;

  const ListingViewItemEdit(
      {Key? key, required this.dataStructureX, required this.listingViewCubit})
      : super(key: key);

  @override
  State<ListingViewItemEdit> createState() => _ListingViewItemEditState();
}

class _ListingViewItemEditState extends State<ListingViewItemEdit> {
  final TextEditingController _countController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            widget.dataStructureX.name,
            style: const TextStyle(
              decoration: TextDecoration.underline,
            ),
          ),
          Column(
            children: [
              const Text('Neue Anzahl:'),
              Padding(
                padding: const EdgeInsets.only(left: 100.0, right: 100.0),
                child: TextField(
                  keyboardType: TextInputType.number,
                  controller: _countController,
                  autofocus: true,
                ),
              ),
            ],
          ),
          TextButton(
              onPressed: () {
                widget.dataStructureX.anzahl =
                    int.tryParse(_countController.text);
                widget.listingViewCubit.updateData();
                Navigator.pop(context);
              },
              child: const Text('OK'),
              style: ButtonStyle(
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                          side: const BorderSide(color: Colors.lightBlue))))),
        ],
      ),
    );
  }
}
