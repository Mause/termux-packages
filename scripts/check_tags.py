import sys
from pathlib import Path
from email.parser import BytesHeaderParser
from packaging.tags import parse_tag
from zipfile import ZipFile

target = sys.argv[1]  # e.g., "manylinux_2_17_aarch64" or "manylinux_2_24_aarch64"

errors = []
for wheel in Path(target).rglob("*.whl"):
    with ZipFile(wheel) as zf:
        dist_info = next(f for f in zf.namelist() if f.endswith(".dist-info/WHEEL"))
        with zf.open(dist_info) as f:
            headers = BytesHeaderParser().parse(f)
            tags = headers.get_all("Tag")
            for tag in tags:
                ptag = parse_tag(tag)
                for stag in ptag:
                    if stag.platform == "linux_aarch64":
                        errors.append(f"{wheel} has linux_aarch64 tag: {tag}")

if errors:
    print("Errors found:")
    for error in errors:
        print(error)
    exit(1)
