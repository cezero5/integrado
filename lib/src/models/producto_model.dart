// To parse this JSON data, do
//
//     final productoModel = productoModelFromJson(jsonString);

import 'dart:convert';

import 'package:flutter/material.dart';

ProductoModel productoModelFromJson(String str) =>
    ProductoModel.fromJson(json.decode(str));

String productoModelToJson(ProductoModel data) => json.encode(data.toJson());

class ProductoModel {
  String id;
  String titulo;
  int valor;
  bool disponible;
  String fotoUrl;
  int stock;
  String descripcion;

  ProductoModel({
    this.id,
    this.titulo = '',
    this.valor = 0,
    this.disponible = true,
    this.fotoUrl,
    this.stock = 0,
    this.descripcion = '',
  });

  factory ProductoModel.fromJson(Map<String, dynamic> json) =>
      new ProductoModel(
        id: json["id"],
        titulo: json["titulo"],
        valor: json["valor"],
        disponible: json["disponible"],
        fotoUrl: json["fotoUrl"],
        stock: json["stock"],
        descripcion: json["descripcion"],
      );

  Map<String, dynamic> toJson() => {
        // "id"         : id,
        "titulo": titulo,
        "valor": valor,
        "disponible": disponible,
        "fotoUrl": fotoUrl,
        "stock": stock,
        "descripcion": descripcion,
      };

  /*getFoto() {
    if (fotoUrl == null) {
      return 'assets/no-image.png';
    } else {
      return fotoUrl;
    }
  }*/
}
