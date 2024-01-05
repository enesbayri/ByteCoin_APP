// ignore_for_file: constant_identifier_names

import 'package:dio/dio.dart';

class ApiServices{
  static const String _ApiKey="YOUR_API_KEY";
  static String baseUrl="https://rest.coinapi.io/v1/exchangerate/";
  static const headers={"X-CoinAPI-Key":_ApiKey};
  static String from="BTC";
  static String to="USD";

  static Dio getdio()=> Dio(BaseOptions(baseUrl: baseUrl,headers: headers));
}

