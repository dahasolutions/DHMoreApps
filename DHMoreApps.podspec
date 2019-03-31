#
# Be sure to run `pod lib lint DHMoreApps.podspec' to ensure this is a
# valid spec and remove all comments before submitting the spec.
#
# Any lines starting with a # are optional, but encouraged
#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = "DHMoreApps"
  s.version          = "0.1.9"
  s.summary          = "DHMoreApps presents a view controller similar to the App Store to show your apps."
  s.description      = <<-DESC
                       DHMoreApps is an iOS library created to present a view controller inside your application to show your developer page of apps. It is very similar to the App Store visual.
                       DESC
  s.homepage         = "https://github.com/dahasolutions/DHMoreApps"
  s.license          = 'MIT'
  s.author           = { "DHs" => "dahasolutions@gmail.com" }
  s.source           = { :git => "https://github.com/dahasolutions/DHMoreApps.git", :tag => s.version.to_s }

  s.platform     = :ios, '8.0'
  s.requires_arc = true

  s.source_files = 'Pod/Classes/**/*'
  s.frameworks = 'UIKit'
  s.dependency 'SDWebImage'
end
