// "id": 2,
//       "title": "Sea-Tac to Downtown Seattle",
//       "date": "2026-01-22",
//       "status": "Completed",
//       "pickup": "Sea-Tac",
//       "drop": "Hotel B"

class BookingItem {
  int? id;
  String? title;
  String? date;
  String? status;
  String? pickup;
  String? drop;

  BookingItem({
    this.id,
    this.title,
    this.date,
    this.drop,
    this.pickup,
    this.status,
  });

  factory BookingItem.fromJson(Map<String, dynamic> json) {
    return BookingItem(
      id: json['id'],
      title: json['title'],
      date: json['date'],
      status: json['status'],
      pickup: json['pickup'],
      drop: json['drop'],
    );
  }
}
