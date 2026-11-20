import 'package:flutter/material.dart';

class CadastroInformacoesBancariasPage extends StatefulWidget {
  const CadastroInformacoesBancariasPage({super.key});

  @override
  State<CadastroInformacoesBancariasPage> createState() =>
      _CadastroInformacoesBancariasPageState();
}

class _CadastroInformacoesBancariasPageState
    extends State<CadastroInformacoesBancariasPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  String _metodoSelecionado = 'Cartão';

  final List> _metodos = [
    {'titulo': 'Cartão', 'icone': Icons.credit_card},
    {'titulo': 'Pix', 'icone': Icons.qr_code_2},
    {'titulo': 'Boleto', 'icone': Icons.description_outlined},
    {'titulo': 'Transferência', 'icone': Icons.swap_horiz},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: const Color(0xFF0A083A), 
      drawer: _buildMenuLateral(),
      body: SafeArea(
        child: Column(
          children: [
            _buildTopBar(),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildTagSuperior(),
                    const SizedBox(height: 12),

                    const Text(
                      'Como você quer\npagar?',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        height: 1.15,
                      ),
                    ),
                    const SizedBox(height: 8),

                    const Text(
                      'Selecione o método mais rápido para concluir sua transação.',
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 13,
                        height: 1.3,
                      ),
                    ),
                    const SizedBox(height: 20),

                    _buildBotaoContinuar(),
                    const SizedBox(height: 16),

                    const Text(
                      'Opções disponíveis',
                      style: TextStyle(
                        color: Color(0xFF00E5FF),
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 12),

                    GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: _metodos.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 14,
                        mainAxisSpacing: 14,
                        childAspectRatio: 1.45,
                      ),
                      itemBuilder: (context, index) {
                        final metodo = _metodos[index];
                        final selecionado =
                            _metodoSelecionado == metodo['titulo'];
                        return _buildCardMetodo(
                          titulo: metodo['titulo'],
                          icone: metodo['icone'],
                          selecionado: selecionado,
                          onTap: () {
                            setState(() {
                              _metodoSelecionado = metodo['titulo'];
                            });
                          },
                        );
                      },
                    ),
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

  Widget _buildTagSuperior() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: const Color(0xFF060422),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: const Color(0xFF00B8D4), width: 1),
      ),
      child: const Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.circle,
            color: Color(0xFF00E5FF),
            size: 8,
          ),
          SizedBox(width: 6),
          Text(
            'Escolha o método',
            style: TextStyle(
              color: Colors.white,
              fontSize: 11,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBotaoContinuar() {
    return InkWell(
      borderRadius: BorderRadius.circular(20),
      onTap: () {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Método escolhido: $_metodoSelecionado'),
            backgroundColor: const Color(0xFF007791),
          ),
        );
      },
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
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
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Continuar',
              style: TextStyle(
                color: Colors.white,
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
            Icon(
              Icons.arrow_forward_rounded,
              color: Colors.white,
              size: 20,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCardMetodo({
    required String titulo,
    required IconData icone,
    required bool selecionado,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: const Color(0xFF060422),
          borderRadius: BorderRadius.circular(22),
          border: Border.all(
            color: selecionado ? const Color(0xFF00E5FF) : const Color(0xFF14114A),
            width: selecionado ? 2.0 : 1.5,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.35),
              blurRadius: 6,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: const Color(0xFF14114A),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(
                icone,
                color: const Color(0xFF00E5FF),
                size: 22,
              ),
            ),
            const Spacer(),
            Text(
              titulo,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Menu Lateral (Drawer) padrão conectado em todas as telas
  Widget _buildMenuLateral() {
    final List<String> opcoesMenu = [
      'INÍCIO',
      'CONVERSÃO',
      'AGENDAMENTO',
      'PONTOS TURÍSTICOS',
      'PERFIL',
      'GUIA DE VIAGEM',
      'SAIBA MAIS',
    ];

    return Drawer(
      width: MediaQuery.of(context).size.width * 0.65,
      backgroundColor: const Color(0xFF090736),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Container(
                      padding: const EdgeInsets.all(4),
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.close,
                        color: Color(0xFF090736),
                        size: 18,
                      ),
                    ),
                  ),
                  const Icon(
                    Icons.public,
                    color: Color(0xFF00B8D4),
                    size: 26,
                  ),
                ],
              ),
              const SizedBox(height: 28),
              ...opcoesMenu.map(
                (titulo) => Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: InkWell(
                    borderRadius: BorderRadius.circular(20),
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 10,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        gradient: const LinearGradient(
                          colors: [
                            Color(0xFF00E5FF),
                            Color(0xFF00607A),
                            Color(0xFF090736),
                          ],
                          stops: [0.0, 0.55, 1.0],
                        ),
                      ),
                      child: Text(
                        titulo,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 11,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 0.5,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const Spacer(),
              InkWell(
                onTap: () => Navigator.pop(context),
                child: const Padding(
                  padding: EdgeInsets.symmetric(vertical: 8),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Sair',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(width: 8),
                      Icon(
                        Icons.logout,
                        color: Colors.white,
                        size: 18,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
