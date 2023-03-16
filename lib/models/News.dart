class News{
  String? title;
  String? content;
  String? imgUrl;
  DateTime? date;

  // to create one News object from each json element
  void fromJSON(Map<String,dynamic> json){
    this.title = json["title"];
    this.content = json["description"];
    this.imgUrl = json["urlToImage"];
    this.date = DateTime.parse(json["publishedAt"]);
  }

}