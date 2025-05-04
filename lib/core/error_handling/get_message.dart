import 'package:dio/dio.dart';

String getMessage(DioException e) {
  final data = e.response?.data;

  if (data != null) {
    print(data);

    switch (e.response?.statusCode) {
      case 422:
      // اول تلاش برای گرفتن message کلی
        if (data['message'] != null && data['message'].toString().isNotEmpty) {
          return data['message'];
        }
        // سپس تلاش برای گرفتن اولین ارور دقیق از errors
        if (data['errors'] != null && data['errors'] is Map) {
          final errors = data['errors'] as Map;
          if (errors.isNotEmpty) {
            final firstError = errors.values.first;
            if (firstError is List && firstError.isNotEmpty) {
              return firstError.first.toString();
            }
          }
        }
        return "خطایی در ارسال داده‌ها رخ داده است.";

      case 401:
        return "توکن شما منقضی شده است";
      case 404:
        return "api مورد نظر یافت نشد.";
      case 402:
        return "نام کاربری یا رمز عبور اشتباه است.";
      case 410:
        return "شناسه دستگاه شما اشتباه می‌باشد";
      case 409:
        return "شما یک کار در حال انجام دارید.";
      case 450:
        return "این آیتم قبلاً به لیست علاقه‌مندی‌ها اضافه شده است.";
      case 500:
        return "از سمت سرور خطا رخ داده است.";
      default:
        return e.toString();
    }
  }

  return "خطای ناشناخته‌ای رخ داده است.";
}
