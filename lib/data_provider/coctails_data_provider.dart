import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:my_coctail_bar/models/coctail/coctail.dart';
import 'package:my_coctail_bar/models/coctail/coctail_write_request.dart';
import 'package:my_coctail_bar/schema/coctails_fields.dart';
import 'package:my_coctail_bar/schema/collections.dart';
import 'package:my_coctail_bar/service_locator.dart';

class CoctailsDataProvider {
  final FirebaseFirestore _firebaseFirestore = sl();

  Future<Map<String, Coctail>> fetchCoctailWithId(String coctailId) async {
    final QuerySnapshot<Map<String, dynamic>> result =
        await _firebaseFirestore.collection(Collections.coctails).where(CoctailsFields.id, isEqualTo: coctailId).get();

    final Map<String, Coctail> coctail = <String, Coctail>{};

    for (QueryDocumentSnapshot<Map<String, dynamic>> doc in result.docs) {
      coctail[doc.id] = Coctail.fromJson(doc.data()..['id'] = doc.id);
    }

    return coctail;
  }

  Future<Map<String, Coctail>> fetchAllCoctails() async {
    final QuerySnapshot<Map<String, dynamic>> result = await _firebaseFirestore.collection(Collections.coctails).get();

    final Map<String, Coctail> coctails = <String, Coctail>{};

    for (QueryDocumentSnapshot<Map<String, dynamic>> doc in result.docs) {
      final Coctail coctail = Coctail.fromJson(doc.data()..['id'] = doc.id);
      coctails[doc.id] = coctail;
    }

    return coctails;
  }

  Stream<List<Coctail>> getCoctailsStream() {
    return _firebaseFirestore.collection(Collections.coctails).snapshots().map(
      (querySnapshot) {
        return querySnapshot.docs.map(
          (doc) {
            return Coctail.fromJson(doc.data()..['id'] = doc.id);
          },
        ).toList();
      },
    );
  }

  Future<void> createCoctail({
    required CoctailWriteRequest coctailWriteRequest,
  }) {
    return _firebaseFirestore.collection(Collections.coctails).add(coctailWriteRequest.toJson());
  }
}
