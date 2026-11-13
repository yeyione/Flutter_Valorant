
String limpiarTexto(String texto) {
  return texto.replaceAll(RegExp(r'<[^>]*>'), '');
}

class Habilidad {
  final String nombre;
  final String descripcion;
  final String icono;

  Habilidad({
    required this.nombre,
    required this.descripcion,
    required this.icono,
  });

  factory Habilidad.fromJson(Map<String, dynamic> json) {
    return Habilidad(
      nombre: json['displayName'] ?? '',
      descripcion: limpiarTexto(json['description'] ?? ''),
      icono: json['displayIcon'] ?? '',
    );
  }
}

class Agente {
  final String uuid;
  final String nombre;
  final String descripcion;
  final String icono;
  final String retrato;
  final String rol;
  final List<Habilidad> habilidades;

  Agente({
    required this.uuid,
    required this.nombre,
    required this.descripcion,
    required this.icono,
    required this.retrato,
    required this.rol,
    required this.habilidades,
  });

  factory Agente.fromJson(Map<String, dynamic> json) {
    List<Habilidad> listaHabilidades = [];
    if (json['abilities'] != null) {
      for (var item in json['abilities']) {
        listaHabilidades.add(Habilidad.fromJson(item));
      }
    }

    String nombreRol = '';
    if (json['role'] != null) {
      nombreRol = json['role']['displayName'] ?? '';
    }

    return Agente(
      uuid: json['uuid'] ?? '',
      nombre: json['displayName'] ?? '',
      descripcion: limpiarTexto(json['description'] ?? ''),
      icono: json['displayIcon'] ?? '',
      retrato: json['fullPortrait'] ?? '',
      rol: nombreRol,
      habilidades: listaHabilidades,
    );
  }
}
