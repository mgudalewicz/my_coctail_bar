part of 'coctails_view_home_cubit.dart';

abstract class CoctailsViewHomeState extends Equatable {
  const CoctailsViewHomeState();

  @override
  List<dynamic> get props => <dynamic>[];
}

class CoctailViewHomeLoadingState extends CoctailsViewHomeState {
  const CoctailViewHomeLoadingState();
}

class CoctailViewHomeInfoState extends CoctailsViewHomeState {
  const CoctailViewHomeInfoState({
    required this.coctails,
  });
  final List<Coctail> coctails;

  @override
  List<dynamic> get props => <dynamic>[
        coctails,
      ];
}

class CoctailViewHomeErrorState extends CoctailsViewHomeState {
  const CoctailViewHomeErrorState({
    required this.error,
  });

  final String error;

  @override
  List<dynamic> get props => <dynamic>[
        error,
      ];
}
