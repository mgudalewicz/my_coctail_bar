part of 'coctails_view_details_cubit.dart';

abstract class CoctailsViewDetailsState extends Equatable {
  const CoctailsViewDetailsState();

  @override
  List<dynamic> get props => <dynamic>[];
}

class CoctailViewDetailsLoadingState extends CoctailsViewDetailsState {
  const CoctailViewDetailsLoadingState();
}

class CoctailViewDetailsInfoState extends CoctailsViewDetailsState {
  const CoctailViewDetailsInfoState({
    required this.coctail,
  });
  final Coctail coctail;

  @override
  List<dynamic> get props => <dynamic>[
        coctail,
      ];
}

class CoctailViewDetailsErrorState extends CoctailsViewDetailsState {
  const CoctailViewDetailsErrorState({
    required this.error,
  });

  final String error;

  @override
  List<dynamic> get props => <dynamic>[
        error,
      ];
}
