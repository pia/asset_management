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

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    //UIImage *cameraIcon = [[UIImage imageNamed:@"camera@3x.png"] imageWithRenderingMode:UIImageRenderingModeAutomatic];
//    UITabBarItem *leftTabItem=[[UITabBarItem alloc] initWithTabBarSystemItem:UITabBarSystemItemSearch tag:404];
//    self.tabBarItem=leftTabItem;
    UIImage *searchIcon = [[UIImage imageNamed:@"search@2x.png"] imageWithRenderingMode:UIImageRenderingModeAutomatic];
    UITabBarItem *leftTabItem=[[UITabBarItem alloc] initWithTitle:@"." image:searchIcon tag:10];
    self.tabBarItem=leftTabItem;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
