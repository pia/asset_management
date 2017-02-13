//
//  InfoViewController.m
//  asset
//
//  Created by Pater Rechards on 2/12/17.
//  Copyright © 2017 sun. All rights reserved.
//

#import "InfoViewController.h"
#import <Chameleon.h>
#import "DataProvider.h"
#import "ConfigurationTemplate.h"

@interface InfoViewController ()

@end

@implementation InfoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor=[UIColor flatWhiteColor];
    self.title=@"结果";
    NSLog(@"assetID is %@ //传值成功",self._text);
    
    DataProvider *mProvider=[[DataProvider alloc] init];
    [mProvider parseData];
    
    
    //表格--->
    _infoTable=[[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    //自动调整子视图大小
    _infoTable.autoresizingMask=UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
    _infoTable.delegate=self;
    _infoTable.dataSource=self;
    _infoTable.tableFooterView=nil;
    _infoTable.tableHeaderView=nil;
    [self.view addSubview:_infoTable];
    
    _titleArray=[NSArray arrayWithObjects:@"资产名称",@"资产编号",@"购置日期",@"存放地点",@"总价",@"使用人", nil];
    _detail=[[NSArray alloc] init];
    _detail=mProvider.Info;
    [_infoTable reloadData];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _titleArray.count;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *strTitle=@"title";
    //尝试获得可复用的单元格,如果没得到，则返回nil
    UITableViewCell *cell=[_infoTable dequeueReusableCellWithIdentifier:strTitle];
    if (cell==nil) {
        cell=[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:strTitle];
    }
    //如果想让textlabel和detailtextlabel都左对齐，初始化时选择样式UITableViewCellStyleValue2，然后设置cell.textlabel.textAlignment = NSTextAlignmentLeft;
    //因为设置textlabel的textAlignment起作用，而设置detailtextlabel的textAlignment不起作用。
    //也可选择样式UITableViewCellStyleDefault，然后自定义一个label加到cell上再设置textAlignment
    cell.textLabel.textAlignment = NSTextAlignmentLeft;
    cell.textLabel.text=[_titleArray objectAtIndex:indexPath.row];
    cell.detailTextLabel.text=[_detail objectAtIndex:indexPath.row];
    UIImage *cellImage=nil;
    switch (indexPath.row) {
        case 0: cellImage=[UIImage imageNamed:@"name"]; break;
        case 1: cellImage=[UIImage imageNamed:@"id"]; break;
        case 2: cellImage=[UIImage imageNamed:@"time"]; break;
        case 3: cellImage=[UIImage imageNamed:@"place"]; break;
        case 4: cellImage=[UIImage imageNamed:@"price"]; break;
        default: cellImage=[UIImage imageNamed:@"user"]; break;
    }
    cell.imageView.image = cellImage;//[UIImage imageNamed:@"name"];
    return cell;
}

//- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
//    return 60;
//}

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
