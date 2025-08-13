import 'dart:convert';
import "package:http/http.dart" as http;
import 'package:flutter/material.dart';
import 'package:marketool_financer/src/models/pie_chart_model.dart';

class CustodyService {
  final _baseUrl = "http://10.0.2.2:3000";

  // REGISTRAR OPERAÇÃO FINANCEIRA NO BANCO DE DADOS:
  Future<bool> addOperation(Map<String, dynamic> data) async {
    final url = Uri.parse("$_baseUrl/operation");

    final response = await http.post(
      url,
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(data),
    );

    if (response.statusCode == 201) {
      return true;
    }
    return false;
  }

  // CAPTURAR CUSTÓDIA DO USUÁRIO PARA INSTANCIAR LISTA DE PIECHARTMODEL:
  Future<List<PieChartModel>> getPieChartData(int userId) async {
    final url = Uri.parse("$_baseUrl/custody/$userId");

    final response = await http.get(url);

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      final List<Color> palette = [
        Colors.red,
        Colors.blue,
        Colors.green,
        Colors.orange,
        Colors.purple,
        Colors.teal,
        Colors.amber,
        Colors.cyan,
        Colors.indigo,
        Colors.pink,
      ];

      return data.asMap().entries.map((entry) {
        final index = entry.key;
        final json = entry.value;
        final custodyItem = PieChartModel.fromJson(json);

        return PieChartModel(
          ticker: custodyItem.ticker,
          quantity: custodyItem.quantity,
          totalInvested: custodyItem.totalInvested,
          percentage: custodyItem.percentage,
          color: palette[index % palette.length],
        );
      }).toList();
    } else {
      throw Exception("Falha ao carregar dados da custódia");
    }
  }
}
