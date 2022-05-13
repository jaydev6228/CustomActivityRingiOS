#
# Be sure to run `pod lib lint CustomActivityRingiOS.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'CustomActivityRingiOS'
  s.version          = '0.1.5'
  s.summary          = 'Library to use with some custome functionCustomActivityRingiOS.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = 'CustomActivityRingiOS is library to use with some custome function. User can set custom sctivity ring colors.'

  s.homepage         = 'https://github.com/jaydev6228/CustomActivityRingiOS'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'jaydev6228' => 'jaydevbaloliya@gmail.com' }
  s.source           = { :git => 'https://github.com/jaydev6228/CustomActivityRingiOS.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '9.0'
  
  s.swift_version = "4.0"

  s.source_files = 'CustomActivityRingiOS/Classes/**/*'
  
  # s.resource_bundles = {
  #   'CustomActivityRingiOS' => ['CustomActivityRingiOS/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  s.dependency 'My-Coacapods', :git =>  'https://github.com/jaydev6228/My-Coacapods.git'
end 
 