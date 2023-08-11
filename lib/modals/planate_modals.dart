class CelestialBody {
  final String name;
  final String Planet;
  final String file;
  final String hero;
  final String descriptione;
  final String satellites;
  final String surfacearea;
  final double distanceFromSun;
  final double orbitalPeriod; // in Earth years
  final double orbitalSpeed; // in km/s
  final String imageUrl;
  final String image;
  final String slogen;

  CelestialBody({
    required this.name,
    required this.Planet,
    required this.file,
    required this.hero,
    required this.descriptione,
    required this.satellites,
    required this.surfacearea,
    required this.distanceFromSun,
    required this.orbitalPeriod,
    required this.orbitalSpeed,
    required this.imageUrl,
    required this.image,
    required this.slogen,
  });
}
