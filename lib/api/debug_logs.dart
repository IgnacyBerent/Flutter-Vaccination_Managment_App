import 'dart:developer';

void debugLogs(int responseCode, int succesCode) {
  if (responseCode == succesCode) {
    log('Success');
  } else if (responseCode == 401 || responseCode == 403) {
    log('Authorization error');
    throw Exception('Authorization error');
  } else if (responseCode >= 500) {
    log('Server error');
    throw Exception('Server error');
  } else {
    log('$responseCode - Other error');
    throw Exception('$responseCode - other error');
  }
}
