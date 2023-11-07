import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // Este widget é a raiz do aplicativo.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'App de Mensagens',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const ChatScreen(),
    );
  }
}

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  // Este widget é a tela inicial do aplicativo.
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  // Este widget é o estado da tela inicial do aplicativo.
  final TextEditingController _textController = TextEditingController();
  final List<ChatMessage> _messages = [];

  void _handleSubmitted(String text) {
    // Esta função é chamada quando o usuário envia uma mensagem.
    _textController.clear();
    ChatMessage message = ChatMessage(
      text: text,
    );
    setState(() {
      // Atualiza o estado do aplicativo com a nova mensagem.
      _messages.insert(0, message);
    });
  }

  Widget _buildTextComposer() {
    // Este widget é o compositor de texto para digitar e enviar mensagens.
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Row(
        children: <Widget>[
          Flexible(
            child: TextField(
              controller: _textController,
              onSubmitted: _handleSubmitted,
              decoration:
                  const InputDecoration.collapsed(hintText: 'Digite uma mensagem'),
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 4.0),
            child: IconButton(
              icon: const Icon(Icons.send),
              onPressed: () => _handleSubmitted(_textController.text),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // Este widget é o construtor da tela inicial do aplicativo.
    return Scaffold(
      appBar: AppBar(
        title: const Text('App de Mensagens'),
      ),
      body: Column(
        children: <Widget>[
          Flexible(
            child: ListView.builder(
              padding: const EdgeInsets.all(8.0),
              reverse: true,
              itemBuilder: (_, int index) => _messages[index],
              itemCount: _messages.length,
            ),
          ),
          const Divider(height: 1.0),
          Container(
            decoration: BoxDecoration(color: Theme.of(context).cardColor),
            child: _buildTextComposer(),
          ),
        ],
      ),
    );
  }
}

class ChatMessage extends StatelessWidget {
  // Este widget é uma mensagem individual no chat.
  final String text;

  const ChatMessage({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    // Este widget é o construtor de uma mensagem individual no chat.
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            margin: const EdgeInsets.only(right: 16.0),
            child: const CircleAvatar(child: Text('U')),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text('Usuário', style: Theme.of(context).textTheme.titleMedium),
              Container(
                margin: const EdgeInsets.only(top: 5.0),
                child: Text(text),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
