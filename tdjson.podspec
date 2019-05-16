Pod::Spec.new do |s|
    s.name             = 'tdjson'
    s.version          = '0.0.1'
    s.summary          = 'Picture in picture video playback for iPhone'

    s.description      = "Telegram client framework for Swift"

    s.homepage         = 'https://github.com/ky1vstar/PiPhone'
    s.license          = { :type => 'MIT', :file => 'LICENSE' }
    s.author           = { 'ky1vstar' => 'ky1vstar@yandex.ru' }
    s.source           = { :http => 'https://uc67a3bdcd42602bc133957fe1e8.dl.dropboxusercontent.com/cd/0/get/Ag866lyNt6mGnhaeEtC4v7JJ4rxC1VSTvewcu3DnykpdtXCHp6jW2Z05IpUkIu1BAVsAVqWoyU3fWADBJbdEOfxtXn-ttLr_U092xE1h9k0G_A/file?dl=1#' }
#   s.source           = { :git => 'https://github.com/ky1vstar/PiPhone.git', :tag => s.version.to_s }

    s.platform = :ios
    s.ios.deployment_target = '8.0'
    s.ios.vendored_frameworks = 'iOS/tdjson.framework'
    s.requires_arc = true

end
