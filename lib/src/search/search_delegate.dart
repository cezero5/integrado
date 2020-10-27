import 'package:flutter/material.dart';
import 'package:formvalidation/src/models/producto_model.dart';
import 'package:formvalidation/src/providers/productos_provider.dart';

class DataSearch extends SearchDelegate {
  String seleccion = '';
  final prductoProvider = new ProductosProvider();
  final producto = ['mango', 'manzana', 'tamales'];
  final productoNuevo = ['mango', 'manzana'];
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation,
      ),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Center(
      child: Container(
        height: 100.0,
        width: 100.0,
        color: Colors.blueAccent,
        child: Text(seleccion),
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final listaSugerida = (query.isEmpty)
        ? productoNuevo
        : producto
            .where((p) => (p.toLowerCase().startsWith(query.toLowerCase())))
            .toList();

    return ListView.builder(
      itemCount: listaSugerida.length,
      itemBuilder: (context, i) {
        return ListTile(
          leading: Icon(Icons.shop),
          title: Text(listaSugerida[i]),
          onTap: () {
            seleccion = listaSugerida[i];
            showResults(context);
          },
        );
      },
    );
  }
  /* @override
  Widget buildSuggestions(BuildContext context) {
    return(query.isEmpty){
      return Container();
    }
    return FutureBuilder(
      future: prductoProvider.buscarProducto(query),
      builder: (BuildContext context, AsyncSnapshot<List<ProductoModel>> snapshot){
         if(snapshot.hasData){
           final productos = snapshot.data;
           return ListView(
             children: productos.map((producto){
               return ListTile(
                 leading: FadeInImage(
                   image: NetworkImage(producto.fotoUrl),
                   placeholder: AssetImage('asset/no-image.jpg'),
                   width: 50.0,
                   fit: BoxFit.contain,
                 ),
                 title: Text(producto.titulo),
                 subtitle:Text(producto.stock.toString()),
                 onTap: (){
                   close(context, null);
                   Navigator.pushNamed(context, 'detalle', arguments: producto);
                 },
               );
             }).toList()
           );
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    ),
  }*/
}
