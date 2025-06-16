

import 'package:api2/features/data/service.dart';

import 'model.dart';

class ProfileRepository {
  final ProfileService _service = ProfileService();



  Future<ProfileModel> getProfile(String url) async {
    final data = await _service.fetchProfile(url);
    return ProfileModel.fromJson(data);
  }
}
