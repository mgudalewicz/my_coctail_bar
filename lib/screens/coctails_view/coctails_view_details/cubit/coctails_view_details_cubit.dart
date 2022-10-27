import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:my_coctail_bar/manager/coctails_data_manager.dart';
import 'package:my_coctail_bar/models/coctail/coctail.dart';
import 'package:my_coctail_bar/service_locator.dart';

part 'coctails_view_details_state.dart';

class CoctailsViewDetailsCubit extends Cubit<CoctailsViewDetailsState> {
  CoctailsViewDetailsCubit() : super(const CoctailViewDetailsLoadingState());

  final CoctailsDataManager _coctailsDataManager = sl();

  StreamSubscription<dynamic>? _subscription;

  Future<void> init(String id) async {
    await _coctailsDataManager.fetch();

    _subscription = _coctailsDataManager.getAllCoctails().listen((List<Coctail> coctailList) {
      Coctail coctail = coctailList.firstWhere((Coctail coctail) => coctail.id == id);
      emit(CoctailViewDetailsInfoState(
        coctail: coctail,
      ));
    });
  }

  @override
  Future<void> close() {
    _subscription?.cancel();
    return super.close();
  }
}
