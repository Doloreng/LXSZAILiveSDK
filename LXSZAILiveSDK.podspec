#
# Be sure to run `pod lib lint LXSZAILiveSDK.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'LXSZAILiveSDK'
  s.version          = '1.0.2'
  s.summary          = 'A short description of LXSZAILiveSDK.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC

  s.homepage         = 'https://github.com/Doloreng/LXSZAILiveSDK'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Doloreng' => '576012206@qq.com' }
  s.source           = { :git => 'https://github.com/Doloreng/LXSZAILiveSDK.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '12.1'
  s.platform     = :ios, '12.1'
  s.vendored_frameworks = 'LXSZAILiveSDK/Frameworks/LXSZAILiveKit.framework'
  s.source_files = 'LXSZAILiveSDK/Frameworks/LXSZAILiveKit.framework/Headers/*.h'
  s.public_header_files = 'LXSZAILiveSDK/Frameworks/LXSZAILiveKit.framework/Headers/*.h'

  s.frameworks = 'AVFoundation','AudioToolbox','CoreGraphics','CoreMedia','GLKit','UIKit','VideoToolbox'
  s.requires_arc = true
  s.libraries = 'c++'
  s.resource_bundles = {
      'LXSZAILiveSDK' => ['LXSZAILiveSDK/Frameworks/LXSZAILiveKit.framework/*.bundle']
  }
  
  s.pod_target_xcconfig = {
    'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'arm64',
    'OTHER_LDFLAGS' => '-ObjC',
    'BITCODE_GENERATION_MODE' => 'NO'
  }
  s.user_target_xcconfig = { 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'arm64' }

  s.dependency 'AFNetworking'
  s.dependency 'Aspects'
  s.dependency 'ASValueTrackingSlider'
  s.dependency 'CocoaAsyncSocket'
  s.dependency 'CocoaLumberjack'
  s.dependency 'GGWkCookie'
  s.dependency 'HWPanModal'
  s.dependency 'IQKeyboardManager'
  s.dependency 'JXCategoryView'
  s.dependency 'lottie-ios_Oc'
  s.dependency 'SDWebImage'
  s.dependency 'MJRefresh'
  s.dependency 'Masonry'
  s.dependency 'MMKV'
  s.dependency 'YYModel'
  s.dependency 'QCloudCOSXML'
  s.dependency 'QCloudCore'
  s.dependency 'KTVHTTPCache'
  s.dependency 'SJVideoPlayer'
  s.dependency 'lottie-ios_Oc'
  s.dependency 'ffmpeg-kit-ios-full-gpl'
  s.dependency 'UMCommon'
  s.dependency 'UMDevice'
  s.dependency 'UMAPM'
  s.dependency 'SAMKeychain'
  s.dependency 'WebRTC-Mute'
  s.dependency 'RegexKitLite'
  s.dependency 'QCloudTrack/Cls'
  s.dependency 'WebViewJavascriptBridge'
  s.dependency 'MBProgressHUD'
end
