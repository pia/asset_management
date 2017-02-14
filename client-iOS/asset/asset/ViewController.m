//
//  ViewController.m
//  asset
//
//  Created by sun on 09/02/2017.
//  Copyright © 2017 sun. All rights reserved.
//

#import "ViewController.h"
#import <Chameleon.h>
#import "InfoViewController.h"
#import <SYScanCodeViewController.h>

@interface ViewController ()

@end

@implementation ViewController

@synthesize searchTextbox=_searchTextbox;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

#pragma mark tabBar -
    UIImage *searchIcon = [[UIImage imageNamed:@"Search"] imageWithRenderingMode:UIImageRenderingModeAutomatic];
    UITabBarItem *leftTabItem=[[UITabBarItem alloc] initWithTitle:@"搜索" image:searchIcon tag:1];
    self.tabBarItem=leftTabItem;
    
#pragma mark searchField -
    self.searchTextbox=[[UITextField alloc]initWithFrame:CGRectMake(33, (self.view.bounds.size.height-75)/2, self.view.bounds.size.width-66, 50)];
    self.searchTextbox.borderStyle=UITextBorderStyleRoundedRect;
    self.searchTextbox.clearButtonMode =UITextFieldViewModeWhileEditing;
    self.searchTextbox.placeholder = @"请输入编号....";
    self.searchTextbox.keyboardType = UIKeyboardTypeNumberPad;//UIKeyboardTypeNumberPad;
    self.searchTextbox.returnKeyType =UIReturnKeySearch;
    [self.view addSubview:self.searchTextbox];
    self.searchTextbox.delegate=self;
    
}


- (BOOL)textFieldShouldEndEditing:(UITextField *)textField{
    NSLog(@"%@",self.searchTextbox.text);
    self.assetID=self.searchTextbox.text;
    //TODO 判断是否为其他无关字符
    switch (self.assetID.length) {
        case 10:{
            InfoViewController *infoView=[[InfoViewController alloc] init];
            infoView._text=self.assetID;
            [self.navigationController pushViewController:infoView animated:YES];
        }break;
        case 0:{
            NSLog(@"没有输入");
        }break;
        default:{
            //提示框
            UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示" message:@"输入十位数字!" preferredStyle:UIAlertControllerStyleAlert];
            [alert addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                //点击按钮的响应事件；
            }]];
            [self presentViewController:alert animated:true completion:nil];
        }break;
    }
    
    return YES;
}

//点屏幕空白处收回键盘 | 开始搜索
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.searchTextbox resignFirstResponder];
    //[self.tabBarController ]
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
