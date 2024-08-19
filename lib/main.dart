import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:user_profile/configuration/theme/app_theme.dart';
import 'package:user_profile/presentation/Intro/splash.dart';
import 'package:user_profile/presentation/User_Post/user_post.dart';
import 'package:user_profile/presentation/User_Profile/user_profile.dart';
import 'package:user_profile/presentation/home/homepage.dart';
import 'package:user_profile/presentation/provider/post_provider.dart';


Future<void> main() async{
  runApp(
      ChangeNotifierProvider(create: (context)=>PostProvider(),
      child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: AppTheme.darkTheme,
      debugShowCheckedModeBanner: false,
        home: const SplashPage(),
        routes: {
          '/home':(context)=>const Homepage(),
          '/profile':(context)=>const UserProfilePage(),
          '/post':(context)=>const UserPost(),
        },
      );
  }
}
