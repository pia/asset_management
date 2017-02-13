//
//  CamViewController.m
//  asset
//
//  Created by sun on 09/02/2017./var/folders/jm/x7w81ss90wzdrsmx97swch8r0000gn/T/AppIconMaker/appicon.png/var/folders/jm/x7w81ss90wzdrsmx97swch8r0000gn/T/AppIconMaker/appicon.png
//  Copyright © 2017 sun. All rights reserved./var/folders/jm/x7w81/var/folders/jm/x7w81ss90wzdrsmx97swch8r0000gn/T/AppIconMaker/appicon.pngss90wzdrsmx97swch8r0000gn/T/AppIconMaker/appicon.png
//

#import "CamViewController.h"
#import <Chameleon.h>

@interface CamViewController ()

@end

@implementation CamViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UIImage *cameraIcon = [[UIImage imageNamed:@"Camera"] imageWithRenderingMode:UIImageRenderingModeAutomatic];
    UITabBarItem *rightTabItem=[[UITabBarItem alloc] initWithTitle:@"扫一扫" image:cameraIcon tag:2];
    self.tabBarItem=rightTabItem;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
