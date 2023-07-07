// class ApiResponse<T> {
//   String? message;
//   bool? status;
//   int? code;
//   T? result;
//
//
//   ApiResponse({this.message, this.status, this.code, this.result});
//
//   // ApiResponse.loading(this.message) : status = Status.LOADING;
//   //
//   // ApiResponse.completed(this.result) : status = Status.COMPLETED;
//   //
//   // ApiResponse.error(this.message) : status = Status.ERROR;
//
//   @override
//   String toString() {
//     return "Status : $status \n Message : $message \n Data : $result";
//   }
//   T getObject<T>(Map<String, dynamic> json) {
//     switch (T) {
//       case LoginResponseStudioModel:
//         return LoginResponseStudioModel.fromJson(json) as T;
//     // // @HiveType(typeId: 0)
//     //   case Shutdown:
//     //     return Shutdown.fromJson(json) as T;
//     // // @HiveType(typeId: 1)
//     //   case ShutdownTask:
//     //     return ShutdownTask.fromJson(json) as T;
//     // // @HiveType(typeId: 2)
//     //   case DelayCause:
//     //     return DelayCause.fromJson(json) as T;
//     // // @HiveType(typeId: 3)
//     //   case CompanyUserDelayCauseType:
//     //     return CompanyUserDelayCauseType.fromJson(json) as T;
//     // // @HiveType(typeId: 4)
//     //   case SafetyIncident:
//     //     return SafetyIncident.fromJson(json) as T;
//     // // @HiveType(typeId: 5)
//     //   case SafetyInjury:
//     //     return SafetyInjury.fromJson(json) as T;
//     // // @HiveType(typeId: 6)
//     //   case ShutdownTaskProgress:
//     //     return ShutdownTaskProgress.fromJson(json) as T;
//     // // @HiveType(typeId: 7)
//     //   case CompanyUserInfo:
//     //     return CompanyUserInfo.fromJson(json) as T;
//     // // @HiveType(typeId: 8)
//     //   case CompanySiteArea:
//     //     return CompanySiteArea.fromJson(json) as T;
//     // // @HiveType(typeId: 8)
//     //   case DashboardDetails:
//     //     return DashboardDetails.fromJson(json) as T;
//       default:
//         throw UnsupportedError('Not supported model');
//     }
//   }
// }

// enum Status { LOADING, COMPLETED, ERROR }

class ApiResponse<T extends Serializable> {
  dynamic? status;
  bool? otpVerified;
  bool? documentVerified;
  String? message;
  int? code;
  T? result;

  ApiResponse(
      {this.status,
      this.message,
      this.result,
      this.code,
      this.otpVerified,
      this.documentVerified});

  factory ApiResponse.fromJson(
      Map<String, dynamic> json, Function(Map<String, dynamic>) create) {
    return ApiResponse<T>(
      otpVerified: json["otpVerified"],
      documentVerified: json["documentVerified"],
      status: json["status"],
      message: json["message"],
      code: json["code"],
      result: create(json["result"] ?? {'result': ''}),
    );
  }

  Map<String, dynamic> toJson() => {
        "otpVerified": otpVerified,
        "documentVerified": documentVerified,
        "status": status,
        "message": message,
        "code": code,
        "result": result?.toJson(),
      };
}

abstract class Serializable {
  Map<String, dynamic> toJson();
}
