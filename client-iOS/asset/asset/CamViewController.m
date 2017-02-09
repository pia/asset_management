//
//  CamViewController.m
//  asset
//
//  Created by sun on 09/02/2017.
//  Copyright © 2017 sun. All rights reserved.
//

#import "CamViewController.h"

@interface CamViewController ()

@end

@implementation CamViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UIButton *btn=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    [btn setTitle:@"test" forState:UIControlStateNormal];
    btn.frame=CGRectMake(20, 50, 80, 40);
    [self.view addSubview:btn];
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
