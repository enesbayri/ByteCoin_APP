
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_18/models/coin_model.dart';
import 'package:flutter_application_18/services/api_services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final dioProvider=Provider<Dio>((ref) => ApiServices.getdio());

final futureCoinProvider=FutureProvider<CoinsModel>((ref) async{
  final dio=ref.watch(dioProvider);
  final requestCount=ref.watch(requestCountProvider);
  debugPrint(requestCount.toString());
  final result=(await dio.get("${ApiServices.from}/${ApiServices.to}")).data;
  Map<String,dynamic> resultMap={"time":result["time"],"asset_id_base":result["asset_id_base"],"asset_id_quote":result["asset_id_quote"],"rate":result["rate"],};
  CoinsModel coin=CoinsModel.fromMap(resultMap);
  return coin;
});

final requestCountProvider=StateProvider<int>((ref,) => 0);
