class InfoBoxModelClass {
  String? show;
  String? textTitle;
  String? textDesc;
  String? imgTitle;
  String? imgUrl;

  InfoBoxModelClass(
      {this.show, this.textTitle, this.textDesc, this.imgTitle, this.imgUrl});

  InfoBoxModelClass.fromJson(Map<String, dynamic> json) {
    show = json['show'];
    textTitle = json['text_title'];
    textDesc = json['text_desc'];
    imgTitle = json['img_title'];
    imgUrl = json['img_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['show'] = this.show;
    data['text_title'] = this.textTitle;
    data['text_desc'] = this.textDesc;
    data['img_title'] = this.imgTitle;
    data['img_url'] = this.imgUrl;
    return data;
  }
}
