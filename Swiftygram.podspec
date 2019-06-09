Pod::Spec.new do |s|
    s.name             = 'Swiftygram'
    s.version          = '0.0.1'
    s.summary          = 'Picture in picture video playback for iPhone'

    s.description      = "Telegram client framework for Swift"

    s.homepage         = 'https://github.com/ky1vstar/PiPhone'
    s.license          = { :type => 'MIT', :file => 'LICENSE' }
    s.author           = { 'ky1vstar' => 'ky1vstar@yandex.ru' }
    s.source           = { :git => 'https://github.com/ky1vstar/PiPhone.git', :tag => s.version.to_s }

    s.platform = :ios
    s.ios.deployment_target = '8.0'
    s.source_files = 'Source/**/*.{swift}'
    s.requires_arc = true

    s.default_subspecs = 'tdjson'

    s.frameworks = ['Foundation']

    s.subspec 'tdjson' do |sp|
        sp.ios.deployment_target = '8.0'
        sp.ios.preserve_path = 'tdjson/iOS/*'
        sp.ios.vendored_frameworks = 'tdjson/iOS/tdjson.framework'
    end
end
