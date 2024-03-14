import 'package:easy_localization/easy_localization.dart';
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
            'Chatty'.tr(),
            style: Theme.of(context).textTheme.titleLarge,
          ),
          Gap(25.h),
          Text(
            'desc'.tr(),
            style: Theme.of(context).textTheme.bodyMedium,
            textAlign: TextAlign.center,
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
                print(
                    "Conversation builder success: $result"); //result.toString() will be the clientChannelKey
              }).catchError((error) {
                print("Conversation builder error occurred : $error");
              });
              await Future.delayed(const Duration(seconds: 60)).then((value) {
                KommunicateFlutterPlugin.closeConversationScreen();
                Navigator.pushNamed(
                    context, "/chat-onBoard/chat-interface/verify-kyc");
              });
            },
          ),
        ],
      ),
    );
  }
}
