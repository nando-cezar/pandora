import 'dart:js' as js;

void setCookie(String name, String value, int days) {
  js.context.callMethod('setCookie', [name, value, days]);
}
