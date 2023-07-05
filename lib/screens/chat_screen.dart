import 'package:cbot/widgets/chat_widget.dart';
import 'package:cbot/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../constant/constant.dart';
import '../services/asset_manager.dart';
import '../services/services.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final bool _istyping = true;

  late TextEditingController textEditingController;

  @override
  void initState() {
    textEditingController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 2,
        leading: Padding(
          padding: const EdgeInsets.all(8.0), 
      child:  Image.asset(Assetsmanager.openaiLogo),
      ),
      title: const Text("Chat Bot"),actions: [
        IconButton(
          onPressed: () async{
          await Services.showModalSheet(context: context);
      }, icon: const Icon(Icons.more_horiz_sharp, color: Colors.greenAccent),
      ),
      ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            Flexible(
             child:
          ListView.builder(
            itemCount: 6,
            itemBuilder: (context, index){
            return  ChatWidget(
              msg: chatMessages[index]["msg"].toString(),
              chatIndex: int.parse(chatMessages[index]["chatIndex"].toString()),
            );
          }),
          ),
          if(_istyping) ...[
            const SpinKitThreeBounce(
              color: Colors.green,
              size :18,
            ),
        SizedBox(height: 15,),
            Material(
              color: cardcolor,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
              child: Row(
            children:[
              Expanded(
                child: TextField(
                  style: TextStyle(color: Colors.white),
                controller: textEditingController,
                onSubmitted: (value){
                },
                decoration: InputDecoration.collapsed(
                  hintText: "How can I help You ? ",
                hintStyle: TextStyle(color: Colors.grey)),
                ),
              ),
              IconButton(onPressed: (){}, icon: Icon(Icons.send, color: Colors.greenAccent,))
            ],
           ),
          ),
          ),
          ]   
         ],
        )
      )
    );
  }
}

