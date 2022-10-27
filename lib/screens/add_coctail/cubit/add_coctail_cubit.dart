import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:my_coctail_bar/manager/coctails_data_manager.dart';
import 'package:my_coctail_bar/models/coctail/coctail_write_request.dart';
import 'package:my_coctail_bar/service_locator.dart';

part 'add_coctail_state.dart';

class AddCoctailCubit extends Cubit<AddCoctailState> {
  AddCoctailCubit() : super(const AddCoctailState());

  final CoctailsDataManager _coctailsDataManager = sl();

  Future<void> create({
    required String name,
    required String recipe,
    required int strength,
  }) async {
    final CoctailWriteRequest coctailWriteRequest = CoctailWriteRequest(
      name: name,
      recipe: recipe,
      strength: strength,
    );
    try {
      await _coctailsDataManager.create(coctailWriteRequest);
    } catch (error) {
      Fluttertoast.showToast(
        msg: 'Coś poszło nie tak: $error',
        gravity: ToastGravity.TOP,
        backgroundColor: Colors.red,
      );
      return;
    }
    Fluttertoast.showToast(
      msg: 'Koktajl został dodany',
      gravity: ToastGravity.TOP,
      backgroundColor: Colors.green,
    );
  }
}
