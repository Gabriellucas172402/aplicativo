import 'package:flutter/material.dart';

class SaibaMaisPage extends StatefulWidget {
  const SaibaMaisPage({super.key});

  @override
  State<SaibaMaisPage> createState() => _SaibaMaisPageState();
}

class _SaibaMaisPageState extends State<SaibaMaisPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

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
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'A DEVISE É UM APLICATIVO MOBILE QUE COMBINA AS FUNCIONALIDADES DE UM ASSISTENTE PESSOAL DE VIAGEM COM UM CONVERSOR DE MOEDAS INTERNACIONAIS FOCADO NO DIA A DIA DO VIAJANTE. O PRÓPRIO NOME FAZ REFERÊNCIA AO TERMO FRANCÊS DEVISE (QUE SIGNIFICA "MOEDA ESTRANGEIRA" OU "CÂMBIO").',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        height: 1.4,
                      ),
                    ),
                    SizedBox(height: 16),
                    Text(
                      'O QUE É A DEVISE?',
                      style: TextStyle(
                        color: Color(0xFF00E5FF),
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'A PROPOSTA PRINCIPAL DO APLICATIVO É ELIMINAR A COMPUCAÇÃO DE FAZER CONTAS DE CABEÇA E CONTROLAR GASTOS EM DIFERENTES MOEDAS DURANTE VIAGENS AO EXTERIOR. ELE FUNCIONA COMO UMA "CALCULADORA INTELIGENTE DE CÂMBIO", PERMITINDO ACOMPANHAR TAXAS ATUALIZADAS E PLANEJAR DESPESAS DO ITINERÁRIO DE FORMA SIMPLES.\n\nPRINCIPAIS FUNCIONALIDADES\n\n1. CONVERSÃO DE MOEDAS EM TEMPO REAL',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        height: 1.4,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      '• COTAÇÕES ATUALIZADAS: ACOMPANHAMENTO DE TAXAS DE CÂMBIO COMERCIAIS E DE TURISMO PARA MAIS DE 150 MOEDAS AO REDOR DO MUNDO.\n'
                      '• MODO OFFLINE: ARMAZENA AS ÚLTIMAS COTAÇÕES BAIXADAS PARA REALIZAR CONVERSÕES MESMO EM LOCAIS SEM SINAL DE INTERNET OU SEM CHIP INTERNACIONAL ATIVADO.\n'
                      '• CONVERSÃO MÚLTIPLA: PERMITE VISUALIZAR O VALOR INSERIDO CONVERTIDO SIMULTANEAMENTE NA MOEDA LOCAL DO DESTINO E NA SUA MOEDA DE ORIGEM (POR EXEMPLO, CONVERTER IENES DIRETAMENTE PARA REAIS E DÓLARES NA MESMA TELA).',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 11.5,
                        height: 1.4,
                      ),
                    ),
                    SizedBox(height: 12),
                    Text(
                      '2. ASSISTENTE E GESTÃO DE GASTOS DE VIAGEM',
                      style: TextStyle(
                        color: Color(0xFF00E5FF),
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      '• CALCULADORA DE IMPOSTOS E TAXAS: PERMITE EMBUTIR TAXAS LOCAIS DE COMPRAS (COMO SALES TAX NOS EUA) E IMPOSTOS SOBRE TRANSAÇÕES FINANCEIRAS (COMO IOF E MARGENS DE CARTÃO) PARA MOSTRAR O CUSTO REAL DA COMPRA.\n'
                      '• REGISTRO DE DESPESAS POR CATEGORIA: ORGANIZAÇÃO DE GASTOS DIÁRIOS (ALIMENTAÇÃO, TRANSPORTE, HOSPEDAGEM, COMPRAS) DIRETAMENTE NA MOEDA EM QUE FORAM PAGOS, CONVERTENDO E CONSOLIDANDO O ORÇAMENTO TOTAL DA VIAGEM.\n'
                      '• LEITURA VISUAL (OCR): RECURSO DE CÂMERA PARA APONTAR PARA ETIQUETAS DE PREÇOS OU MENUS DE RESTAURANTES E VER O VALOR CONVERTIDO NA TELA INSTANTANEAMENTE.',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 11.5,
                        height: 1.4,
                      ),
                    ),
                    SizedBox(height: 12),
                    Text(
                      'PARA QUEM É INDICADO?',
                      style: TextStyle(
                        color: Color(0xFF00E5FF),
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      '• VIAJANTES INTERNACIONAIS: QUE QUEREM EVITAR SURPRESAS NA FATURA DO CARTÃO AO VOLTAR PARA CASA.\n'
                      '• NÔMADES DIGITAIS E PROFISSIONAIS GLOBAIS: QUE PRECISAM GERENCIAR RECEITAS E DESPESAS EM MÚLTIPLAS MOEDAS SIMULTANEAMENTE.\n'
                      '• MOCHILEIROS E TURISTAS: QUE BUSCAM PRATICIDADE PARA CONSULTAR PREÇOS RAPIDAMENTE NO COMÉRCIO LOCAL OU TRANSPORTE SEM PRECISAR DE CONEXÃO CONTÍNUA À INTERNET.',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 11.5,
                        height: 1.4,
                      ),
                    ),
                    SizedBox(height: 20),
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
                    onTap: () => Navigator.pop(context),
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
