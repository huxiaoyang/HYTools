#
#  Be sure to run `pod spec lint HYTools.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see https://docs.cocoapods.org/specification.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |s|

  s.name         = 'HYTools'
  s.summary      = 'A tools module for void repo'
  s.version      = '0.0.7'
  s.license      = { :type => 'MIT', :file => 'LICENSE' }
  s.authors      = { 'huxiaoyang' => 'yohuyang@gmail.com' }
  s.homepage     = 'https://github.com/huxiaoyang/HYTools'
  s.platform     = :ios, '8.0'
  s.ios.deployment_target = '8.0'
  s.source       = { :git => 'https://github.com/huxiaoyang/HYTools.git', :tag => s.version.to_s }

  s.requires_arc = true
  
  s.default_subspec = 'All'
  s.subspec 'All' do |ss|
    ss.dependency 'HYTools/HYBase'
    ss.dependency 'HYTools/YYBase'
  end

  s.subspec 'HYBase' do |ss|
    ss.source_files = 'Classes/Tools+Categories.h', 'Classes/Categories/*.{h,m}', 'Classes/Utils/*.{h,m}'
  end

  s.subspec 'YYBase' do |ss|
    ss.source_files = 'Classes/YYBase/YYTools+Categories.h', 'Classes/YYBase/YYKitMacro.h', 'Classes/YYBase/**/*.{h,m}'
  end

end
