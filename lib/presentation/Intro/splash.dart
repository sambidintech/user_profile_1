import 'package:flutter/material.dart';
import 'package:user_profile/configuration/assets/app_images.dart';
import 'package:user_profile/presentation/Intro/get_started.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> with TickerProviderStateMixin {


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    redirect();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body:  Center(
        child: ClipOval(
          child: Image.asset(
              AppImages.logo,
            height: 200,
            width: 200,
          ),
        )
      ),
    );
  }
  Future<void> redirect() async{
    await Future.delayed(const Duration(seconds: 3));
    Navigator.push(context,
    MaterialPageRoute(builder: (context)=>const GetStartedPage()));
  }


}

