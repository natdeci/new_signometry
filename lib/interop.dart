@JS()
library interop;

import 'package:js/js.dart';

@JS('getCamera')
external void getCamera();

@JS('takePicture')
external void takePicture();