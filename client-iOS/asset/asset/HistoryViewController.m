//
//  HistoryViewController.m
//  asset
//
//  Created by sure on 16/05/2017.
//  Copyright © 2017 sun. All rights reserved.
//

#import "HistoryViewController.h"
#import <SDAutoLayout.h>
#import "PITool.h"
#import "InfoViewController.h"
#import <FlatUIKit.h>

@interface HistoryViewController ()

@end

@implementation HistoryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title=@"历史记录";
    self.view.backgroundColor = [UIColor whiteColor];
    
    PITool *t = [[PITool alloc] init];
    NSString *title5 = [t getFromFile];
    NSString *title4 = [t getFromFile];
    NSString *title3 = [t getFromFile];
    NSString *title2 = [t getFromFile];
    NSString *title1 = [t getFromFile];
    
    FUIButton *btn1 = [[FUIButton alloc] initWithFrame:CGRectMake(90, 200, 100, 60)];
    btn1.buttonColor = [UIColor turquoiseColor];
    btn1.shadowColor = [UIColor greenSeaColor];
    btn1.shadowHeight = 3.0f;
    btn1.cornerRadius = 6.0f;
    btn1.titleLabel.font = [UIFont boldFlatFontOfSize:16];
    [btn1 setTitle:title1 forState:UIControlStateNormal];
    [btn1 setTitleColor:[UIColor cloudsColor] forState:UIControlStateNormal];
    [btn1 setTitleColor:[UIColor cloudsColor] forState:UIControlStateHighlighted];
    [self.view addSubview:btn1];
    btn1.sd_layout.topSpaceToView(self.view, 100).heightIs(50).leftSpaceToView(self.view, 50).rightSpaceToView(self.view, 50);
    btn1.tag = 1;
    [btn1 addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchDown];
    
    FUIButton *btn2 = [[FUIButton alloc] initWithFrame:CGRectMake(90, 200, 100, 60)];
    btn2.buttonColor = [UIColor turquoiseColor];
    btn2.shadowColor = [UIColor greenSeaColor];
    btn2.shadowHeight = 3.0f;
    btn2.cornerRadius = 6.0f;
    btn2.titleLabel.font = [UIFont boldFlatFontOfSize:16];
    [btn2 setTitle:title2 forState:UIControlStateNormal];
    [btn2 setTitleColor:[UIColor cloudsColor] forState:UIControlStateNormal];
    [btn2 setTitleColor:[UIColor cloudsColor] forState:UIControlStateHighlighted];
    [self.view addSubview:btn2];
    btn2.sd_layout.topSpaceToView(btn1, 20).heightIs(50).leftSpaceToView(self.view, 50).rightSpaceToView(self.view, 50);
    btn2.tag = 2;
    [btn2 addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchDown];
    
    FUIButton *btn3 = [[FUIButton alloc] initWithFrame:CGRectMake(90, 200, 100, 60)];
    btn3.buttonColor = [UIColor turquoiseColor];
    btn3.shadowColor = [UIColor greenSeaColor];
    btn3.shadowHeight = 3.0f;
    btn3.cornerRadius = 6.0f;
    btn3.titleLabel.font = [UIFont boldFlatFontOfSize:16];
    [btn3 setTitle:title3 forState:UIControlStateNormal];
    [btn3 setTitleColor:[UIColor cloudsColor] forState:UIControlStateNormal];
    [btn3 setTitleColor:[UIColor cloudsColor] forState:UIControlStateHighlighted];
    [self.view addSubview:btn3];
    btn3.sd_layout.topSpaceToView(btn2, 20).heightIs(50).leftSpaceToView(self.view, 50).rightSpaceToView(self.view, 50);
    btn3.tag = 3;
    [btn3 addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchDown];
    
    FUIButton *btn4 = [[FUIButton alloc] initWithFrame:CGRectMake(90, 200, 100, 60)];
    btn4.buttonColor = [UIColor turquoiseColor];
    btn4.shadowColor = [UIColor greenSeaColor];
    btn4.shadowHeight = 3.0f;
    btn4.cornerRadius = 6.0f;
    btn4.titleLabel.font = [UIFont boldFlatFontOfSize:16];
    [btn4 setTitle:title4 forState:UIControlStateNormal];
    [btn4 setTitleColor:[UIColor cloudsColor] forState:UIControlStateNormal];
    [btn4 setTitleColor:[UIColor cloudsColor] forState:UIControlStateHighlighted];
    [self.view addSubview:btn4];
    btn4.sd_layout.topSpaceToView(btn3, 20).heightIs(50).leftSpaceToView(self.view, 50).rightSpaceToView(self.view, 50);
    btn4.tag = 4;
    [btn4 addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchDown];
    
    FUIButton *btn5 = [[FUIButton alloc] initWithFrame:CGRectMake(90, 200, 100, 60)];
    btn5.buttonColor = [UIColor turquoiseColor];
    btn5.shadowColor = [UIColor greenSeaColor];
    btn5.shadowHeight = 3.0f;
    btn5.cornerRadius = 6.0f;
    btn5.titleLabel.font = [UIFont boldFlatFontOfSize:16];
    [btn5 setTitle:title5 forState:UIControlStateNormal];
    [btn5 setTitleColor:[UIColor cloudsColor] forState:UIControlStateNormal];
    [btn5 setTitleColor:[UIColor cloudsColor] forState:UIControlStateHighlighted];
    [self.view addSubview:btn5];
    btn5.sd_layout.topSpaceToView(btn4, 20).heightIs(50).leftSpaceToView(self.view, 50).rightSpaceToView(self.view, 50);
    btn5.tag = 5;
    [btn5 addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchDown];

}

- (IBAction)click:(id)sender
{
    UIButton *button = (UIButton *)sender;
    NSLog(@"click : %@",((UIButton *)[self.view viewWithTag:button.tag]).titleLabel.text);
    
    NSString *id = ((UIButton *)[self.view viewWithTag:button.tag]).titleLabel.text;
    InfoViewController *infoView=[[InfoViewController alloc] init];
    infoView._text = id;
    [self.navigationController pushViewController:infoView animated:YES];
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
