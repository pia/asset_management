//
//  TodayViewController.m
//  todayWidget
//
//  Created by sure on 23/05/2017.
//  Copyright © 2017 sun. All rights reserved.
//

#import "TodayViewController.h"
#import <NotificationCenter/NotificationCenter.h>

@interface TodayViewController () <NCWidgetProviding>

@end

@implementation TodayViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    //UIButton *b = [[UIButton alloc] initWithFrame:CGRectMake(30, 30, [UIScreen mainScreen].bounds.size.width - 30*2, 40)];
    UIButton *b = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width -20, 100)];
    
    [b setTitle:@"Tap To Open" forState:UIControlStateNormal];
    b.titleLabel.font = [UIFont systemFontOfSize: 25];
    [b addTarget:self action:@selector(cl:) forControlEvents:UIControlEventTouchUpInside];
    [b setContentHorizontalAlignment:UIControlContentHorizontalAlignmentCenter];
    [b setContentVerticalAlignment:UIControlContentVerticalAlignmentCenter];
    [b setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.view addSubview:b];
}

- (IBAction)cl:(id)sender {
    NSURL *url = [NSURL URLWithString:@"tech://asset"];
    NSLog(@"success...");
    [self.extensionContext openURL:url completionHandler:^(BOOL success) {} ];
    NSLog(@"%f,%f",[UIScreen mainScreen].bounds.size.width,[UIScreen mainScreen].bounds.size.height);
}

//- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
//    NSURL *url = [NSURL URLWithString:@"tech://asset"];
//    NSLog(@"success...");
//    [self.extensionContext openURL:url completionHandler:^(BOOL success) {} ];
//}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)widgetPerformUpdateWithCompletionHandler:(void (^)(NCUpdateResult))completionHandler {
    // Perform any setup necessary in order to update the view.
    
    // If an error is encountered, use NCUpdateResultFailed
    // If there's no update required, use NCUpdateResultNoData
    // If there's an update, use NCUpdateResultNewData

    completionHandler(NCUpdateResultNewData);
}

@end
