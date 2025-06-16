import 'package:dio/dio.dart';

class ProfileService {
  final Dio dio = Dio(
   BaseOptions(
     headers: {'x-rapidapi-key': '4a0afb43c5msh0c7ae7efd89aa0cp126be1jsn1325e1ef1cba',
       'x-rapidapi-host': 'fresh-linkedin-profile-data.p.rapidapi.com'}
   )
  );



  Future<Map<String, dynamic>> fetchProfile( String url) async {

    final baseUrl = 'https://fresh-linkedin-profile-data.p.rapidapi.com';
    final response = await dio.get('$baseUrl/get-linkedin-profile?linkedin_url=$url%2Fin%2Fosamaelzero%2F&include_skills=false&include_certifications=false&include_publications=false&include_honors=false&include_volunteers=false&include_projects=false&include_patents=false&include_courses=false&include_organizations=false&include_profile_status=false&include_company_public_url=false');
    return response.data['data'];
  }
}
