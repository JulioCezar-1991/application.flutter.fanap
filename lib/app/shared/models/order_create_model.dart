class OrderCreateModel {
  String id;
  String formPayment;
  String status;
  String customer;
  String client;
  String schedulingdate;
  List<Itens> itens;
  double subtotal;

  OrderCreateModel(
      {this.id,
      this.formPayment,
      this.status,
      this.customer,
      this.client,
      this.schedulingdate,
      this.itens,
      this.subtotal});

  OrderCreateModel.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    formPayment = json['formPayment'];
    status = json['status'];
    customer = json['customer'];
    client = json['client'];
    schedulingdate = json['schedulingdate'];
    if (json['itens'] != null) {
      itens = new List<Itens>();
      json['itens'].forEach((v) {
        itens.add(new Itens.fromJson(v));
      });
    }
    subtotal = json['subtotal'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['formPayment'] = this.formPayment;
    data['status'] = this.status;
    data['customer'] = this.customer;
    data['client'] = this.client;
    data['schedulingdate'] = this.schedulingdate;
    if (this.itens != null) {
      data['itens'] = this.itens.map((v) => v.toJson()).toList();
    }
    data['subtotal'] = this.subtotal;
    return data;
  }
}

class Itens {
  ProductList product;

  Itens({this.product});

  Itens.fromJson(Map<String, dynamic> json) {
    product = json['product'] != null
        ? new ProductList.fromJson(json['product'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.product != null) {
      data['product'] = this.product.toJson();
    }
    return data;
  }
}

class ProductList {
  String sId;
  String title;
  double price;
  String averagetime;

  ProductList({this.sId, this.title, this.price, this.averagetime});

  ProductList.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    title = json['title'];
    price = json['price'];
    averagetime = json['averagetime'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['title'] = this.title;
    data['price'] = this.price;
    data['averagetime'] = this.averagetime;
    return data;
  }
}
