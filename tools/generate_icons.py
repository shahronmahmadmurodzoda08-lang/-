#!/usr/bin/env python3
"""
Generate platform launcher icons for the Farhangshinos Flutter app.

Usage:
  python tools/generate_icons.py

Requires:
  pip install pillow
"""
from pathlib import Path
from PIL import Image, ImageOps

ROOT = Path(__file__).resolve().parents[1]
SOURCE = ROOT / "assets" / "ic_launcher.png"

if not SOURCE.exists():
    raise SystemExit(f"Missing {SOURCE}")

img = Image.open(SOURCE).convert("RGB")
icon = ImageOps.fit(img, (1024, 1024), method=Image.Resampling.LANCZOS, centering=(0.5, 0.46))

android = {
    "mipmap-mdpi": 48, "mipmap-hdpi": 72, "mipmap-xhdpi": 96,
    "mipmap-xxhdpi": 144, "mipmap-xxxhdpi": 192
}
for folder, size in android.items():
    out = ROOT / "android/app/src/main/res" / folder
    out.mkdir(parents=True, exist_ok=True)
    icon.resize((size, size), Image.Resampling.LANCZOS).save(out/"ic_launcher.png", optimize=True)

ios_dir = ROOT / "ios/Runner/Assets.xcassets/AppIcon.appiconset"
ios_dir.mkdir(parents=True, exist_ok=True)
specs = [(20,1),(20,2),(20,3),(29,1),(29,2),(29,3),(40,1),(40,2),(40,3),
         (60,2),(60,3),(76,1),(76,2),(83.5,2),(1024,1)]
for logical, scale in specs:
    px = int(round(logical * scale))
    name = f"Icon-App-{str(logical).replace('.', '_')}x{str(logical).replace('.', '_')}@{scale}x.png"
    icon.resize((px, px), Image.Resampling.LANCZOS).save(ios_dir/name, optimize=True)

win = ROOT / "windows/runner/resources"
win.mkdir(parents=True, exist_ok=True)
icon.convert("RGBA").save(win/"app_icon.ico",
                         sizes=[(16,16),(32,32),(48,48),(64,64),(128,128),(256,256)])
print("Android + iOS + Windows icons generated.")
