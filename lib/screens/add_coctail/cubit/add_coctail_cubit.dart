import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'add_coctail_state.dart';

class AddCoctailCubit extends Cubit<AddCoctailState> {
  AddCoctailCubit() : super(AddCoctailInitial());
}
