// import 'dart:convert';
// import 'package:bkdschool/bloc/chat_bloc/chat_bloc.dart';
// import 'package:bkdschool/data/models/MessageModel.dart';
// import 'package:bkdschool/data/models/UserModel.dart';
// import 'package:bkdschool/data/repos/ChatRepo.dart';
// import 'package:bkdschool/data/repos/FireRepo.dart';
// import 'package:file_picker/file_picker.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart' show rootBundle;
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
// import 'package:flutter_chat_ui/flutter_chat_ui.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:mime/mime.dart';
// import 'package:open_file/open_file.dart';
// import 'package:uuid/uuid.dart';

// class Chatscreenn extends StatelessWidget {
//   const Chatscreenn({Key key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return const MaterialApp(
//       home: ChatPage(),
//     );
//   }
// }

// class ChatPage extends StatefulWidget {
//   const ChatPage({Key key}) : super(key: key);

//   @override
//   _ChatPageState createState() => _ChatPageState();
// }

// class _ChatPageState extends State<ChatPage> {
//   List<types.Message> _messages = [];
//   final _user = const types.User(id: '06c33e8b-e835-4736-80f4-63f44b66666c');
//   List<RMessage> messages = [];
//   List<RMessage> waitingMessages = [];
//   @override
//   void initState() {
//     super.initState();
//     _loadMessages();
//   }

// RUser currentUser;
//   @override
//   void initState() {
//     super.initState();
//     currentUser = FireRepo.instance.currentUser;
//     ChatRepo.instance.setContext(context);
//     BlocProvider.of<ChatBloc>(context)
//         .add(ChatEventLoadChat(widget.subject.docid));
//   }

//   void _addMessage(types.Message message) {
//     setState(() {
//       _messages.insert(0, message);
//     });
//   }

//   void _handleAtachmentPressed() {
//     showModalBottomSheet<void>(
//       context: context,
//       builder: (BuildContext context) {
//         return SizedBox(
//           height: 144,
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.stretch,
//             children: <Widget>[
//               TextButton(
//                 onPressed: () {
//                   Navigator.pop(context);
//                   _handleImageSelection();
//                 },
//                 child: const Align(
//                   alignment: Alignment.centerLeft,
//                   child: Text('Photo'),
//                 ),
//               ),
//               TextButton(
//                 onPressed: () {
//                   Navigator.pop(context);
//                   _handleFileSelection();
//                 },
//                 child: const Align(
//                   alignment: Alignment.centerLeft,
//                   child: Text('File'),
//                 ),
//               ),
//               TextButton(
//                 onPressed: () => Navigator.pop(context),
//                 child: const Align(
//                   alignment: Alignment.centerLeft,
//                   child: Text('Cancel'),
//                 ),
//               ),
//             ],
//           ),
//         );
//       },
//     );
//   }

//   void _handleFilePressed(types.FileMessage message) async {
//     await OpenFile.open(message.uri);
//   }

//   void _handleFileSelection() async {
//     final result = await FilePicker.platform.pickFiles(
//       type: FileType.any,
//     );

//     if (result != null) {
//       final message = types.FileMessage(
//         authorId: _user.id,
//         fileName: result.files.single.name ?? '',
//         id: const Uuid().v4(),
//         mimeType: lookupMimeType(result.files.single.path ?? ''),
//         size: result.files.single.size ?? 0,
//         timestamp: (DateTime.now().millisecondsSinceEpoch / 1000).floor(),
//         uri: result.files.single.path ?? '',
//       );

//       _addMessage(message);
//     } else {
//       // User canceled the picker
//     }
//   }

//   void _handleImageSelection() async {
//     final result = await ImagePicker().getImage(
//       imageQuality: 70,
//       maxWidth: 1440,
//       source: ImageSource.gallery,
//     );

//     if (result != null) {
//       final bytes = await result.readAsBytes();
//       final image = await decodeImageFromList(bytes);
//       final imageName = result.path.split('/').last;

//       final message = types.ImageMessage(
//         authorId: _user.id,
//         height: image.height.toDouble(),
//         id: const Uuid().v4(),
//         imageName: imageName,
//         size: bytes.length,
//         timestamp: (DateTime.now().millisecondsSinceEpoch / 1000).floor(),
//         uri: result.path,
//         width: image.width.toDouble(),
//       );

//       _addMessage(message);
//     } else {
//       // User canceled the picker
//     }
//   }

//   void _handlePreviewDataFetched(
//     types.TextMessage message,
//     types.PreviewData previewData,
//   ) {
//     final index = _messages.indexWhere((element) => element.id == message.id);
//     final currentMessage = _messages[index] as types.TextMessage;
//     final updatedMessage = currentMessage.copyWith(previewData);

//     WidgetsBinding.instance?.addPostFrameCallback((_) {
//       setState(() {
//         _messages[index] = updatedMessage;
//       });
//     });
//   }

//   void _handleSendPressed(types.PartialText message) {
//     final textMessage = types.TextMessage(
//       authorId: _user.id,
//       id: const Uuid().v4(),
//       text: message.text,
//       timestamp: (DateTime.now().millisecondsSinceEpoch / 1000).floor(),
//     );

//     _addMessage(textMessage);
//   }

//   void _loadMessages() async {
//     final response = await rootBundle.loadString('images/messages.json');
//     final messages = (jsonDecode(response) as List)
//         .map((e) => types.Message.fromJson(e as Map<String, dynamic>))
//         .toList();

//     setState(() {
//       _messages = messages;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Chat(
//         messages: _messages,
//         onAttachmentPressed: _handleAtachmentPressed,
//         onFilePressed: _handleFilePressed,
//         onPreviewDataFetched: _handlePreviewDataFetched,
//         onSendPressed: _handleSendPressed,
//         user: _user,
//       ),
//     );
//   }
// }
