import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_coctail_bar/screens/coctails_view/coctails_view_home/coctails_view_home_body.dart';
import 'package:my_coctail_bar/screens/coctails_view/coctails_view_home/cubit/coctails_view_home_cubit.dart';

class CoctailViewHomeScreen extends StatelessWidget {
  const CoctailViewHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => CoctailViewHomeCubit()..init(),
        child: BlocBuilder<CoctailViewHomeCubit, CoctailsViewHomeState>(builder: (context, state) {
          if (state is CoctailViewHomeLoadingState) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state is CoctailViewHomeInfoState) {
            return CoctailViewHomeBody(
              state: state,
            );
          }
          return const Center(child: Text('Coś poszło nie tak'));
        }));
  }
}
