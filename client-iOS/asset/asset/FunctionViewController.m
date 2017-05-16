//
//  FunctionViewController.m
//  asset
//
//  Created by sure on 16/05/2017.
//  Copyright © 2017 sun. All rights reserved.
//

#import "FunctionViewController.h"
#import <SDAutoLayout.h>
#import "ScanViewController.h"
#import "ViewController.h"
#import "InfoViewController.h"
#import "HistoryViewController.h"

@interface FunctionViewController ()

@end

@implementation FunctionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    self.title=@"功能列表";
    
    UIButton *scanBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 0, 0)];
    [scanBtn setTitle:@"扫码查询" forState:UIControlStateNormal];
    scanBtn.backgroundColor = [UIColor redColor];
    [self.view addSubview:scanBtn];
    scanBtn.sd_layout.topSpaceToView(self.view, 100).heightIs(50).leftSpaceToView(self.view, 50).rightSpaceToView(self.view, 50);
    [scanBtn addTarget:self action:@selector(goTo1) forControlEvents:UIControlEventTouchDown];

    UIButton *manualBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 0, 0)];
    [manualBtn setTitle:@"手动查询" forState:UIControlStateNormal];
    manualBtn.backgroundColor = [UIColor redColor];
    [self.view addSubview:manualBtn];
    manualBtn.sd_layout.topSpaceToView(scanBtn, 80).heightIs(50).leftSpaceToView(self.view, 50).rightSpaceToView(self.view, 50);
    [manualBtn addTarget:self action:@selector(goTo2) forControlEvents:UIControlEventTouchDown];
    
    UIButton *hisBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 0, 0)];
    [hisBtn setTitle:@"历史记录" forState:UIControlStateNormal];
    hisBtn.backgroundColor = [UIColor redColor];
    [self.view addSubview:hisBtn];
    hisBtn.sd_layout.topSpaceToView(manualBtn, 80).heightIs(50).leftSpaceToView(self.view, 50).rightSpaceToView(self.view, 50);
    [hisBtn addTarget:self action:@selector(goTo3) forControlEvents:UIControlEventTouchDown];
}

- (void)goTo1 {
    ScanViewController *view1=[[ScanViewController alloc] init];
    [self.navigationController pushViewController:view1 animated:YES];
}

- (void)goTo2 {
    ViewController *view2=[[ViewController alloc] init];
    [self.navigationController pushViewController:view2 animated:YES];
}

- (void)goTo3 {
    HistoryViewController *view3=[[HistoryViewController alloc] init];
    [self.navigationController pushViewController:view3 animated:YES];
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
