import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:formvalidation/src/models/producto_model.dart';
import 'package:formvalidation/src/pages/producto_page.dart';

class DetallePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ProductoModel producto = ModalRoute.of(context).settings.arguments;
    return Scaffold(
        body: CustomScrollView(
      slivers: <Widget>[
        _crearAppbar(producto),
        SliverList(
            delegate: SliverChildListDelegate([
          SizedBox(height: 10.0),
          _tituloImage(context, producto),
          _descripcionProducto(producto),
          //_imgTitulo(),
        ])),
      ],
    ));
  }

  _crearAppbar(ProductoModel producto) {
    return SliverAppBar(
      elevation: 2.0,
      backgroundColor: Colors.grey[700],
      expandedHeight: 200.0,
      floating: false,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        background: FadeInImage(
          image: NetworkImage(producto.fotoUrl),
          placeholder: AssetImage('assets/jar-loading.gif'),
          fadeInDuration: Duration(milliseconds: 150),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _tituloImage(BuildContext context, ProductoModel producto) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        children: <Widget>[
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(producto.titulo, style: TextStyle(fontSize: 30.0)),
                Text('     '),
                Row(
                  children: <Widget>[
                    Text('Cantidad:' + producto.stock.toString(),
                        style: Theme.of(context).textTheme.title,
                        overflow: TextOverflow.ellipsis),
                    Text('     '),
                    Row(
                      children: <Widget>[
                        Icon(Icons.attach_money, size: 45.0),
                        Text(producto.valor.toString(),
                            style: TextStyle(fontSize: 50.0),
                            overflow: TextOverflow.ellipsis),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _descripcionProducto(ProductoModel producto) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
      child: Text(producto.descripcion,
          textAlign: TextAlign.justify, style: TextStyle(fontSize: 15.0)),
    );
  }
}
