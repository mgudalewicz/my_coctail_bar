import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_coctail_bar/screens/coctails_view/coctails_view_details/coctails_view_details_body.dart';
import 'package:my_coctail_bar/screens/coctails_view/coctails_view_details/cubit/coctails_view_details_cubit.dart';

class CoctailViewDetailsScreen extends StatelessWidget {
  const CoctailViewDetailsScreen({
    Key? key,
    required this.id,
  }) : super(key: key);

  final String id;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => CoctailsViewDetailsCubit()..init(id),
        child: BlocBuilder<CoctailsViewDetailsCubit, CoctailsViewDetailsState>(builder: (context, state) {
          if (state is CoctailViewDetailsLoadingState) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state is CoctailViewDetailsInfoState) {
            return CoctailViewDetailsBody(
              state: state,
            );
          }
          return const Center(child: Text('Coś poszło nie tak'));
        }));
  }
}
