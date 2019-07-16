#!/bin/bash

env -i swiftc -emit-executable -o "Laurine/laurine" "Laurine/LaurineGenerator.swift"

"Laurine/laurine" -i "Source/iOS/en.lproj/Localizable.strings" -o "Source/iOS/Localizations.swift"
