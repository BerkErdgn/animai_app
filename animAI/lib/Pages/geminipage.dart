import 'package:dash_chat_2/dash_chat_2.dart';
import 'package:flutter_gemini/flutter_gemini.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class Geminipage extends StatefulWidget {
  const Geminipage({super.key});

  @override
  State<Geminipage> createState() => _GeminipageState();
}

class _GeminipageState extends State<Geminipage> {

  final Gemini gemini = Gemini.instance;
  List<ChatMessage> messages = [];

  ChatUser animaiUser = ChatUser(
      id: "0",
      firstName: "Ben");
  ChatUser geminiUser = ChatUser(
      id: "1",
      firstName: "Gemini",
      profileImage:"https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQV1QWx0soc08N7wU8LjH95wZTkF_q13tg1KH4AOTs3xw&s" );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Gemini Sohbet"),
      ),
      body: buildUI(),
    );
  }
  Widget buildUI() {
    return DashChat(
      inputOptions: InputOptions( trailing: [
      IconButton(
          onPressed: sendImages ,
          icon: Icon(Icons.image_search_outlined))]),
        currentUser: animaiUser,
        onSend: sendMessage,
        messages: messages);
  }
  void sendMessage(ChatMessage chatMessage) {
    setState(() {
      messages = [chatMessage, ...messages];
    });
    try{
      String question = chatMessage.text;
      gemini.streamGenerateContent(question).listen( (event) {
        ChatMessage? lastMessage = messages.firstOrNull;
        if(lastMessage!=null && lastMessage.user == geminiUser){
          lastMessage=messages.removeAt(0);
          String answer = event.content?.parts?.fold("",(previous, current) => "$previous ${current.text}") ?? "";
          lastMessage.text+=answer;
          setState(() {
            messages= [lastMessage!,...messages];
          });
        } else {
          String answer = event.content?.parts?.fold("",(previous, current) => "$previous ${current.text}") ?? "";
          ChatMessage message = ChatMessage(
              user: geminiUser,
              createdAt: DateTime.now(),
              text: answer );
          setState(() {
            messages = [message, ...messages];
          });
        }
      });
    } catch(e) {
      print(e);
    }
  }
  void sendImages() async {
    ImagePicker picker = ImagePicker();
    XFile? file = await picker.pickImage(source: ImageSource.gallery,
    );
  }
}


