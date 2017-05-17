//
//  ViewController.m
//  登录／欢迎界面
//
//  Created by Peter on 15/8/11.
//  Copyright (c) 2015年 Peter. All rights reserved.
//

#import "WelcomeViewController.h"
#import "FunctionViewController.h"
#import <FlatUIKit.h>

#define mainSize    [UIScreen mainScreen].bounds.size

#define offsetLeftHand      60

#define rectLeftHand        CGRectMake(61-offsetLeftHand, 90, 40, 65)
#define rectLeftHandGone    CGRectMake(mainSize.width / 2 - 100, vLogin.frame.origin.y - 22, 40, 40)

#define rectRightHand       CGRectMake(imgLogin.frame.size.width / 2 + 60, 90, 40, 65)
#define rectRightHandGone   CGRectMake(mainSize.width / 2 + 62, vLogin.frame.origin.y - 22, 40, 40)

@interface WelcomeViewController ()<UITextFieldDelegate>
{
    UITextField* txtUser;
    UITextField* txtPwd;
    
    UIImageView* imgLeftHand;
    UIImageView* imgRightHand;
    
    UIImageView* imgLeftHandGone;
    UIImageView* imgRightHandGone;
    
    JxbLoginShowType showType;
}
@end

@implementation WelcomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIImageView* imgLogin = [[UIImageView alloc] initWithFrame:CGRectMake(mainSize.width / 2 - 211 / 2, 100 -30, 211, 109)];//
    imgLogin.image = [UIImage imageNamed:@"owl-login"];
    imgLogin.layer.masksToBounds = YES;
    [self.view addSubview:imgLogin];
    
    imgLeftHand = [[UIImageView alloc] initWithFrame:rectLeftHand];
    imgLeftHand.image = [UIImage imageNamed:@"owl-login-arm-left"];
    [imgLogin addSubview:imgLeftHand];
    
    imgRightHand = [[UIImageView alloc] initWithFrame:rectRightHand];
    imgRightHand.image = [UIImage imageNamed:@"owl-login-arm-right"];
    [imgLogin addSubview:imgRightHand];
    
    UIView* vLogin = [[UIView alloc] initWithFrame:CGRectMake(15, 200 -30, mainSize.width - 30, 160)];//
    vLogin.layer.borderWidth = 0.5;
    vLogin.layer.borderColor = [[UIColor lightGrayColor] CGColor];
    vLogin.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:vLogin];
    
    imgLeftHandGone = [[UIImageView alloc] initWithFrame:rectLeftHandGone];
    imgLeftHandGone.image = [UIImage imageNamed:@"icon_hand"];
    [self.view addSubview:imgLeftHandGone];
    
    imgRightHandGone = [[UIImageView alloc] initWithFrame:rectRightHandGone];
    imgRightHandGone.image = [UIImage imageNamed:@"icon_hand"];
    [self.view addSubview:imgRightHandGone];
    
    txtUser = [[UITextField alloc] initWithFrame:CGRectMake(30, 30, vLogin.frame.size.width - 60, 44)];
    txtUser.delegate = self;
    txtUser.layer.cornerRadius = 5;
    txtUser.layer.borderColor = [[UIColor lightGrayColor] CGColor];
    txtUser.layer.borderWidth = 0.5;
    txtUser.leftView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 44, 44)];
    txtUser.leftViewMode = UITextFieldViewModeAlways;
    UIImageView* imgUser = [[UIImageView alloc] initWithFrame:CGRectMake(11, 11, 22, 22)];
    imgUser.image = [UIImage imageNamed:@"iconfont-user"];
    [txtUser.leftView addSubview:imgUser];
    [vLogin addSubview:txtUser];
    
    txtPwd = [[UITextField alloc] initWithFrame:CGRectMake(30, 90, vLogin.frame.size.width - 60, 44)];
    txtPwd.delegate = self;
    txtPwd.layer.cornerRadius = 5;
    txtPwd.layer.borderColor = [[UIColor lightGrayColor] CGColor];
    txtPwd.layer.borderWidth = 0.5;
    txtPwd.secureTextEntry = YES;
    txtPwd.leftView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 44, 44)];
    txtPwd.leftViewMode = UITextFieldViewModeAlways;
    UIImageView* imgPwd = [[UIImageView alloc] initWithFrame:CGRectMake(11, 11, 22, 22)];
    imgPwd.image = [UIImage imageNamed:@"iconfont-password"];
    [txtPwd.leftView addSubview:imgPwd];
    [vLogin addSubview:txtPwd];
    
    
}

- (void)textFieldDidBeginEditing:(UITextField *)textField {
    if ([textField isEqual:txtUser]) {
        if (showType != JxbLoginShowType_PASS)
        {
            showType = JxbLoginShowType_USER;
            return;
        }
        showType = JxbLoginShowType_USER;
        [UIView animateWithDuration:0.5 animations:^{
            imgLeftHand.frame = CGRectMake(imgLeftHand.frame.origin.x - offsetLeftHand, imgLeftHand.frame.origin.y + 30, imgLeftHand.frame.size.width, imgLeftHand.frame.size.height);
            
            imgRightHand.frame = CGRectMake(imgRightHand.frame.origin.x + 48, imgRightHand.frame.origin.y + 30, imgRightHand.frame.size.width, imgRightHand.frame.size.height);
            
            
            imgLeftHandGone.frame = CGRectMake(imgLeftHandGone.frame.origin.x - 70, imgLeftHandGone.frame.origin.y, 40, 40);
            
            imgRightHandGone.frame = CGRectMake(imgRightHandGone.frame.origin.x + 30, imgRightHandGone.frame.origin.y, 40, 40);
            
            
        } completion:^(BOOL b) {
        }];
        
    }
    else if ([textField isEqual:txtPwd]) {
        if (showType == JxbLoginShowType_PASS)
        {
            showType = JxbLoginShowType_PASS;
            return;
        }
        showType = JxbLoginShowType_PASS;
        [UIView animateWithDuration:0.5 animations:^{
            imgLeftHand.frame = CGRectMake(imgLeftHand.frame.origin.x + offsetLeftHand, imgLeftHand.frame.origin.y - 30, imgLeftHand.frame.size.width, imgLeftHand.frame.size.height);
            imgRightHand.frame = CGRectMake(imgRightHand.frame.origin.x - 48, imgRightHand.frame.origin.y - 30, imgRightHand.frame.size.width, imgRightHand.frame.size.height);
            
            
            imgLeftHandGone.frame = CGRectMake(imgLeftHandGone.frame.origin.x + 70, imgLeftHandGone.frame.origin.y, 0, 0);
            
            imgRightHandGone.frame = CGRectMake(imgRightHandGone.frame.origin.x - 30, imgRightHandGone.frame.origin.y, 0, 0);
            
        } completion:^(BOOL b) {
        }];
    }
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    //NSLog(@"usr: %@ , passwd: %@", txtUser.text, txtPwd.text);
    if ([txtUser isFirstResponder])
    {
        [txtPwd becomeFirstResponder];
        NSLog(@"1-->2");
        return YES;
    }
    if ([txtUser.text  isEqual: @"q"] && [txtPwd.text  isEqual: @"q"]) {
        //登录成功
        NSLog(@"successs.");
        FunctionViewController *funtionView=[[FunctionViewController alloc] init];
        [self.navigationController pushViewController:funtionView animated:YES];
    }else{
        //提示框
        FUIAlertView *alertView = [[FUIAlertView alloc] initWithTitle:@"提示"
                                                              message:@"密码或用户名不对"
                                                             delegate:nil cancelButtonTitle:@"关闭"
                                                    otherButtonTitles: nil];
        alertView.titleLabel.textColor = [UIColor cloudsColor];
        alertView.titleLabel.font = [UIFont boldFlatFontOfSize:16];
        alertView.messageLabel.textColor = [UIColor cloudsColor];
        alertView.messageLabel.font = [UIFont flatFontOfSize:14];
        alertView.backgroundOverlay.backgroundColor = [[UIColor cloudsColor] colorWithAlphaComponent:0.8];
        alertView.alertContainer.backgroundColor = [UIColor midnightBlueColor];
        alertView.defaultButtonColor = [UIColor cloudsColor];
        alertView.defaultButtonShadowColor = [UIColor asbestosColor];
        alertView.defaultButtonFont = [UIFont boldFlatFontOfSize:16];
        alertView.defaultButtonTitleColor = [UIColor asbestosColor];
        [alertView show];
    }
    return YES;
}

//点屏幕空白处收回键盘
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
}

@end
