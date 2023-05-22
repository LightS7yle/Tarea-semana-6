class CardProfile {
  final String? id;
  final String name;
  final String date;
  bool isActive;
  final String photo;

  CardProfile(
      {this.id,
      required this.name,
      required this.date,
      this.isActive = false,
      required this.photo});
}
