import 'package:flutter_bloc/flutter_bloc.dart';
import '../data/model.dart';
import '../data/repo.dart';
part 'state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  final ProfileRepository repository;

  ProfileCubit(this.repository) : super(ProfileInitial());

  Future<void> fetchProfile(String url) async {
    emit(ProfileLoading());
    try {
      final profile = await repository.getProfile(url);
      emit(ProfileLoaded(profile));
    } catch (e) {
      emit(ProfileError(e.toString()));
    }
  }
}
