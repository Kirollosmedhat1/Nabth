import 'package:application5/widgets/cont_chat.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Container(
            margin: EdgeInsets.all(15),
            child: InkWell(
              child: Image.asset(
                "images/back.png",
                height: 5,
              ),
            )),
        title: Column(
          mainAxisAlignment:
              MainAxisAlignment.center, // Adjust alignment as needed
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Aromatic Plant Growing",
                style: TextStyle(fontSize: 20, color: Color(0xff4F795B))),
            Row(
              children: [
                Icon(
                  Icons.group,
                  size: 20,
                  color: Color(0xff67717A),
                ),
                SizedBox(width: 5),
                Text("10k Members",
                    style: TextStyle(
                        fontSize: 14,
                        color: Color(
                            0xff67717A))), // Adjust the font size as needed
              ],
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              height: 700,
              width: 600,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('images/imagesss.jpg'), // Background image
                  fit: BoxFit.cover,
                ),
              ),
              child: ListView(
                padding: EdgeInsets.all(20),
                children: [
                  cont_chat(
                      Image: "cCCc.png",
                      text1:
                          'If you grow your rosemary outdoors in the garden, when you have to water your rosemary is often determined by the weather. Obviously, in summer, when it’s hot, and there’s no rain, your plants will require more frequent watering.'),
                  cont_chat(
                      Image: "cCCc.png",
                      text1:
                          'If you grow your rosemary outdoors in the garden, when you have to water your rosemary is often determined by the weather. Obviously, in summer, when it’s hot, and there’s no rain, your plants will require more frequent watering.'),
                  cont_chat(
                      Image: "cCCc.png",
                      text1:
                          'If you grow your rosemary outdoors in the garden, when you have to water your rosemary is often determined by the weather. Obviously, in summer, when it’s hot, and there’s no rain, your plants will require more frequent watering.'),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: 'Type your message here...',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 10),
                InkWell(
                    child: Image.asset(
                  "images/Vector.png",
                  color: Colors.grey,
                )),
                SizedBox(
                  width: 2,
                ),
                InkWell(
                    child: Image.asset(
                  "images/++.png",
                  color: Colors.grey,
                )),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ChatBubble extends StatelessWidget {
  final String text;
  final bool isMe;

  const ChatBubble({
    Key? key,
    required this.text,
    required this.isMe,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
      children: [
        if (!isMe) ...[
          CircleAvatar(
            // User avatar for messages from others
            backgroundColor: Colors.blue,
            child: Icon(Icons.person),
          ),
          SizedBox(width: 10),
        ],
        Expanded(
          child: Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: isMe ? Colors.grey.shade200 : Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
                bottomLeft: isMe ? Radius.circular(20) : Radius.zero,
                bottomRight: !isMe ? Radius.circular(20) : Radius.zero,
              ),
            ),
            child: Text(
              text,
              style: TextStyle(fontSize: 16),
            ),
          ),
        ),
      ],
    );
  }
}
