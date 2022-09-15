class Model {
  String image;
  String name;
  String location;
  String phone;

  Model({
    required this.image,
    required this.name,
    required this.location,
    required this.phone
  });
}


class ItemListDoctor {
  String name;
  String date;
  String phone;
  String time;

  ItemListDoctor({
    required this.name,
    required this.date,
    required this.phone,
    required this.time,
  });



  Map<String, dynamic> toJson() =>{
    "name" : name,
    "date" : date,
    "phone" : phone,
    "time" : time,
  };

  static ItemListDoctor fromJson(Map<String, dynamic> json) => ItemListDoctor(
      name: json['name'],
      date: json['date'],
      phone: json['phone'],
      time: json['time']);
}
