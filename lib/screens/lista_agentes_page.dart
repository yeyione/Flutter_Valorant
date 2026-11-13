import 'package:flutter/material.dart';
import '../models/agente.dart';
import '../services/agente_service.dart';
import '../theme/colores.dart';
import 'detalle_agente_page.dart';

class ListaAgentesPage extends StatefulWidget {
  const ListaAgentesPage({super.key});

  @override
  State<ListaAgentesPage> createState() => _ListaAgentesPageState();
}

class _ListaAgentesPageState extends State<ListaAgentesPage> {
  late Future<List<Agente>> _futuroAgentes;

  @override
  void initState() {
    super.initState();
    _futuroAgentes = AgenteService().obtenerAgentes();
  }

  void _recargar() {
    setState(() {
      _futuroAgentes = AgenteService().obtenerAgentes();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'VALORANT',
          style: TextStyle(
            fontWeight: FontWeight.w900,
            letterSpacing: 6,
            color: ColoresValorant.rojo,
          ),
        ),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(3),
          child: Container(height: 3, color: ColoresValorant.rojo),
        ),
      ),
      body: FutureBuilder<List<Agente>>(
        future: _futuroAgentes,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(color: ColoresValorant.rojo),
            );
          }

          if (snapshot.hasError) {
            return Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    'No se pudieron cargar los agentes',
                    style: TextStyle(color: ColoresValorant.blanco),
                  ),
                  const SizedBox(height: 12),
                  FilledButton(
                    style: FilledButton.styleFrom(
                      backgroundColor: ColoresValorant.rojo,
                    ),
                    onPressed: _recargar,
                    child: const Text('REINTENTAR'),
                  ),
                ],
              ),
            );
          }

          final agentes = snapshot.data!;

          return ListView.builder(
            padding: EdgeInsets.fromLTRB(
  12,
  12,
  12,
  12 + MediaQuery.of(context).padding.bottom,
),

            itemCount: agentes.length,
            itemBuilder: (context, index) {
              final agente = agentes[index];
              return Card(
                color: ColoresValorant.tarjeta,
                margin: const EdgeInsets.only(bottom: 10),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4),
                  side: const BorderSide(color: ColoresValorant.rojoSuave),
                ),
                child: ListTile(
                  contentPadding: const EdgeInsets.all(10),
                  leading: Container(
                    width: 56,
                    height: 56,
                    decoration: BoxDecoration(
                      color: ColoresValorant.fondo,
                      borderRadius: BorderRadius.circular(4),
                      border: Border.all(color: ColoresValorant.rojo),
                    ),
                    child: Image.network(agente.icono),
                  ),
                  title: Text(
                    agente.nombre.toUpperCase(),
                    style: const TextStyle(
                      fontWeight: FontWeight.w900,
                      letterSpacing: 2,
                      color: ColoresValorant.blanco,
                    ),
                  ),
                  subtitle: Text(
                    agente.rol.toUpperCase(),
                    style: const TextStyle(
                      color: ColoresValorant.rojo,
                      fontSize: 12,
                      letterSpacing: 2,
                    ),
                  ),
                  trailing: const Icon(
                    Icons.chevron_right,
                    color: ColoresValorant.rojo,
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            DetalleAgentePage(agente: agente),
                      ),
                    );
                  },
                ),
              );
            },
          );
        },
      ),
    );
  }
}
