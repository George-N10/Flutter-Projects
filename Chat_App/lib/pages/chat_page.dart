import 'package:chat_app/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import '../constants.dart';
import '../models/message.dart';
import '../widgets/chat_buble.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ChatPage extends StatefulWidget {
  static String id = 'ChatPage';
  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final TextEditingController controller = TextEditingController();
  final _scrollController = ScrollController();

  CollectionReference messages = FirebaseFirestore.instance.collection(
    kMessagesCollection,
  );

  // دالة الإرسال الموحدة
  void sendMessage(String email) {
    if (controller.text.trim().isNotEmpty) {
      messages.add({
        kMessage: controller.text,
        kCreatedAt: DateTime.now(),
        'id': email, // بنسجل الايميل عشان نعرف الرسالة دي بتاعت مين
      });
      controller.clear();
      // بما اننا عاملين reverse: true
      // فالنزول لأخر الشات معناه الذهاب للنقطة 0
      _scrollController.animateTo(
        0,
        duration: Duration(milliseconds: 250),
        curve: Curves.easeIn,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    // استقبال الايميل
    var email = ModalRoute.of(context)!.settings.arguments as String;

    return StreamBuilder<QuerySnapshot>(
      stream: messages.orderBy(kCreatedAt, descending: true).snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<Message> messagesList = [];
          for (int i = 0; i < snapshot.data!.docs.length; i++) {
            messagesList.add(Message.fromJson(snapshot.data!.docs[i]));
          }
          return Scaffold(
            backgroundColor: Color(0xffF0F2F5), // Light greyish background for modern chatting apps
            appBar: AppBar(
              automaticallyImplyLeading: true,
              iconTheme: IconThemeData(color: Colors.white),
              elevation: 2,
              shadowColor: Colors.black.withOpacity(0.5),
              backgroundColor: kPrimaryColor,
              centerTitle: true,
              title: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Hero(
                    tag: 'logo',
                    child: Image.asset(KLogo, height: 40),
                  ),
                  SizedBox(width: 8),
                  Text(
                    'Scholar Chat',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
            body: Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    reverse: true, // الشات بيبدأ من تحت
                    controller: _scrollController,
                    itemCount: messagesList.length,
                    itemBuilder: (context, index) {
                      // مقارنة الايميل لتحديد شكل الفقاعة
                      return messagesList[index].id == email
                          ? ChatBuble(message: messagesList[index])
                          : ChatBubleForFriend(message: messagesList[index]);
                    },
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.05),
                        offset: Offset(0, -2),
                        blurRadius: 10,
                      ),
                    ],
                  ),
                  child: SafeArea(
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              color: Color(0xffF0F2F5),
                              borderRadius: BorderRadius.circular(24),
                            ),
                            child: TextField(
                              controller: controller,
                              onSubmitted: (data) {
                                sendMessage(email);
                              },
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 14),
                                hintText: 'Type a message...',
                                hintStyle: TextStyle(color: Colors.grey[600]),
                                border: InputBorder.none,
                                enabledBorder: InputBorder.none,
                                focusedBorder: InputBorder.none,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 12),
                        GestureDetector(
                          onTap: () {
                            sendMessage(email);
                          },
                          child: Container(
                            height: 48,
                            width: 48,
                            decoration: BoxDecoration(
                              color: kPrimaryColor,
                              shape: BoxShape.circle,
                              boxShadow: [
                                BoxShadow(
                                  color: kPrimaryColor.withOpacity(0.4),
                                  blurRadius: 8,
                                  offset: Offset(0, 4),
                                ),
                              ],
                            ),
                            child: Center(
                              child: Icon(
                                Icons.send_rounded,
                                color: Colors.white,
                                size: 24,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        } else {
          return Scaffold(body: Center(child: CircularProgressIndicator()));
        }
      },
    );
  }
}
