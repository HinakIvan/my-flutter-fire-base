import 'package:flutter/material.dart';

// class ChatScreen extends StatelessWidget {
//   const ChatScreen({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: StreamBuilder(stream:FirebaseFirestore.instance
//           .collection('chats/HM0ikzwscoMKMrVc7xGA/messages')
//           .snapshots(),builder:(ctx, streamSnapshot){
//         if (streamSnapshot.connectionState == ConnectionState.waiting){return Center(child: CircularProgressIndicator(),);}
//         final documents = ;
//         return  ListView.builder(
//     itemCount: 4 ,
//     itemBuilder: (context, index) => Container(
//     padding: EdgeInsets.all(8),
//     child: Text(streamSnapshot.data.documents[index]['text']),
//     )) ;
//     }),
//       floatingActionButton: FloatingActionButton(
//         child: Icon(Icons.add),
//         onPressed: () {}),
//
//   );
// }}
