import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:user_profile/configuration/assets/app_images.dart';
import 'edit_profile.dart';

class UserProfilePage extends StatefulWidget {
  const UserProfilePage({super.key});

  @override
  State<UserProfilePage> createState() => _UserProfilePageState();
}

class _UserProfilePageState extends State<UserProfilePage> {

  String _name='Sambid Dahal';
  String _email='dahalsambid@gmail.com';


  @override
  void initState() {
    super.initState();
    _loadProfile();
  }

  Future<void> _loadProfile() async {

    SharedPreferences localDB = await SharedPreferences.getInstance();
    setState(() {
      _name = localDB.getString('name') ?? 'Sambid Dahal';
      _email = localDB.getString('email') ?? 'sambid333@gmail.com';
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('User Profile'),
      automaticallyImplyLeading: false,
      centerTitle: true,),
      body: Align(
        alignment: Alignment.center,
        child: Column(
          children: [
            const SizedBox(height: 200,),
            const CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage(AppImages.proPic),
            ),
            const SizedBox(height: 20),
            Text('Name: $_name', style: const TextStyle(fontSize: 20)),
            Text('Email: $_email', style: const TextStyle(fontSize: 16)),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                MaterialPageRoute(builder: (context)=>const EditProfile())).then((_) => _loadProfile()
                );
              },
              child: const Text('Edit Profile'),
            ),

          ],
        ),
      ),
    );
  }
}
