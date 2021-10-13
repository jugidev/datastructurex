import 'package:datastructurex/application/listing_view_cubit.dart';
import 'package:datastructurex/presentation/listing_view_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ListingView extends StatefulWidget {
  const ListingView({Key? key}) : super(key: key);

  @override
  State<ListingView> createState() => _ListingViewState();
}

class _ListingViewState extends State<ListingView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DataStructureX'),
      ),
      body: BlocBuilder<ListingViewCubit, ListingViewState>(
        builder: (context, state) {
          if (state is ListingViewInitial) {
            BlocProvider.of<ListingViewCubit>(context).initializeData();
            return const Center(child: CircularProgressIndicator());
          } else if (state is ListingViewLoaded) {
            return ListView.builder(
                itemCount: state.datastructurexList.length,
                padding: const EdgeInsets.only(top: 20, bottom: 40),
                itemBuilder: (context, index) {
                  return ListingViewItem(
                      dataStructureX: state.datastructurexList[index]);
                });
          }
          return Container();
        },
      ),
    );
  }
}
