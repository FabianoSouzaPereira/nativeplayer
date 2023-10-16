enum ResultStatusCode { ok, badRequest, unauthorized, notFound, timeout, internalServerError, unknow }

extension HttpCode on ResultStatusCode {
  int get code {
    switch (this) {
      case ResultStatusCode.ok:
        return 200;
      case ResultStatusCode.badRequest:
        return 400;
      case ResultStatusCode.unauthorized:
        return 403;
      case ResultStatusCode.notFound:
        return 404;
      case ResultStatusCode.timeout:
        return 408;
      case ResultStatusCode.internalServerError:
        return 500;
      case ResultStatusCode.unknow:
        return 0;
    }
  }
}
