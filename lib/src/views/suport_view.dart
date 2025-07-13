import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:marketool_financer/src/widgets/custom_app_bar.dart';

class SuportPage extends StatefulWidget {
  const SuportPage({super.key});

  @override
  State<SuportPage> createState() => _SuportPageState();
}

class _SuportPageState extends State<SuportPage> {
  final TextEditingController _controller = TextEditingController();
  final List<_Message> _messages = [];
  final ScrollController _scrollController = ScrollController();

  void _sendMessage(String text) async {
    if (text.trim().isEmpty) return;

    setState(() {
      _messages.add(_Message(text: text, isUser: true));
    });

    _controller.clear();
    _scrollToBottom();

    final reply = await _generateResponseFromOpenAI(text);
    setState(() {
      _messages.add(_Message(text: reply, isUser: false));
    });

    _scrollToBottom();
  }

  void _scrollToBottom() {
    Future.delayed(Duration(milliseconds: 100), () {
      if (_scrollController.hasClients) {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });
  }

  Future<String> _generateResponseFromOpenAI(String input) async {
    const apiKey = 'sk-SUA_API_KEY_AQUI'; // Substitua pela sua API Key válida
    const apiUrl = 'https://api.openai.com/v1/chat/completions';

    final headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $apiKey',
    };

    final body = jsonEncode({
      "model": "gpt-3.5-turbo",
      "messages": [
        {
          "role": "system",
          "content": "Você é um assistente de suporte amigável e eficiente."
        },
        {"role": "user", "content": input}
      ],
      "max_tokens": 150,
      "temperature": 0.7,
    });

    try {
      final response = await http.post(Uri.parse(apiUrl), headers: headers, body: body);
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return data['choices'][0]['message']['content'].trim();
      } else {
        return 'Erro: ${response.statusCode}';
      }
    } catch (e) {
      return 'Erro de conexão: $e';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: CustomAppBar(),
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFFE8F5E9), Color(0xFFC8E6C9)],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            child: Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    controller: _scrollController,
                    padding: const EdgeInsets.all(16),
                    itemCount: _messages.length,
                    itemBuilder: (context, index) {
                      final msg = _messages[index];
                      return Align(
                        alignment: msg.isUser
                            ? Alignment.centerRight
                            : Alignment.centerLeft,
                        child: Container(
                          margin: const EdgeInsets.symmetric(vertical: 6),
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: msg.isUser ? Colors.green[100] : Colors.white,
                            borderRadius: BorderRadius.circular(12),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black12,
                                blurRadius: 4,
                                offset: Offset(2, 2),
                              ),
                            ],
                          ),
                          child: Text(
                            msg.text,
                            style: const TextStyle(fontFamily: 'RobotoMono'),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                const Divider(height: 1),
                AnimatedPadding(
                  duration: const Duration(milliseconds: 300),
                  padding: EdgeInsets.only(
                    left: 12,
                    right: 12,
                    bottom: MediaQuery.of(context).viewInsets.bottom + 12,
                    top: 6,
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: _controller,
                          onSubmitted: _sendMessage,
                          decoration: InputDecoration(
                            hintText: 'Digite sua dúvida...',
                            filled: true,
                            fillColor: Colors.white,
                            contentPadding: const EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 14,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide.none,
                            ),
                          ),
                          style: const TextStyle(fontFamily: 'RobotoMono'),
                        ),
                      ),
                      const SizedBox(width: 8),
                      IconButton(
                        onPressed: () => _sendMessage(_controller.text),
                        icon: const Icon(Icons.send, color: Color(0xFF388E3C)),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _Message {
  final String text;
  final bool isUser;

  _Message({required this.text, required this.isUser});
}
