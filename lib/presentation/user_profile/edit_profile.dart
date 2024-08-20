import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {

  final TextEditingController _nameController= TextEditingController();
  final TextEditingController _emailController=TextEditingController();


  @override
  void initState() {

    super.initState();
    _loadProfile();
  }

  @override
  void dispose() {
    super.dispose();
  }

  Future<void> _loadProfile() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _nameController.text = prefs.getString('name')!;
      _emailController.text = prefs.getString('email')!;
      _nameController.clear();
      _emailController.clear();
    });
  }

  Future<void> _saveProfile() async {
    SharedPreferences localDB = await SharedPreferences.getInstance();
    await localDB.setString('name', _nameController.text);
    await localDB.setString('email', _emailController.text);
    Navigator.pop(context);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Profile')
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: TextFormField(
                  controller: _nameController,
                  decoration: const InputDecoration(
                      labelText: "Name",
                      fillColor: Colors.black,
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue, width: 2.0))),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: TextFormField(
                  controller: _emailController,
                  validator: (value) {
                    if(value == null || value.isEmpty || !value.contains('@') || !value.contains('.')){
                      return 'Invalid Email';
                    }
                    return null;
                  },

                  decoration: const InputDecoration(
                      labelText: "Email",
                      fillColor: Colors.black,
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue, width: 2.0))),
                ),
              ),
              ElevatedButton(
                onPressed: _saveProfile,
                child: const Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
