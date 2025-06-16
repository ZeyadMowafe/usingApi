class ProfileModel {
  final String fullName;
  final String about;
  final String company;
  final String profileImageUrl;
  final List<ExperienceModel> experiences;

  ProfileModel({
    required this.fullName,
    required this.about,
    required this.company,
    required this.profileImageUrl,
    required this.experiences,
  });

  factory ProfileModel.fromJson(Map<String, dynamic> json) {
    return ProfileModel(
      fullName: json['full_name'] ?? '',
      about: json['about'] ?? '',
      company: json['company'] ?? '',
      profileImageUrl: json['profile_image_url'] ?? '',
      experiences: (json['experiences'] as List?)?.map((e) => ExperienceModel.fromJson(e)).toList() ?? [],
    );
  }
}

class ExperienceModel {
  final String title;
  final String company;
  final String duration;

  ExperienceModel({
    required this.title,
    required this.company,
    required this.duration,
  });

  factory ExperienceModel.fromJson(Map<String, dynamic> json) {
    return ExperienceModel(
      title: json['title'] ?? '',
      company: json['company'] ?? '',
      duration: json['duration'] ?? '',
    );
  }
}
