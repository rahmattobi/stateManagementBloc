import 'package:bloc/bloc.dart';

class UserBloc extends Cubit<Map<String, dynamic>> {
  UserBloc() : super({"nama": "-", "umur": 0});

  void changeName(String newName) {
    emit({
      "nama": newName,
      "umur": state['umur'],
    });
  }

  void changeAge(int umur) {
    emit({
      "nama": state['nama'],
      "umur": umur,
    });
  }
}
