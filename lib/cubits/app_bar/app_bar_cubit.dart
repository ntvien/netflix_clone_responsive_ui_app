// ignore: import_of_legacy_library_into_null_safe
import 'package:bloc/bloc.dart';

class AppBarCubit extends Cubit<double>{
  AppBarCubit(): super(0);

  void setOffset(double offset) => emit(offset);
}