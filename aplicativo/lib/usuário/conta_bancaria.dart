import 'package:flutter/material.dart';
import '../componentes_comuns.dart';

class ContaBancariaPage extends StatefulWidget {
  const ContaBancariaPage({super.key});

  @override
  State<ContaBancariaPage> createState() => _ContaBancariaPageState();
}

class _ContaBancariaPageState extends State<ContaBancariaPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final _bancoController = TextEditingController();
  final _agenciaController = TextEditingController();
  final _contaController = TextEditingController();
  final _pixController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: const Color(0xFF0A083A),
      drawer: const MenuDaPagina(paginaAtual: 'PERFIL'),
      body: SafeArea(
        child: Column(
          children: [
            _buildTopBar(),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Conta Bancária',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'Gerencie seus dados financeiros e métodos de pagamento vinculados.',
                      style: TextStyle(color: Colors.white70, fontSize: 13),
                    ),
                    const SizedBox(height: 24),
                    const Text('Nome do Banco', style: TextStyle(color: Color(0xFF00E5FF), fontSize: 12)),
                    const SizedBox(height: 6),
                    TextField(
                      controller: _bancoController,
                      style: const TextStyle(color: Colors.white),
                      decoration: _inputDecoration('Ex: Nubank, Banco do Brasil...'),
                    ),
                    const SizedBox(height: 16),
                    const Text('Agência', style: TextStyle(color: Color(0xFF00E5FF), fontSize: 12)),
                    const SizedBox(height: 6),
                    TextField(
                      controller: _agenciaController,
                      style: const TextStyle(color: Colors.white),
                      decoration: _inputDecoration('Número da agência...'),
                    ),
                    const SizedBox(height: 16),
                    const Text('Conta', style: TextStyle(color: Color(0xFF00E5FF), fontSize: 12)),
                    const SizedBox(height: 6),
                    TextField(
                      controller: _contaController,
                      style: const TextStyle(color: Colors.white),
                      decoration: _inputDecoration('Número da conta com dígito...'),
                    ),
                    const SizedBox(height: 16),
                    const Text('Chave Pix', style: TextStyle(color: Color(0xFF00E5FF), fontSize: 12)),
                    const SizedBox(height: 6),
                    TextField(
                      controller: _pixController,
                      style: const TextStyle(color: Colors.white),
                      decoration: _inputDecoration('CPF, E-mail, Telefone ou Chave Aleatória...'),
                    ),
                    const SizedBox(height: 24),
                    SizedBox(
                      width: double.infinity,
                      height: 48,
                      child: Container(
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            colors: [Color(0xFF00E5FF), Color(0xFF007791)],
                          ),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.transparent,
                            shadowColor: Colors.transparent,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                          ),
                          onPressed: () {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('Dados bancários salvos com sucesso!')),
                            );
                          },
                          child: const Text(
                            'Salvar Dados Bancários',
                            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
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
            icon: const Icon(Icons.menu_rounded, color: Color(0xFF00E5FF), size: 32),
          ),
          const Column(
            children: [
              Icon(Icons.public, color: Color(0xFF00E5FF), size: 28),
              Text('DEVISE', style: TextStyle(color: Color(0xFF00E5FF), fontSize: 10, fontWeight: FontWeight.bold, letterSpacing: 1)),
            ],
          ),
        ],
      ),
    );
  }

  InputDecoration _inputDecoration(String hint) {
    return InputDecoration(
      hintText: hint,
      hintStyle: const TextStyle(color: Colors.white54, fontSize: 12),
      filled: true,
      fillColor: const Color(0xFF060422),
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: Color(0xFF14114A), width: 1.5),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: Color(0xFF00E5FF), width: 1.5),
      ),
    );
  }
}
