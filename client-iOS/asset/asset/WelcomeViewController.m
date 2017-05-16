//
//  WelcomeViewController.m
//  asset
//
//  Created by sure on 16/05/2017.
//  Copyright © 2017 sun. All rights reserved.
//

#import "WelcomeViewController.h"
#import <SDAutoLayout.h>

@interface WelcomeViewController ()

@end

@implementation WelcomeViewController

@synthesize usrInput = _usrInput;
@synthesize passwordInput = _passwordInput;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    //welcome
    UILabel *welcome = [[UILabel alloc] initWithFrame:CGRectMake(100, 90, 100, 50)];
    welcome.textColor = [UIColor blackColor];
    welcome.font = [UIFont systemFontOfSize:30];
    welcome.textAlignment = NSTextAlignmentCenter;
    welcome.text = @"欢迎";
    //welcome.sd_layout.leftSpaceToView(self.view, 33).rightSpaceToView(self.view, 33).topSpaceToView(self.view, 50).heightIs(50);
    [self.view addSubview:welcome];
    
    //用户名
    UILabel *usr = [[UILabel alloc] initWithFrame:CGRectMake(10, 150, 100, 60)];
    usr.textColor = [UIColor blackColor];
    usr.font = [UIFont systemFontOfSize:30];
    usr.text = @"用户名:";
    [self.view addSubview:usr];
    
    UITextField *usrInput = [[UITextField alloc] initWithFrame:CGRectMake(120, 150, 200, 60)];
    self.usrInput.borderStyle=UITextBorderStyleLine;
    self.usrInput.clearButtonMode =UITextFieldViewModeWhileEditing;
    self.usrInput.layer.borderColor = [UIColor blackColor].CGColor;
    self.usrInput.layer.borderWidth = 1;
    self.usrInput.placeholder = @"请输入用户名";
    self.usrInput.delegate = self;
    [self.view addSubview:usrInput];

    //用户密码
    UILabel *password = [[UILabel alloc] initWithFrame:CGRectMake(10, 250, 100, 60)];
    password.textColor = [UIColor blackColor];
    password.font = [UIFont systemFontOfSize:30];
    password.text = @"密码:";
    [self.view addSubview:password];
    
    UITextField *passwordInput = [[UITextField alloc] initWithFrame:CGRectMake(120, 250, 200, 60)];
    passwordInput.borderStyle=UITextBorderStyleRoundedRect;
    passwordInput.clearButtonMode =UITextFieldViewModeWhileEditing;
    passwordInput.layer.borderColor = [UIColor blackColor].CGColor;
    passwordInput.layer.borderWidth = 1;
    passwordInput.placeholder = @"请输入密码";
    [passwordInput setSecureTextEntry:YES];
    passwordInput.delegate = self;
    [self.view addSubview:passwordInput];

    
    //login
    UIButton *loginBtn = [[UIButton alloc] initWithFrame:CGRectMake(90, 400, 90, 90)];
    [loginBtn setTitle:@"登陆" forState:UIControlStateNormal];
    [self.view addSubview:loginBtn];
    [loginBtn addTarget:self action:@selector(login) forControlEvents:UIControlEventTouchUpInside];
    [loginBtn setBackgroundColor:[UIColor redColor]];
    

}

- (void)login {
    NSLog(@"the text is %@",_usrInput.text);

}

- (BOOL)textFieldShouldEndEditing:(UITextField *)textField{
    NSLog(@"%@",self.usrInput.text);
    
    return YES;
}

//点屏幕空白处收回键盘
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
