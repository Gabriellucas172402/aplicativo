import 'package:flutter/material.dart';
import '../componentes_comuns.dart';

class ConversaoPage extends StatefulWidget {
  const ConversaoPage({super.key});

  @override
  State<ConversaoPage> createState() => _ConversaoPageState();
}

class _ConversaoPageState extends State<ConversaoPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  Map<String, String> _moedaOrigem = {
    'nome': 'Dólar Americano (US\$)',
    'codigo': 'USD',
    'bandeira': '🇺🇸',
  };

  Map<String, String> _moedaDestino = {
    'nome': 'Euro (€)',
    'codigo': 'EUR',
    'bandeira': '🇪🇺',
  };

  final TextEditingController _valorController = TextEditingController(text: '1.0');

  void _selecionarMoeda(bool éOrigem) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: const Color(0xFF090736),
        title: Text(
          éOrigem ? 'Selecionar Moeda de Origem' : 'Selecionar Moeda de Destino',
          style: const TextStyle(color: Colors.white, fontSize: 16),
        ),
        content: const Text(
          'Aqui você pode carregar a lista de moedas da sua tabela do banco de dados MySQL.',
          style: TextStyle(color: Colors.white70, fontSize: 13),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Fechar', style: TextStyle(color: Color(0xFF00E5FF))),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: const Color(0xFF0A083A),
      drawer: const MenuDaPagina(paginaAtual: 'CONVERSÃO'),
      body: SafeArea(
        child: Column(
          children: [
            _buildTopBar(),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                child: Column(
                  children: [
                    const Text(
                      'Conversor de Moedas',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 6),
                    const Text(
                      'Converta valores em tempo real com base nas cotações.',
                      style: TextStyle(color: Colors.white70, fontSize: 12),
                    ),
                    const SizedBox(height: 24),

                    _buildCardBandeiraGrande(_moedaOrigem['bandeira']!, _moedaOrigem['nome']!),
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
                                color: Color(0xFF00E5FF),
                                fontSize: 26,
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

                    _buildCardBandeiraGrande(_moedaDestino['bandeira']!, _moedaDestino['nome']!),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTopBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            onPressed: () => _scaffoldKey.currentState?.openDrawer(),
            icon: const Icon(
              Icons.menu_rounded,
              color: Color(0xFF00E5FF),
              size: 32,
            ),
          ),
          const Column(
            children: [
              Icon(
                Icons.public,
                color: Color(0xFF00E5FF),
                size: 28,
              ),
              Text(
                'DEVISE',
                style: TextStyle(
                  color: Color(0xFF00E5FF),
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildCardBandeiraGrande(String bandeira, String nome) {
    return Container(
      width: double.infinity,
      height: 110,
      decoration: BoxDecoration(
        color: const Color(0xFF060422),
        borderRadius: BorderRadius.circular(22),
        border: Border.all(color: const Color(0xFF14114A), width: 1.5),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.35),
            blurRadius: 6,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            bandeira,
            style: const TextStyle(fontSize: 38),
          ),
          const SizedBox(height: 6),
          Text(
            nome,
            style: const TextStyle(
              color: Colors.white70,
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildBotaoSeletorMoeda({required Map<String, String> moeda, required VoidCallback onTap}) {
    return InkWell(
      borderRadius: BorderRadius.circular(20),
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: const LinearGradient(
            colors: [
              Color(0xFF00E5FF),
              Color(0xFF007791),
              Color(0xFF060422),
            ],
            stops: [0.0, 0.6, 1.0],
          ),
          boxShadow: [
            BoxShadow(
              color: const Color(0xFF00E5FF).withOpacity(0.2),
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Text(moeda['bandeira']!, style: const TextStyle(fontSize: 20)),
                const SizedBox(width: 12),
                Text(
                  moeda['nome']!,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const Icon(
              Icons.keyboard_arrow_down_rounded,
              color: Colors.white,
              size: 22,
            ),
          ],
        ),
      ),
    );
  }
}
