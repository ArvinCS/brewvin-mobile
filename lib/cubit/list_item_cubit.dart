import 'package:flutter_bloc/flutter_bloc.dart';

import '../models/coffee_bean.dart';

class ListItemCubit extends Cubit<List<CoffeeBean>> {
  ListItemCubit() : super([]);

  void addItem(CoffeeBean newBean) => emit(state + [newBean]);
}
