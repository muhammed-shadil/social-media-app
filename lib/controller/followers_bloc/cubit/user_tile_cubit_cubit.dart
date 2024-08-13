import 'package:flutter_bloc/flutter_bloc.dart';

class UserTileCubit extends Cubit<bool> {
  UserTileCubit(bool isFollow) : super(isFollow);

  void toggleFollow() {
    emit(!state);
  }
}
