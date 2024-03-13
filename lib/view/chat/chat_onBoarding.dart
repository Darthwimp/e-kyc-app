import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:kommunicate_flutter/kommunicate_flutter.dart';

class ChatOnboard extends StatelessWidget {
  const ChatOnboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(width: double.infinity),
          Image.asset("assets/logo/chatbot-logo.png"),
          Gap(35.h),
          Text(
            "Hi, I'm Chatty",
            style: Theme.of(context).textTheme.titleLarge,
          ),
          Gap(25.h),
          Text(
            "I will be helping you with the entire \nKYC process",
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          Gap(40.h),
          GestureDetector(
              child: Image.asset("assets/logo/play-button.png"),
              onTap: () async {
                dynamic conversationObject = {
                  'appId': "27d8a1678cef67181a9a038453fd40c99",
                  'isSingleConversation': false
                };

                KommunicateFlutterPlugin.buildConversation(conversationObject)
                    .then((result) {
                  print("Conversation builder success: " +
                      result
                          .toString()); //result.toString() will be the clientChannelKey
                }).catchError((error) {
                  print("Conversation builder error occurred : " +
                      error.toString());
                });
              }),
        ],
      ),
    );
  }
}
