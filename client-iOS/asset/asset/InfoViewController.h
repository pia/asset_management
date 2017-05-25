//
//  InfoViewController.h
//  asset
//
//  Created by pia on 2/12/17.
//  Copyright © 2017 pia. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface InfoViewController : UIViewController <UITabBarDelegate,UITableViewDataSource> {
    UITableView *_infoTable;         //结果表格
    NSArray *_titleArray;            //左侧标题数组
    NSMutableArray *_detail;         //右侧信息数组

}

@property (retain, nonatomic) NSString *_text;//输入的编号

@property (nonatomic, strong) NSString *assetName;           //资产名称
@property (nonatomic, strong) NSString *assetID;             //资产编号
@property (nonatomic, strong) NSString *assetDate;           //购置日期
@property (nonatomic, strong) NSString *assetPlace;          //存放地点
@property (nonatomic, strong) NSString *assetPrice;          //总价
@property (nonatomic, strong) NSString *assetUser;           //使用人
//---
@property (nonatomic, strong) NSString *var7;           //现状
@property (nonatomic, strong) NSString *var8;           //资产状态
@property (nonatomic, strong) NSString *var9;           //生产厂家
@property (nonatomic, strong) NSString *var10;          //出厂编号
@property (nonatomic, strong) NSString *var11;          //型号
@property (nonatomic, strong) NSString *var12;          //规格
@property (nonatomic, strong) NSString *var13;          //使用管理部门

@end
