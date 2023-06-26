import 'package:http/http.dart' as http;
import 'dart:convert';

Future<bool> login(String companyName, String employeeNumber) async {
  var url = 'https://your-api-url.com/login';

  var response = await http.post(
    Uri.parse(url),
    body: {
      'companyName': companyName,
      'employeeNumber': employeeNumber,
    },
  );

  if (response.statusCode == 200) {
    var responseBody = jsonDecode(response.body);

    return responseBody['success'];
  } else {
    return false;
  }
}
