import 'package:dio/dio.dart';
//Strategy Interface
abstract class TicketSubmitStrategy {
  dynamic buildData(
    {
    required String subject,
    required String description,
  }
  );
}
//Concrete Strategie
class FormDataTicketStrategy implements TicketSubmitStrategy {
  @override
  dynamic buildData({
    required String subject,
    required String description,
  }) {
    return FormData.fromMap(
      {
      'Subject': subject,
      'Description': description,
    }
    );
  }
}
