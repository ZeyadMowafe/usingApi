import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubit/cubit.dart';


class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});
final url = "https://www.linkedin.com/in/osamaelzero/";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Profile")),
      body: BlocBuilder<ProfileCubit, ProfileState>(
        builder: (context, state) {
          if (state is ProfileLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is ProfileLoaded) {
            final profile = state.profile;
            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.network(profile.profileImageUrl),
                Text(profile.fullName, style: const TextStyle(fontSize: 24)),
                Text(profile.about),
                const SizedBox(height: 20),
                ...profile.experiences.map((exp) => ListTile(
                  title: Text(exp.title),
                  subtitle: Text('${exp.company} (${exp.duration})'),
                )),
              ],
            );
          } else if (state is ProfileError) {
            return Center(child: Text("Error: ${state.message}"));
          } else {
            return const SizedBox();
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.refresh),
        onPressed: () => context.read<ProfileCubit>().fetchProfile(url),
      ),
    );
  }
}
