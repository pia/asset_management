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

@interface HistoryViewController ()

@end

@implementation HistoryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title=@"历史记录";
    self.view.backgroundColor = [UIColor orangeColor];
    
    //
    PITool *t = [[PITool alloc] init];
    
    UIButton *btn1 = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 0, 0)];
    [btn1 setTitle:[t getFromFile] forState:UIControlStateNormal];
    btn1.backgroundColor = [UIColor redColor];
    [self.view addSubview:btn1];
    btn1.sd_layout.topSpaceToView(self.view, 100).heightIs(50).leftSpaceToView(self.view, 0).rightSpaceToView(self.view, 0);
    btn1.tag = 1;
    [btn1 addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchDown];
    
    UIButton *btn2 = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 0, 0)];
    [btn2 setTitle:[t getFromFile] forState:UIControlStateNormal];
    btn2.backgroundColor = [UIColor redColor];
    [self.view addSubview:btn2];
    btn2.sd_layout.topSpaceToView(btn1, 0).heightIs(50).leftSpaceToView(self.view, 0).rightSpaceToView(self.view, 0);
    btn2.tag = 2;
    [btn2 addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchDown];
    
    UIButton *btn3 = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 0, 0)];
    [btn3 setTitle:[t getFromFile] forState:UIControlStateNormal];
    btn3.backgroundColor = [UIColor redColor];
    [self.view addSubview:btn3];
    btn3.sd_layout.topSpaceToView(btn2, 0).heightIs(50).leftSpaceToView(self.view, 0).rightSpaceToView(self.view, 0);
    btn3.tag = 3;
    [btn3 addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchDown];
    
    UIButton *btn4 = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 0, 0)];
    [btn4 setTitle:[t getFromFile] forState:UIControlStateNormal];
    btn4.backgroundColor = [UIColor redColor];
    [self.view addSubview:btn4];
    btn4.sd_layout.topSpaceToView(btn3, 0).heightIs(50).leftSpaceToView(self.view, 0).rightSpaceToView(self.view, 0);
    btn4.tag = 4;
    [btn4 addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchDown];
    
    UIButton *btn5 = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 0, 0)];
    [btn5 setTitle:[t getFromFile] forState:UIControlStateNormal];
    btn5.backgroundColor = [UIColor redColor];
    [self.view addSubview:btn5];
    btn5.sd_layout.topSpaceToView(btn4, 0).heightIs(50).leftSpaceToView(self.view, 0).rightSpaceToView(self.view, 0);
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
