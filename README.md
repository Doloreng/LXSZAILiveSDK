# LXSZAILiveSDK

[![CI Status](https://img.shields.io/travis/Doloreng/LXSZAILiveSDK.svg?style=flat)](https://travis-ci.org/Doloreng/LXSZAILiveSDK)
[![Version](https://img.shields.io/cocoapods/v/LXSZAILiveSDK.svg?style=flat)](https://cocoapods.org/pods/LXSZAILiveSDK)
[![License](https://img.shields.io/cocoapods/l/LXSZAILiveSDK.svg?style=flat)](https://cocoapods.org/pods/LXSZAILiveSDK)
[![Platform](https://img.shields.io/cocoapods/p/LXSZAILiveSDK.svg?style=flat)](https://cocoapods.org/pods/LXSZAILiveSDK)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

### 增加SepcsRepo源

```
# 公开库
pod repo add LXSpecsRepo https://github.com/Doloreng/LXSZPodSpecsRepo.git
# 私有相关的库
pod repo add LXGiteePodSpecsRepo https://gitee.com/roundguo/LXGiteePodSpecsRepo.git

```



### 配置Podfile

```
source 'https://github.com/Doloreng/LXSZPodSpecsRepo.git'
source 'https://cdn.cocoapods.org/'
source 'https://gitee.com/roundguo/LXGiteePodSpecsRepo.git'

target 'MyApp' do
  pod 'LXSZAILiveSDK', '~> 1.0.4'
end
```

## Installation

LXSZAILiveSDK is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'LXSZAILiveSDK'
```

## Author

Doloreng, 576012206@qq.com

## License

LXSZAILiveSDK is available under the MIT license. See the LICENSE file for more info.
