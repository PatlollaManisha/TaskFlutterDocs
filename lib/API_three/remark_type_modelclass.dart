class getRemarksModelClass {
  String? status;
  List<Remarks>? remarks;

  getRemarksModelClass({this.status, this.remarks});

  getRemarksModelClass.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['remarks'] != null) {
      remarks = <Remarks>[];
      json['remarks'].forEach((v) {
        remarks!.add(new Remarks.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.remarks != null) {
      data['remarks'] = this.remarks!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Remarks {
  String? remarkid;
  String? remarkname;

  Remarks({this.remarkid, this.remarkname});

  Remarks.fromJson(Map<String, dynamic> json) {
    remarkid = json['remarkid'];
    remarkname = json['remarkname'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['remarkid'] = this.remarkid;
    data['remarkname'] = this.remarkname;
    return data;
  }
}
