class GenericResponse {
  bool success;
  int status;
  String? message;
  dynamic body;
  dynamic error;

  GenericResponse(
      {this.success = false,
      this.status = 400,
      this.message,
      this.body,
      this.error});
}
