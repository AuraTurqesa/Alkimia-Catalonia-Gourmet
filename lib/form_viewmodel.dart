import 'package:flutter/material.dart';

class FormViewModel extends ChangeNotifier {
  final List<String> paisos = [
    'Albània', 'Alemanya', 'Andorra', 'Àustria', 'Bèlgica', 'Bòsnia i Hercegovina',
    'Bulgària', 'Croàcia', 'Dinamarca', 'Eslovàquia', 'Eslovènia', 'Espanya',
    'Estònia', 'Finlàndia', 'França', 'Grècia', 'Hongria', 'Irlanda', 'Islàndia',
    'Itàlia', 'Letònia', 'Liechtenstein', 'Lituània', 'Luxemburg', 'Malta',
    'Moldàvia', 'Mònaco', 'Montenegro', 'Noruega', 'Països Baixos', 'Polònia',
    'Portugal', 'Regne Unit', 'República Txeca', 'Romania', 'San Marino',
    'Sèrbia', 'Suècia', 'Suïssa', 'Ucraïna', 'Estats Units'
  ];

  final Map<String, List<String>> ciutatsPerPais = {
    'Espanya': ['Barcelona', 'Madrid', 'València', 'Sevilla', 'Bilbao'],
    'França': ['París', 'Marsella', 'Lió', 'Toulouse', 'Nice'],
    'Alemanya': ['Berlín', 'Hamburg', 'Munic', 'Colònia', 'Frankfurt'],
    'Itàlia': ['Roma', 'Milà', 'Nàpols', 'Torí', 'Palerm'],
    'Regne Unit': ['Londres', 'Manchester', 'Birmingham', 'Glasgow', 'Liverpool'],
    'Països Baixos': ['Amsterdam', 'Rotterdam', 'La Haia', 'Utrecht', 'Eindhoven'],
    'Portugal': ['Lisboa', 'Porto', 'Coïmbra', 'Funchal', 'Braga'],
    'Suïssa': ['Zuric', 'Ginebra', 'Basilea', 'Berna', 'Lausana'],
    'Bèlgica': ['Brussel·les', 'Anvers', 'Gant', 'Lieja', 'Bruges'],
    'Suècia': ['Estocolm', 'Gotemburg', 'Malmö', 'Uppsala', 'Västerås'],
    'Noruega': ['Oslo', 'Bergen', 'Trondheim', 'Stavanger', 'Drammen'],
    'Finlàndia': ['Hèlsinki', 'Espoo', 'Tampere', 'Vantaa', 'Oulu'],
    'Irlanda': ['Dublín', 'Cork', 'Limerick', 'Galway', 'Waterford'],
    'Estats Units': ['Nova York', 'Los Angeles', 'Chicago', 'Houston', 'Miami'],
    // Altres
    for (var pais in [
      'Albània', 'Andorra', 'Àustria', 'Bòsnia i Hercegovina', 'Bulgària', 'Croàcia',
      'Dinamarca', 'Eslovàquia', 'Eslovènia', 'Estònia', 'Grècia', 'Hongria', 'Islàndia',
      'Letònia', 'Liechtenstein', 'Lituània', 'Luxemburg', 'Malta', 'Moldàvia', 'Mònaco',
      'Montenegro', 'Polònia', 'República Txeca', 'Romania', 'San Marino', 'Sèrbia',
      'Ucraïna'
    ]) pais: ['Ciutat principal de $pais']
  };

  final List<String> comEnsHasConegut = [
    'Cercador (Google, Bing...)',
    'Xarxes socials',
    'Recomanació',
    'Publicitat',
    'Altres'
  ];

  String? nom;
  String? telefon;
  String? email;
  String? paisSeleccionat;
  String? ciutatSeleccionada;
  String? origen;

  List<String> get ciutatsDisponibles {
    if (paisSeleccionat != null && ciutatsPerPais.containsKey(paisSeleccionat)) {
      return ciutatsPerPais[paisSeleccionat]!;
    }
    return [];
  }

  void setPais(String? nouPais) {
    paisSeleccionat = nouPais;
    ciutatSeleccionada = null;
    notifyListeners();
  }

  void setCiutat(String? ciutat) {
    ciutatSeleccionada = ciutat;
    notifyListeners();
  }

  void setOrigen(String? valor) {
    origen = valor;
    notifyListeners();
  }
}
