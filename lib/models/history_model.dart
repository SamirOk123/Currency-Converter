class History {
  int? id;
  String value;
  String date;

  History({this.id, required this.date, required this.value});

  Map<String, dynamic> toMap() => {
        'id': id,
        'value': value,
        'date': date,
      };

  History.fromMap(Map<String, dynamic> sam)
      : id = sam['id'],
        value = sam['value'],
        date = sam['date'];
}
