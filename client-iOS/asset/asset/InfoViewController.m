//
//  InfoViewController.m
//  asset
//
//  Created by pia on 2/12/17.
//  Copyright © 2017 pia. All rights reserved.
//

#import "InfoViewController.h"
#import "AFHTTPSessionManager.h"
#import "PITool.h"

@interface InfoViewController ()

@end

@implementation InfoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor=[UIColor whiteColor];
    self.title=@"结果";
    
    NSString *URLString = @"http://52.199.159.200:5000/asset/";
    URLString = [[URLString stringByAppendingString:self._text] stringByAppendingString:@".json"];
    //NSLog(@"URLString : %@",URLString);
    
    //复制到剪切板
    PITool *p = [[PITool alloc] init];
    [p copyToPasteboard:self._text];
    
    //表格--->
    _infoTable=[[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    //自动调整子视图大小
    _infoTable.autoresizingMask=UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
    _infoTable.delegate=self;
    _infoTable.dataSource=self;
    _infoTable.tableFooterView=nil;
    _infoTable.tableHeaderView=nil;
    [self.view addSubview:_infoTable];
    
    _titleArray=[NSArray arrayWithObjects:@"资产名称",@"资产编号",@"购置日期",@"存放地点",@"总价",@"使用人",@"现状",@"资产状态",@"生产厂家",@"出厂编号",@"型号",@"规格",@"使用部门", nil];
    _detail=[[NSMutableArray alloc] init];
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager GET:URLString parameters:nil progress:nil success:^(NSURLSessionTask *task, id responseObject) {
//        NSLog(@"JSON: %@", responseObject);
        id obj = responseObject;
        NSDictionary *dic = (NSDictionary *)obj;
        _assetName  = [dic objectForKey:@"assetName"];
        _assetDate  = [dic objectForKey:@"assetDate"];
        _assetPlace = [dic objectForKey:@"assetPlace"];
        _assetPrice = [dic objectForKey:@"assetPrice"];
        _assetUser  = [dic objectForKey:@"assetUser"];
        _assetID = self._text;
        _var7 = [dic objectForKey:@"currentStatus"];
        _var8 = [dic objectForKey:@"assetStatus"];
        _var9 = [dic objectForKey:@"manufacturer"];
        _var10 = [dic objectForKey:@"serialNumber"];
        _var11 = [dic objectForKey:@"model"];
        _var12 = [dic objectForKey:@"specification"];
        _var13 = [dic objectForKey:@"department"];
        _detail=[NSMutableArray arrayWithObjects:_assetName, _assetID, _assetDate, _assetPlace, _assetPrice, _assetUser, _var7, _var8, _var9, _var10, _var11, _var12, _var13, nil];
        //NSLog(@"DETAIL : %@",_detail);
        [_infoTable reloadData];

    } failure:^(NSURLSessionTask *operation, NSError *error) {
        NSLog(@"Error: %@", error);
    }];

    _detail=[NSMutableArray arrayWithObjects:@"没找到",@"没找到",@"没找到",@"没找到",@"没找到",@"没找到",@"没找到",@"没找到",@"没找到",@"没找到",@"没找到",@"没找到",@"没找到", nil];
    [_infoTable reloadData];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _titleArray.count;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    return @"此次查询到的结果：";
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *strTitle=@"title";
    //尝试获得可复用的单元格,如果没得到，则返回nil
    UITableViewCell *cell=[_infoTable dequeueReusableCellWithIdentifier:strTitle];
    if (cell==nil) {
        cell=[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue2 reuseIdentifier:strTitle];
    }

    cell.textLabel.textAlignment = NSTextAlignmentLeft;
    cell.textLabel.text=[_titleArray objectAtIndex:indexPath.row];
    cell.detailTextLabel.text=[_detail objectAtIndex:indexPath.row];

    return cell;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
