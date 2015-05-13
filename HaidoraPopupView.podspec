Pod::Spec.new do |s|
  s.name             = "HaidoraPopupView"
  s.version          = "0.1.0"
  s.summary          = "A short description of HaidoraPopupView."
  s.description      = <<-DESC
                       DESC
  s.homepage         = "https://github.com/Haidora/HaidoraPopupView"
  s.license          = 'MIT'
  s.author           = { "mrdaios" => "mrdaios@gmail.com" }
  s.source           = { :git => "https://github.com/Haidora/HaidoraPopupView.git", :tag => s.version.to_s }
  s.platform     = :ios, '7.0'
  s.requires_arc = true

  s.source_files = 'Pod/Classes/**/*'
#  s.resource_bundles = {
#    'HaidoraPopupView' => ['Pod/Assets/*.png']
#  }

  # s.public_header_files = 'Pod/Classes/**/*.h'
   s.frameworks = 'UIKit', 'Foundation'
  # s.dependency 'AFNetworking', '~> 2.3'
end
