import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';

Future<String> getBalances(String address,String chain) async {

    final url = Uri.http('192.168.29.79', '/getTokenBalance', {
      'address': address,
      'chain': chain,
    });

    final response = await http.get(url);
    print(response);
    if (response.statusCode == 200) {
      return response.body;
    } else {
      throw Exception('Failed to get balances');
    }
}