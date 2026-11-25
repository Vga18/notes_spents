class ActivesModel{
  final String? id;
  final String userId;
  final String title;
  final double amount;

  ActivesModel({
    this.id,
    required this.userId,
    required this.title,
    required this.amount,
  });

  factory ActivesModel.fromJson(Map<String, dynamic>json){
    return ActivesModel(id: json["id"].toString(),
        userId: json["user_id"].toString(),
        title: json["title"].toString(),
        amount: json["amount"].float());
  }
  Map<String, dynamic> toJson(){
    return{
      if(id != null) 'id':id,
      'user_id':userId,
      'title': title,
      'amount': amount,
    };
  }

  copywith({
    String? id,
    String? userId,
    String? title,
    double? amount,
  }){
    return ActivesModel(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      title: title ?? this.title,
      amount: amount ?? this.amount,
    );
  }
}