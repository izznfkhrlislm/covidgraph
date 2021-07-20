/// Enum to determine flavors of the app
/// Flavors: [develop], [staging], and [prod]
/// Run with:
/// flutter run --flavor develop -t lib/main.dart
/// flutter run --flavor staging -t lib/main_staging.dart
/// flutter run --flavor prod -t lib/main_prod.dart
enum Flavor {
  develop,
  staging,
  prod
}