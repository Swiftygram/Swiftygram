#!/bin/bash

env -i swiftc -emit-executable -o "Laurine/laurine" "Laurine/LaurineGenerator.swift"

"Laurine/laurine" -i "Source/AuthUI/iOS/en.lproj/Localizable.strings" -o "Source/AuthUI/iOS/Localizations.swift"
