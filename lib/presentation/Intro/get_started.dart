import 'package:flutter/material.dart';
import 'package:user_profile/configuration/assets/app_images.dart';
import 'package:user_profile/presentation/User_Profile/user_profile.dart';

import '../../configuration/widgets/basic_app_button.dart';

class GetStartedPage extends StatefulWidget {
  const GetStartedPage({super.key});

  @override
  State<GetStartedPage> createState() => _GetStartedPageState();
}

class _GetStartedPageState extends State<GetStartedPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
          body: Stack(
            children: [
              Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(
                          AppImages.introBg
                      ),
                    fit: BoxFit.contain
                  )
                ),
              ),
              Container(
                color: Colors.black.withOpacity(0.15),
              ),
              Padding(padding: const EdgeInsets.symmetric(
                  vertical: 40,
                  horizontal: 40
              ),
                child: Column(
                  children: [

                    const Spacer(),
                    const Text(
                      'Welcome to  Assessment Report',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 21),
                    const Text(
                      'Code written by Sambid Dahal',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: Colors.grey,
                        fontSize: 13,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 20),
                    BasicAppButton(onPressed: (){
                      Navigator.pushNamed(
                          context,'/home');
                    },
                        title: 'Get Started'
                    )
                  ],
                ),
              )
            ],
          ),
    );
  }
}
