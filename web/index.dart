// Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'segra_service.dart' as segra;
import 'dart:html';

main(){
  segra.sendOrder().then((response) {
    querySelector("#segraResult").setInnerHtml(response);
  });
}
