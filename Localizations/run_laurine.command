#!/bin/bash

cd "$(dirname "$BASH_SOURCE")" || {
    echo "Error getting script directory" >&2
    exit 1
}

env -i swiftc -emit-executable -o "Laurine/laurine" "Laurine/LaurineGenerator.swift"

"Laurine/laurine" -i "../Source/AuthUI/iOS/en.lproj/Localizable.strings" -o "../Source/AuthUI/iOS/Localizations.swift"
