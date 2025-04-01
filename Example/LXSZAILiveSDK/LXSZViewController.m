//
//  LXSZViewController.m
//  LXSZAILiveSDK
//
//  Created by Doloreng on 03/31/2025.
//  Copyright (c) 2025 Doloreng. All rights reserved.
//

#import "LXSZViewController.h"
#import <LXSZAILiveKit/LXSZAILiveKit.h>
#import <Masonry/Masonry.h>

@interface LXSZViewController ()<LXSZAILiveKitDelegate>
@property (nonatomic, strong)UILabel *token_label;
@property (strong, nonatomic) UITextField *tokenTextfield;
@property (nonatomic, strong)UILabel *app_label;
@property (strong, nonatomic) UITextField *appTextfield;
@property (nonatomic, strong)UILabel *env_label;
@property (strong, nonatomic) UITextField *envTextfield;
@property (nonatomic, strong) UIButton *tokenActionBtn;
@property (nonatomic, strong) UIButton *openCreateActionBtn;
@property (nonatomic, strong) UIButton *openLiveRoomActionBtn;
@property (nonatomic, strong) UIButton *openSwitchEnvActionBtn;
@end

@implementation LXSZViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    LXSZAILiveKit.sharedInstance.delegate = self;
    self.view.backgroundColor = UIColor.whiteColor;
    [self.view addSubview:self.token_label];
    [self.view addSubview:self.tokenTextfield];
    [self.view addSubview:self.tokenActionBtn];
    [self.view addSubview:self.openCreateActionBtn];
    [self.view addSubview:self.app_label];
    [self.view addSubview:self.appTextfield];
    [self.view addSubview:self.openLiveRoomActionBtn];
    [self.view addSubview:self.env_label];
    [self.view addSubview:self.envTextfield];
    [self.view addSubview:self.openSwitchEnvActionBtn];
    [self configLayout];
    
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)configLayout  {
    [self.token_label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(20);
        make.top.mas_equalTo(80);
    }];
    [self.tokenTextfield mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.token_label);
        make.left.equalTo(self.token_label.mas_right).offset(10);
        make.right.equalTo(self.view.mas_right).offset(-20);
        make.height.mas_equalTo(36);
    }];
    [self.tokenActionBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.tokenTextfield.mas_bottom).offset(12);
        make.left.equalTo(self.token_label.mas_left);
        make.right.equalTo(self.tokenTextfield.mas_right);
        make.height.mas_equalTo(48);
    }];
    
    [self.openCreateActionBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.tokenActionBtn.mas_bottom).offset(12);
        make.left.equalTo(self.token_label.mas_left);
        make.right.equalTo(self.tokenTextfield.mas_right);
        make.height.mas_equalTo(48);
    }];
    
    [self.app_label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.openCreateActionBtn.mas_bottom).offset(16);
        make.left.equalTo(self.token_label.mas_left);
    }];
    
    [self.appTextfield mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.app_label);
        make.left.equalTo(self.app_label.mas_right).offset(10);
        make.height.mas_equalTo(36);
        make.right.equalTo(self.view.mas_right).offset(-20);
    }];
    [self.openLiveRoomActionBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.appTextfield.mas_bottom).offset(12);
        make.left.equalTo(self.token_label.mas_left);
        make.right.equalTo(self.tokenTextfield.mas_right);
        make.height.mas_equalTo(48);
    }];
    
    [self.env_label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.openLiveRoomActionBtn.mas_bottom).offset(16);
        make.left.equalTo(self.token_label.mas_left);
    }];
    
    [self.envTextfield mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.env_label);
        make.left.equalTo(self.env_label.mas_right).offset(10);
        make.height.mas_equalTo(36);
        make.right.equalTo(self.view.mas_right).offset(-20);
    }];
    [self.openSwitchEnvActionBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.envTextfield.mas_bottom).offset(12);
        make.left.equalTo(self.token_label.mas_left);
        make.right.equalTo(self.envTextfield.mas_right);
        make.height.mas_equalTo(48);
    }];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark action

- (void)tokenActionPressed:(UIButton *)sender  {
    [LXSZAILiveKit.sharedInstance setupLXToken:self.tokenTextfield.text complation:^(LXSZAILiveKitStatus status, NSString * _Nullable errorMsg) {
            
    }];
}
- (void)createRoomActionPressed:(UIButton *)sender  {
    [LXSZAILiveKit.sharedInstance openCreateLiveRoomPage];
    
}
- (void)openRoomActionPressed:(UIButton *)sender  {
    [LXSZAILiveKit.sharedInstance openLiveRoomPageWithAppid:self.appTextfield.text];
}
- (void)switchEvnActionPressed:(UIButton *)sender {
    
    [LXSZAILiveKit.sharedInstance changeLXNetEnvTo:self.envTextfield.text];
}

#pragma mark LXSZAILiveKitDelegate

- (void)onSDKError:(LXSZAILiveKitStatus)error_no errorMsg:(NSString *)errorMsg {
    NSLog(@"直播sdk信息: %@",errorMsg);
}

#pragma mark lazzy

- (UILabel *)token_label {
    if (!_token_label) {
        UILabel *tempLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        tempLabel.text = @"请输入token:";
        tempLabel.font = [UIFont systemFontOfSize:16];
        _token_label = tempLabel;
    }
    return _token_label;
}

- (UITextField *)tokenTextfield {
    if (!_tokenTextfield) {
        UITextField *textF = [[UITextField alloc] initWithFrame:CGRectZero];
        textF.borderStyle = UITextBorderStyleRoundedRect;
        textF.placeholder = @"请输入lx_token";
        textF.text = @"50142_1751117883_24a6bca2861d5afa96dfadda6c7b18f8";
        textF.font = [UIFont systemFontOfSize:14];
        _tokenTextfield = textF;
    }
    return _tokenTextfield;
}

- (UIButton *)tokenActionBtn {
    if (!_tokenActionBtn) {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
        button.backgroundColor = UIColor.darkGrayColor;
        button.layer.cornerRadius = 24;
        button.layer.masksToBounds = YES;
        [button setTitleColor:UIColor.whiteColor forState:UIControlStateNormal];
        [button setTitle:@"登录灵犀" forState:UIControlStateNormal];
        [button addTarget:self action:@selector(tokenActionPressed:) forControlEvents:UIControlEventTouchUpInside];
        button.titleLabel.font = [UIFont systemFontOfSize:16];
        _tokenActionBtn = button;
    }
    return _tokenActionBtn;
}
- (UIButton *)openCreateActionBtn {
    if (!_openCreateActionBtn) {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
        button.backgroundColor = UIColor.darkGrayColor;
        button.layer.cornerRadius = 24;
        button.layer.masksToBounds = YES;
        [button setTitleColor:UIColor.whiteColor forState:UIControlStateNormal];
        [button setTitle:@"创建直播间" forState:UIControlStateNormal];
        button.titleLabel.font = [UIFont systemFontOfSize:16];
        [button addTarget:self action:@selector(createRoomActionPressed:) forControlEvents:UIControlEventTouchUpInside];
        _openCreateActionBtn = button;
    }
    return _openCreateActionBtn;
}

- (UILabel *)app_label {
    if (!_app_label) {
        UILabel *tempLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        tempLabel.text = @"请输入直播间id:";
        tempLabel.font = [UIFont systemFontOfSize:16];
        _app_label = tempLabel;
    }
    return _app_label;
}

- (UITextField *)appTextfield {
    if (!_appTextfield) {
        UITextField *textF = [[UITextField alloc] initWithFrame:CGRectZero];
        textF.borderStyle = UITextBorderStyleRoundedRect;
        textF.placeholder = @"请输入lx_appid";
        textF.text  = @"164236";
        textF.font = [UIFont systemFontOfSize:14];
        _appTextfield = textF;
    }
    return _appTextfield;
}

- (UIButton *)openLiveRoomActionBtn {
    if (!_openLiveRoomActionBtn) {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
        button.backgroundColor = UIColor.darkGrayColor;
        button.layer.cornerRadius = 24;
        button.layer.masksToBounds = YES;
        [button setTitleColor:UIColor.whiteColor forState:UIControlStateNormal];
        [button setTitle:@"进入直播间" forState:UIControlStateNormal];
        button.titleLabel.font = [UIFont systemFontOfSize:16];
        [button addTarget:self action:@selector(openRoomActionPressed:) forControlEvents:UIControlEventTouchUpInside];
        _openLiveRoomActionBtn = button;
    }
    return _openLiveRoomActionBtn;
}

- (UILabel *)env_label {
    if (!_env_label) {
        UILabel *tempLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        tempLabel.text = @"请输入环境url:";
        tempLabel.font = [UIFont systemFontOfSize:16];
        _env_label = tempLabel;
    }
    return _env_label;
}

- (UITextField *)envTextfield {
    if (!_envTextfield) {
        UITextField *textF = [[UITextField alloc] initWithFrame:CGRectZero];
        textF.borderStyle = UITextBorderStyleRoundedRect;
        textF.placeholder = @"https://xxx.lnsee.com";
        textF.text  = @"https://testing.lnsee.com";
        textF.font = [UIFont systemFontOfSize:14];
        _envTextfield = textF;
    }
    return _envTextfield;
}

- (UIButton *)openSwitchEnvActionBtn {
    if (!_openSwitchEnvActionBtn) {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
        button.backgroundColor = UIColor.darkGrayColor;
        button.layer.cornerRadius = 24;
        button.layer.masksToBounds = YES;
        [button setTitleColor:UIColor.whiteColor forState:UIControlStateNormal];
        [button setTitle:@"切换环境" forState:UIControlStateNormal];
        button.titleLabel.font = [UIFont systemFontOfSize:16];
        [button addTarget:self action:@selector(switchEvnActionPressed:) forControlEvents:UIControlEventTouchUpInside];
        _openSwitchEnvActionBtn = button;
    }
    return _openSwitchEnvActionBtn;
}

@end
