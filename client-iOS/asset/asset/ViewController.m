//
//  ViewController.m
//  asset
//
//  Created by pia on 09/02/2017.
//  Copyright © 2017 pia. All rights reserved.
//

#import "ViewController.h"
#import <SDAutoLayout.h>
#import "InfoViewController.h"

@interface ViewController ()

@end

@implementation ViewController

@synthesize searchTextbox=_searchTextbox;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor whiteColor];

#pragma mark tabBar -
    UIImage *searchIcon = [[UIImage imageNamed:@"Search"] imageWithRenderingMode:UIImageRenderingModeAutomatic];
    UITabBarItem *leftTabItem=[[UITabBarItem alloc] initWithTitle:@"搜索" image:searchIcon tag:1];
    self.tabBarItem=leftTabItem;
    
#pragma mark searchField -
    self.searchTextbox=[[UITextField alloc] initWithFrame:CGRectMake(0, 0, 0, 0)];
    self.searchTextbox.borderStyle=UITextBorderStyleRoundedRect;
    self.searchTextbox.clearButtonMode =UITextFieldViewModeWhileEditing;
    self.searchTextbox.placeholder = @"请输入编号....";
    self.searchTextbox.keyboardType = UIKeyboardTypeNumberPad;//UIKeyboardTypeNumberPad;
    self.searchTextbox.returnKeyType =UIReturnKeySearch;
    [self.view addSubview:self.searchTextbox];
    self.searchTextbox.sd_layout.leftSpaceToView(self.view, 33).rightSpaceToView(self.view, 33).topSpaceToView(self.view, 200).heightIs(50);
    self.searchTextbox.delegate=self;
    
}


- (BOOL)textFieldShouldEndEditing:(UITextField *)textField{
//    NSLog(@"%@",self.searchTextbox.text);
//    self.assetID=self.searchTextbox.text;
////    //TODO 判断是否为其他无关字符
//    switch (self.assetID.length) {
//        case 0: {
//            NSLog(@"用户没有输入");
//            break;
//        }
//        default:{
//            InfoViewController *infoView=[[InfoViewController alloc] init];
//            infoView._text=self.assetID;
//            [self.navigationController pushViewController:infoView animated:YES];
//        }
//    }

    
    return YES;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    NSLog(@"%@",self.searchTextbox.text);
    self.assetID=self.searchTextbox.text;
    //    //TODO 判断是否为其他无关字符
    switch (self.assetID.length) {
        case 0: {
            NSLog(@"用户没有输入");
            break;
        }
        default:{
            InfoViewController *infoView=[[InfoViewController alloc] init];
            infoView._text=self.assetID;
            [self.navigationController pushViewController:infoView animated:YES];
        }
    }
    return YES;
}

//点屏幕空白处收回键盘 | 开始搜索
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    //[self.searchTextbox resignFirstResponder];
    [self.view endEditing:YES];
    //[self.tabBarController ]
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
