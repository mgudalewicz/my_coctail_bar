import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:my_coctail_bar/manager/coctails_data_manager.dart';
import 'package:my_coctail_bar/models/coctail/coctail.dart';
import 'package:my_coctail_bar/service_locator.dart';

part 'coctails_view_home_state.dart';

class CoctailViewHomeCubit extends Cubit<CoctailsViewHomeState> {
  CoctailViewHomeCubit() : super(const CoctailViewHomeLoadingState());

  final CoctailsDataManager _coctailsDataManager = sl();

  StreamSubscription<dynamic>? _subscription;

  Future<void> init() async {
    await _coctailsDataManager.fetch();

    _subscription = _coctailsDataManager.getAllCoctails().listen((List<Coctail> coctailList) {
      if (coctailList.isEmpty) {
        emit(const CoctailViewHomeErrorState(error: 'Brak koktajli'));
        return;
      }
      emit(CoctailViewHomeInfoState(
        coctails: coctailList,
      ));
    });
  }

  @override
  Future<void> close() {
    _subscription?.cancel();
    return super.close();
  }
}

