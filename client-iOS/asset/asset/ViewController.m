//
//  ViewController.m
//  asset
//
//  Created by sun on 09/02/2017.
//  Copyright © 2017 sun. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

@synthesize searchTextbox=_searchTextbox;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
#pragma mark tabBar -
//    UIImage *cameraIcon = [[UIImage imageNamed:@"camera@3x.png"] imageWithRenderingMode:UIImageRenderingModeAutomatic];
//    UITabBarItem *leftTabItem=[[UITabBarItem alloc] initWithTabBarSystemItem:UITabBarSystemItemSearch tag:404];
//    self.tabBarItem=leftTabItem;
    UIImage *searchIcon = [[UIImage imageNamed:@"search@2x.png"] imageWithRenderingMode:UIImageRenderingModeAutomatic];
    UITabBarItem *leftTabItem=[[UITabBarItem alloc] initWithTitle:@"." image:searchIcon tag:1];
    self.tabBarItem=leftTabItem;
    
#pragma mark searchField -
    self.searchTextbox=[[UITextField alloc]initWithFrame:CGRectMake(33, (self.view.bounds.size.height-75)/2, self.view.bounds.size.width-66, 50)];
    self.searchTextbox.borderStyle=UITextBorderStyleRoundedRect;
    self.searchTextbox.clearButtonMode =UITextFieldViewModeWhileEditing;
    self.searchTextbox.placeholder = @"请输入编号....";
    self.searchTextbox.keyboardType = UIKeyboardTypeDefault;//UIKeyboardTypeNumberPad;
    self.searchTextbox.returnKeyType =UIReturnKeySearch;
    [self.view addSubview:self.searchTextbox];
    self.searchTextbox.delegate=self;
}

- (BOOL)textFieldShouldEndEditing:(UITextField *)textField{
    NSLog(@"%@",self.searchTextbox.text);
    return YES;
}

//点屏幕空白处收回键盘
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.searchTextbox resignFirstResponder];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
