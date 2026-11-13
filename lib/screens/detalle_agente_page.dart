import 'package:flutter/material.dart';
import '../models/agente.dart';
import '../theme/colores.dart';

class DetalleAgentePage extends StatelessWidget {
  final Agente agente;

  const DetalleAgentePage({super.key, required this.agente});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          agente.nombre.toUpperCase(),
          style: const TextStyle(
            fontWeight: FontWeight.w900,
            letterSpacing: 4,
          ),
        ),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(3),
          child: Container(height: 3, color: ColoresValorant.rojo),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
           
            Container(
              width: double.infinity,
              height: 340,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [ColoresValorant.rojoOscuro, ColoresValorant.fondo],
                ),
              ),
              child: Image.network(agente.retrato, fit: BoxFit.contain),
            ),
            
              Padding(
  padding: EdgeInsets.fromLTRB(
    16,
    16,
    16,
    16 + MediaQuery.of(context).padding.bottom,
  ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    agente.nombre.toUpperCase(),
                    style: const TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.w900,
                      letterSpacing: 3,
                      color: ColoresValorant.blanco,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 4,
                    ),
                    color: ColoresValorant.rojo,
                    child: Text(
                      agente.rol.toUpperCase(),
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        letterSpacing: 2,
                        fontSize: 12,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox(height: 14),
                  Text(
                    agente.descripcion,
                    style: const TextStyle(
                      color: ColoresValorant.blanco,
                      height: 1.4,
                    ),
                  ),
                  const SizedBox(height: 24),
                  Row(
                    children: [
                      Container(width: 4, height: 22, color: ColoresValorant.rojo),
                      const SizedBox(width: 8),
                      const Text(
                        'HABILIDADES',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w900,
                          letterSpacing: 3,
                          color: ColoresValorant.blanco,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  for (var habilidad in agente.habilidades)
                    Card(
                      color: ColoresValorant.tarjeta,
                      margin: const EdgeInsets.only(bottom: 10),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4),
                        side: const BorderSide(color: ColoresValorant.rojoSuave),
                      ),
                      child: ListTile(
                        contentPadding: const EdgeInsets.all(10),
                        leading: Container(
                          width: 48,
                          height: 48,
                          padding: const EdgeInsets.all(6),
                          decoration: BoxDecoration(
                            color: ColoresValorant.fondo,
                            borderRadius: BorderRadius.circular(4),
                            border: Border.all(color: ColoresValorant.rojo),
                          ),
                          child: habilidad.icono.isNotEmpty
                              ? Image.network(habilidad.icono)
                              : const Icon(
                                  Icons.bolt,
                                  color: ColoresValorant.rojo,
                                ),
                        ),
                        title: Text(
                          habilidad.nombre.toUpperCase(),
                          style: const TextStyle(
                            fontWeight: FontWeight.w900,
                            letterSpacing: 1.5,
                            color: ColoresValorant.rojo,
                          ),
                        ),
                        subtitle: Padding(
                          padding: const EdgeInsets.only(top: 6),
                          child: Text(
                            habilidad.descripcion,
                            style: const TextStyle(
                              color: ColoresValorant.blanco,
                            ),
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
