class CoffeeBean {
  String name, description, taste;
  int amount;

  CoffeeBean(
      {required this.name,
      required this.description,
      required this.taste,
      required this.amount});

  factory CoffeeBean.fromJson(Map<String, dynamic> json) {
    return CoffeeBean(
        name: json['name'],
        description: json['description'],
        taste: json['taste'],
        amount: json['amount']);
  }
}
