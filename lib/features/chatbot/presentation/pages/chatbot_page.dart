import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../core/theme/theme_extensions.dart';
import '../../data/datasources/faq_data.dart';
import '../widgets/chat_message.dart';
import '../widgets/faq_button.dart';

class ChatbotPage extends StatefulWidget {
  const ChatbotPage({super.key});

  @override
  State<ChatbotPage> createState() => _ChatbotPageState();
}

class _ChatbotPageState extends State<ChatbotPage> {
  final List<Map<String, dynamic>> _messages = [];
  final ScrollController _scrollController = ScrollController();
  bool _showFaqs = true;

  @override
  void initState() {
    super.initState();
    _addBotMessage(
      'Hola! Soy tu asistente virtual de Amigos Marval. Selecciona una pregunta o escribeme tu duda.',
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _addBotMessage(String message) {
    setState(() {
      _messages.add({
        'message': message,
        'isUser': false,
        'timestamp': DateTime.now(),
      });
    });
    _scrollToBottom();
  }

  void _addUserMessage(String message) {
    setState(() {
      _messages.add({
        'message': message,
        'isUser': true,
        'timestamp': DateTime.now(),
      });
      _showFaqs = false;
    });
    _scrollToBottom();
  }

  void _handleFaqTap(String question, String answer) {
    _addUserMessage(question);
    Future.delayed(const Duration(milliseconds: 500), () {
      _addBotMessage(answer);
      Future.delayed(const Duration(milliseconds: 300), () {
        setState(() {
          _showFaqs = true;
        });
      });
    });
  }

  void _scrollToBottom() {
    Future.delayed(const Duration(milliseconds: 100), () {
      if (_scrollController.hasClients) {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.background,
      body: SafeArea(
        child: Column(
          children: [
            _buildHeader(),
            Expanded(
              child: ListView.builder(
                controller: _scrollController,
                padding: const EdgeInsets.symmetric(vertical: 16),
                itemCount: _messages.length,
                itemBuilder: (context, index) {
                  final message = _messages[index];
                  return ChatMessage(
                    message: message['message'] as String,
                    isUser: message['isUser'] as bool,
                  );
                },
              ),
            ),
            if (_showFaqs) _buildFaqSection(),
            _buildInputArea(),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: context.surface,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          IconButton(
            icon: Icon(Icons.arrow_back, color: context.primaryBlue),
            onPressed: () => Navigator.of(context).pop(),
          ),
          const SizedBox(width: 8),
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: context.primaryBlue,
              shape: BoxShape.circle,
            ),
            child: Icon(
              Iconsax.messages_1,
              color: context.surface,
              size: 20,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Asistente Virtual',
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: context.darkNavy,
                  ),
                ),
                Text(
                  'En linea',
                  style: GoogleFonts.poppins(
                    fontSize: 12,
                    color: Colors.green,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFaqSection() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12),
      decoration: BoxDecoration(
        color: context.surface,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 4,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Text(
              'Preguntas frecuentes',
              style: GoogleFonts.poppins(
                fontSize: 13,
                fontWeight: FontWeight.w600,
                color: context.textSecondary,
              ),
            ),
          ),
          ...FaqData.faqs.map((faq) => FaqButton(
                question: faq.question,
                onTap: () => _handleFaqTap(faq.question, faq.answer),
              )),
        ],
      ),
    );
  }

  Widget _buildInputArea() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: context.surface,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 4,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              decoration: BoxDecoration(
                color: context.background,
                borderRadius: BorderRadius.circular(24),
              ),
              child: Text(
                'Escribe tu mensaje...',
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  color: context.textLight,
                ),
              ),
            ),
          ),
          const SizedBox(width: 12),
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: context.primaryBlue.withValues(alpha: 0.2),
              shape: BoxShape.circle,
            ),
            child: Icon(
              Iconsax.send_1,
              color: context.primaryBlue,
              size: 20,
            ),
          ),
        ],
      ),
    );
  }
}
