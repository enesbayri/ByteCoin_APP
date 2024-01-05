// ignore_for_file: non_constant_identifier_names

import 'dart:convert';

class CoinsModel {
  String time;
  String asset_id_base;
  String asset_id_quote;
  double rate;
  CoinsModel({
    required this.time,
    required this.asset_id_base,
    required this.asset_id_quote,
    required this.rate,
  });

  

  @override
  String toString() {
    return '${rate.toStringAsFixed(5)} $asset_id_quote';
  }


  factory CoinsModel.fromMap(Map<String, dynamic> map) {
    return CoinsModel(
      time: map['time'] as String,
      asset_id_base: map['asset_id_base'] as String,
      asset_id_quote: map['asset_id_quote'] as String,
      rate: map['rate'] as double,
    );
  }


  factory CoinsModel.fromJson(String source) => CoinsModel.fromMap(json.decode(source) as Map<String, dynamic>);
}

