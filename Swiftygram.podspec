Pod::Spec.new do |s|
    s.name             = 'Swiftygram'
    s.version          = '0.0.1'
    s.summary          = 'Picture in picture video playback for iPhone'

    s.description      = "Telegram client framework for Swift"

    s.homepage         = 'https://github.com/ky1vstar/Swiftygram'
    s.license          = { :type => 'MIT', :file => 'LICENSE' }
    s.author           = { 'ky1vstar' => 'ky1vstar@yandex.ru' }
    s.source           = { :git => 'https://github.com/ky1vstar/PiPhone.git', :tag => s.version.to_s }

    s.platform = :ios
    s.source_files = 'Source/**/*.{swift}'
    s.resources = 'Source/**/*.{plist,xib,strings}'
    s.requires_arc = true

    s.ios.deployment_target = '9.0'
    s.ios.dependency 'tdjson'

    s.frameworks = ['Foundation']
end
