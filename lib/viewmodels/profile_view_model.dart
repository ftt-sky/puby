import 'package:puby/models/user_model.dart';
import 'package:puby/puby_page.dart';
import 'package:puby/tool_index.dart';

class ProfileState {
  final UserModel user;
  final PageState pageState;
  final BaseError error;

  ProfileState({this.user, this.pageState, this.error});

  ProfileState.initial()
      : user = null,
        pageState = PageState.initializedState,
        error = null;

  ProfileState copyWith(
      {UserModel model, PageState pageState, BaseError error}) {
    return ProfileState(
        user: user ?? this.user,
        pageState: pageState ?? this.pageState,
        error: error ?? this.error);
  }
}

class PrifileViewModel extends StateNotifier<ProfileState> {
  PrifileViewModel(int userId, [ProfileState state])
      : super(state ?? ProfileState.initial());

  // 获取用户信息
  Future<void> getUserInfo(int userId) async {
    if (state.pageState == PageState.initializedState) {
      state = state.copyWith(pageState: PageState.busyState);
    }
  }
}
