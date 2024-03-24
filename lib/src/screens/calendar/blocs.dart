import 'package:flutter_bloc/flutter_bloc.dart';

class ListReservationCubit extends Cubit<List<String>> {
  ListReservationCubit() : super([]);
  void add(String item) {
    emit(orderList(item));
  }

  List<String> orderList(String item) {
    List<String> list = state.toList();
    list.add(item);
    list.sort((a, b) => a.split('#')[1].compareTo(b.split('#')[1]));
    return list;
  }

  void delete(String item) {
    emit(state.where((element) => element != item).toList());
  }
}
