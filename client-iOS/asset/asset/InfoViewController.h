//
//  InfoViewController.h
//  asset
//
//  Created by Pater Rechards on 2/12/17.
//  Copyright © 2017 sun. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol InfodataSource <NSObject>

@property (strong,nonatomic) NSMutableArray *Info;

@required
- (void)receiveData;
- (void)parseData;

@end

//-------------------------------------------------------

@interface InfoViewController : UIViewController <UITabBarDelegate,UITableViewDataSource> {
    UITableView *_infoTable;//结果表格
    NSArray *_titleArray;//左侧标题数组
    NSArray *_detail;//右侧信息数组
}

@property (retain,nonatomic) NSString *_text;//输入的编号

@end
