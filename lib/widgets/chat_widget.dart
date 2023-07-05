
import 'package:flutter/material.dart';
import '../constant/constant.dart';
import '../services/asset_manager.dart';
import 'text_widget.dart';

class ChatWidget extends StatelessWidget {
  const ChatWidget({super.key , required this.chatIndex,required this.msg});
 final String msg;
 final int chatIndex;
  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        Material(
          color: chatIndex == 0 ? scaffoldBackgroundColor : cardcolor,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                  chatIndex ==0 ? Assetsmanager.userImage : Assetsmanager.botImage,
                height: 30,
                width: 30,
                ),
                  const SizedBox(
                    width: 8,
                    ),
               Expanded(
                 child:  TextWidget(
                  label:msg,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}