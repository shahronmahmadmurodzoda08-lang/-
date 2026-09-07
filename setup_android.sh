#!/bin/sh
set -e
flutter create --platforms=android .
flutter pub get
echo "Project ready. Run: flutter build apk --release"
