//
//  FunctionViewController.m
//  功能列表
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
#import <FlatUIKit.h>

@interface FunctionViewController ()

@end

@implementation FunctionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    self.title=@"功能列表";
    
    FUIButton *scanBtn = [[FUIButton alloc] initWithFrame:CGRectMake(90, 200, 100, 60)];
    scanBtn.buttonColor = [UIColor turquoiseColor];
    scanBtn.shadowColor = [UIColor greenSeaColor];
    scanBtn.shadowHeight = 3.0f;
    scanBtn.cornerRadius = 6.0f;
    scanBtn.titleLabel.font = [UIFont boldFlatFontOfSize:16];
    [scanBtn setTitle:@"扫码查询" forState:UIControlStateNormal];
    [scanBtn setTitleColor:[UIColor cloudsColor] forState:UIControlStateNormal];
    [scanBtn setTitleColor:[UIColor cloudsColor] forState:UIControlStateHighlighted];
    [self.view addSubview:scanBtn];
    scanBtn.sd_layout.topSpaceToView(self.view, 100).heightIs(50).leftSpaceToView(self.view, 50).rightSpaceToView(self.view, 50);
    [scanBtn addTarget:self action:@selector(goTo1) forControlEvents:UIControlEventTouchDown];
    
    FUIButton *manualBtn = [[FUIButton alloc] initWithFrame:CGRectMake(90, 200, 100, 60)];
    manualBtn.buttonColor = [UIColor turquoiseColor];
    manualBtn.shadowColor = [UIColor greenSeaColor];
    manualBtn.shadowHeight = 3.0f;
    manualBtn.cornerRadius = 6.0f;
    manualBtn.titleLabel.font = [UIFont boldFlatFontOfSize:16];
    [manualBtn setTitle:@"手动查询" forState:UIControlStateNormal];
    [manualBtn setTitleColor:[UIColor cloudsColor] forState:UIControlStateNormal];
    [manualBtn setTitleColor:[UIColor cloudsColor] forState:UIControlStateHighlighted];
    [self.view addSubview:manualBtn];
    manualBtn.sd_layout.topSpaceToView(scanBtn, 100).heightIs(50).leftSpaceToView(self.view, 50).rightSpaceToView(self.view, 50);
    [manualBtn addTarget:self action:@selector(goTo2) forControlEvents:UIControlEventTouchDown];
    
    FUIButton *hisBtn = [[FUIButton alloc] initWithFrame:CGRectMake(90, 200, 100, 60)];
    hisBtn.buttonColor = [UIColor turquoiseColor];
    hisBtn.shadowColor = [UIColor greenSeaColor];
    hisBtn.shadowHeight = 3.0f;
    hisBtn.cornerRadius = 6.0f;
    hisBtn.titleLabel.font = [UIFont boldFlatFontOfSize:16];
    [hisBtn setTitle:@"历史记录" forState:UIControlStateNormal];
    [hisBtn setTitleColor:[UIColor cloudsColor] forState:UIControlStateNormal];
    [hisBtn setTitleColor:[UIColor cloudsColor] forState:UIControlStateHighlighted];
    [self.view addSubview:hisBtn];
    hisBtn.sd_layout.topSpaceToView(manualBtn, 100).heightIs(50).leftSpaceToView(self.view, 50).rightSpaceToView(self.view, 50);
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
    //init order
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:@"0" forKey:@"10"];
    [defaults synchronize];
    
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
