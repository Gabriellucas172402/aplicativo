import 'package:flutter/material.dart';
import 'Seleção.dart'; 

class ConversaoPage extends StatefulWidget {
  const ConversaoPage({super.key});

  @override
  State<ConversaoPage> createState() => _ConversaoPageState();
}

class _ConversaoPageState extends State<ConversaoPage> {
  Map<String, String> _moedaOrigem = {
    'nome': 'Dólar Americano\n(US\$)',
    'codigo': 'USD',
    'bandeira': '🇺🇸',
    'bandeiraGrande': '🇺🇸',
  };

  Map<String, String> _moedaDestino = {
    'nome': 'Euro\n(€)',
    'codigo': 'EUR',
    'bandeira': '🇪🇺',
    'bandeiraGrande': '🇪🇺',
  };

  final TextEditingController _valorController = TextEditingController(text: '1.0');

  void _selecionarMoeda(bool éOrigem) async {
    final resultado = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const SelecaoMoedaPage()),
    );

    if (resultado != null && resultado is Map<String, String>) {
      setState(() {
        if (éOrigem) {
          _moedaOrigem = resultado;
        } else {
          _moedaDestino = resultado;
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0A083A),
      body: SafeArea(
        child: Column(
          children: [
            _buildTopBar(context),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Column(
                  children: [
                    _buildCardBandeiraGrande(_moedaOrigem['bandeira'] ?? '🇺🇸'),
                    const SizedBox(height: 16),

                    _buildBotaoSeletorMoeda(
                      moeda: _moedaOrigem,
                      onTap: () => _selecionarMoeda(true),
                    ),
                    const SizedBox(height: 14),

                    Row(
                      children: [
                        Expanded(
                          flex: 2,
                          child: Container(
                            height: 48,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: const Color(0xFF060422),
                              borderRadius: BorderRadius.circular(16),
                              border: Border.all(color: const Color(0xFF14114A), width: 1.5),
                            ),
                            child: const Text(
                              '=',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 28,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          flex: 3,
                          child: Container(
                            height: 48,
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            decoration: BoxDecoration(
                              color: const Color(0xFF060422),
                              borderRadius: BorderRadius.circular(16),
                              border: Border.all(color: const Color(0xFF14114A), width: 1.5),
                            ),
                            child: TextField(
                              controller: _valorController,
                              style: const TextStyle(color: Colors.white, fontSize: 16),
                              keyboardType: TextInputType.number,
                              decoration: const InputDecoration(
                                border: InputBorder.none,
                                hintText: 'Valor',
                                hintStyle: TextStyle(color: Colors.white54),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 14),

                    _buildBotaoSeletorMoeda(
                      moeda: _moedaDestino,
                      onTap: () => _selecionarMoeda(false),
                    ),
                    const SizedBox(height: 16),

                    _buildCardBandeiraGrande(_moedaDestino['bandeira'] ?? '🇪🇺'),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTopBar(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(
              Icons.arrow_back,
              color: Color(0xFF00E5FF),
              size: 28,
            ),
          ),
          Container(
            width: 10,
            height: 10,
            decoration: const BoxDecoration(
              color: Colors.black,
              shape: BoxShape.circle,
            ),
          ),
          const Row(
            children: [
              Icon(
                Icons.public,
                color: Color(0xFF00E5FF),
                size: 24,
              ),
              SizedBox(width: 4),
              Text(
                'DEVSE',
                style: TextStyle(
                  color: Color(0xFF00E5FF),
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  /// Bloco ret
