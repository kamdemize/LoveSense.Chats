import 'package:flutter/material.dart';
import 'package:matchforlive/data/init.dart';
import 'package:matchforlive/models/message_model.dart';
import 'package:matchforlive/models/user_model.dart';

class ChatPage extends StatefulWidget {
  final User user;

  ChatPage({required this.user});

  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  _buildMessage(Message message, bool isMe) {
    final Container msg = Container(
      margin: isMe
          ? const EdgeInsets.only(
              top: 8.0,
              bottom: 8.0,
              left: 80.0,
            )
          : const EdgeInsets.only(
              top: 8.0,
              bottom: 8.0,
            ),
      padding: EdgeInsets.symmetric(horizontal: 25.0, vertical: 15.0),
      width: MediaQuery.of(context).size.width * 0.75,
      decoration: BoxDecoration(
        color: isMe ? Theme.of(context).accentColor : Colors.purple[50],
        borderRadius: isMe
            ? const BorderRadius.only(
                topLeft: Radius.circular(15.0),
                bottomLeft: Radius.circular(15.0),
              )
            : const BorderRadius.only(
                topRight: Radius.circular(15.0),
                bottomRight: Radius.circular(15.0),
              ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(message.time,
              style: const TextStyle(
                  color: Colors.blueGrey,
                  fontSize: 16.0,
                  fontWeight: FontWeight.w600)),
          SizedBox(height: 8.0),
          Text(message.text,
              style: const TextStyle(
                  color: Colors.blueGrey,
                  fontSize: 16.0,
                  fontWeight: FontWeight.w600)),
        ],
      ),
    );

    if (isMe) {
      return msg;
    }

    return Row(
      children: [
        msg,
        IconButton(
          icon: message.isLiked
              ? const Icon(Icons.favorite)
              : const Icon(Icons.favorite_border),
          iconSize: 30.0,
          color: message.isLiked
              ? Theme.of(context).primaryColor
              : Colors.blueGrey,
          onPressed: () {},
        )
      ],
    );
  }

  _buildMessageComposer() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8.0),
      height: 70.0,
      color: Colors.white,
      child: Row(
        children: [
          IconButton(
            icon: Icon(Icons.photo),
            iconSize: 25.0,
            color: Theme.of(context).primaryColor,
            onPressed: () {},
          ),
          const Expanded(
            child: TextField(
              textCapitalization: TextCapitalization.sentences,
              decoration: InputDecoration.collapsed(
                hintText: 'Send message...',
              ),
            ),
          ),
          IconButton(
            icon: Icon(Icons.send),
            iconSize: 25.0,
            color: Theme.of(context).primaryColor,
            onPressed: () {},
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
          title: Center(
            child: Text(
              widget.user.name,
              style: const TextStyle(
                fontSize: 28.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          elevation: 0.0,
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.more_horiz),
              iconSize: 30.0,
              color: Colors.white,
              onPressed: () {},
            )
          ]),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Column(
          children: [
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30.0),
                    topRight: Radius.circular(30.0),
                  ),
                ),
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(30.0),
                    topRight: Radius.circular(30.0),
                  ),
                  child: ListView.builder(
                    reverse: true,
                    padding: EdgeInsets.only(top: 15.0),
                    itemCount: messages.length,
                    itemBuilder: (BuildContext context, int index) {
                      final message = messages[index];
                      bool isMe = message.sender.id == currentUser.id;

                      return _buildMessage(message, isMe);
                    },
                  ),
                ),
              ),
            ),
            _buildMessageComposer(),
          ],
        ),
      ),
    );
  }
}
