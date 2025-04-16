//
//  LXSZAILiveKit.h
//  LXSZAILiveKit
//
//  Created by hongkunpeng on 2025/3/31.
//

#import <Foundation/Foundation.h>

//! Project version number for LXSZAILiveKit.
FOUNDATION_EXPORT double LXSZAILiveKitVersionNumber;

//! Project version string for LXSZAILiveKit.
FOUNDATION_EXPORT const unsigned char LXSZAILiveKitVersionString[];

// In this header, you should import all the public headers of your framework using statements like #import <LXSZAILiveKit/PublicHeader.h>


typedef enum : NSUInteger {
    LXSZAILiveKitStatusSuccess = 0,
    LXSZAILiveKitStatusLoginError = 10010101,
    LXSZAILiveKitStatusUserError = 10010102,
    LXSZAILiveKitStatusAppinfoError = 10010201,
    LXSZAILiveKitStatusChannelError = 10010538,
    LXSZAILiveKitStatusTokenInvalError = 10010506,
    LXSZAILiveKitStatusChangeEvnError = 10010301,
} LXSZAILiveKitStatus;

NS_ASSUME_NONNULL_BEGIN

@protocol LXSZAILiveKitDelegate <NSObject>

@optional

/// sdk的错误信息
/// - Parameters:
///   - error_no: 错误码
///   - errorMsg: 错误信息
- (void)onSDKError:(LXSZAILiveKitStatus)error_no errorMsg:(NSString *)errorMsg;

@end

@interface LXSZAILiveKit : NSObject
/// 启动的初始化逻辑， 是否同意了隐私协议
/// - Parameter isAgree: 是否同意隐私协议
/// - Parameter sdk_channel: sdk的渠道号
+ (BOOL)lxInitConfigWithAgree:(BOOL)isAgree sdk_channel:(NSString *)sdk_channel;
+ (instancetype)sharedInstance;

@property (nonatomic, weak)id<LXSZAILiveKitDelegate> delegate;


/// 设置灵犀的登录token
/// - Parameter lx_token: token
///   - completion: 回调
- (void)setupLXToken:(nonnull NSString *)lx_token complation:(nullable  void(^)(LXSZAILiveKitStatus status, NSString * __nullable errorMsg))completion;
/// sdk的版本号
- (NSString *)sdkVersion;

/// 打开创建直播间页面
- (void)openCreateLiveRoomPage;

/// 打开直播间预览页面
/// - Parameter appid: 直播间id
- (void)openLiveRoomPageWithAppid:(NSString *)appid;

/// 打开直播间编辑页面
/// - Parameter appid: appi
- (void)openEditLiveRoomPageWithAppid:(NSString *)appid;

/// 切换灵犀的运行环境
/// - Parameter hostUrl: host Url
- (void)changeLXNetEnvTo:(NSString *)hostUrl;

/// 退出登录
- (void)loginOut;

/// 清空web登录的缓存
/// - Parameter completion: 回调
- (void)clearWebUserCache:(nullable void(^)(void))completion;

/// 清理SDK的缓存，包括文件、图片、web登录
/// - Parameter completion: 回调
- (void)clearSDKCache:(nullable void(^)(void))completion;

@end

NS_ASSUME_NONNULL_END
