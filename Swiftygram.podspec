Pod::Spec.new do |s|
    s.name             = 'Swiftygram'
    s.version          = '0.0.1'
    s.summary          = 'Picture in picture video playback for iPhone'

    s.description      = "Telegram client framework for Swift"

    s.homepage         = 'https://github.com/ky1vstar/Swiftygram'
    s.license          = { :type => 'MIT', :file => 'LICENSE' }
    s.author           = { 'ky1vstar' => 'ky1vstar@yandex.ru' }
    s.source           = { :git => 'https://github.com/ky1vstar/Swiftygram.git', :tag => s.version.to_s }


    s.requires_arc = true
    s.platforms = { :ios => "9.0", :osx => "10.10", :watchos => "2.0" }
    
    s.frameworks = ['Foundation']
    s.dependency 'tdjson'
    s.default_subspec = 'Core'

    s.subspec 'Core' do |ss|
        ss.source_files = 'Source/Core/**/*.{swift}'
        
        ss.ios.dependency 'Swiftygram/AuthUI'
    end
    
    s.subspec 'AuthUI' do |ss|
        ss.platform = :ios

        ss.ios.source_files = 'Source/AuthUI/iOS/**/*.{swift}'
        ss.ios.resources = 'Source/AuthUI/iOS/**/*.{plist,xib,strings,xcassets}'
        ss.ios.dependency 'libPhoneNumber-iOS'
        ss.ios.frameworks = ['UIKit', 'CoreTelephony']
    end
end
