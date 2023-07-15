// class ApiResponse<T extends Serializable> {
//   String? status;
//   String? message;
//   int? code;
//   T? result;
//
//   ApiResponse({
//     this.status,
//     this.message,
//     this.result,
//     this.code,
//   });
//
//   factory ApiResponse.fromJson(
//       Map<String, dynamic> json, Function(Map<String, dynamic>) create) {
//     return ApiResponse<T>(
//       status: json["status"],
//       message: json["message"],
//       code: json["code"],
//       result: create(json["result"] ?? {'result': ''}),
//     );
//   }
//
//   Map<String, dynamic> toJson() => {
//         "status": status,
//         "message": message,
//         "code": code,
//         "result": result?.toJson(),
//       };
// }
//
// abstract class Serializable {
//   Map<String, dynamic> toJson();
// }
