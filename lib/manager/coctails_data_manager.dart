import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:my_coctail_bar/data_provider/coctails_data_provider.dart';
import 'package:my_coctail_bar/models/coctail/coctail.dart';
import 'package:my_coctail_bar/models/coctail/coctail_write_request.dart';
import 'package:my_coctail_bar/service_locator.dart';

class CoctailsDataManager {
  final CoctailsDataProvider _coctailsDataProvider = sl();

  Future<void> fetch() async {
    _coctailsDataProvider.fetchAllCoctails();
  }

  Stream<List<Coctail>> getAllCoctails() {
    return _coctailsDataProvider.getCoctailsStream();
  }

  Future<void> create(
    CoctailWriteRequest coctailWriteRequest,
  ) async {
    try {
      await _coctailsDataProvider.createCoctail(
        coctailWriteRequest: coctailWriteRequest,
      );
      await fetch();
    } catch (e) {
      Fluttertoast.showToast(
        msg: 'Coś poszło nie tak: $e',
        gravity: ToastGravity.TOP,
        backgroundColor: Colors.red,
      );
    }
  }
}
