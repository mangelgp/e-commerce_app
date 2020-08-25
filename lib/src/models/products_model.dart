
class Products {

  List<Product> items = new List();

  Products();

  Products.fromJsonList(List<dynamic> jsonList) {

    if (jsonList == null) return;

    for (var item in jsonList) {
      
      final product = new Product.fromJsonMap(item);
      items.add(product);

    }
    
  }

}

class Product {
  int cantidadCompra = 1;
  int idProductoLinea;
  int idProductoCodigo;
  int idProductoPres;
  int idProductoDesc;
  int idProducto;
  String codigo;
  String descripcion;
  String unidad;
  int stock;
  double precio;
  String imagen;

  Product({
    this.idProductoLinea,
    this.idProductoCodigo,
    this.idProductoPres,
    this.idProductoDesc,
    this.idProducto,
    this.codigo,
    this.descripcion,
    this.unidad,
    this.stock,
    this.precio,
    this.imagen,
  });

  Product.fromJsonMap(Map<String, dynamic> json ) {
    idProductoLinea   = json['IdProductoLinea'];
    idProductoCodigo  = json['IdProductoCodigo'];
    idProductoPres    = json['IdProductoPres'];
    idProductoDesc    = json['IdProductoDesc'];
    idProducto        = json['IdProducto'];
    codigo            = json['Codigo'];
    descripcion       = json['Descripcion'];
    unidad            = json['Unidad'];
    stock             = json['Stock'];
    precio            = json['Precio'] / 1;
    imagen            = json['Imagen'];
  }

  String getImg() {
    if (imagen == null) {
      return 'http://192.168.0.2:8001/img/products/${imagen}wwww';
    } else {
      final url = 'http://192.168.0.2:8001/img/products/$imagen';
      return url;
    }

  }

}
