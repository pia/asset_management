//
//  DataProvider.h
//  asset
//
//  Created by Pater Rechards on 2/12/17.
//  Copyright © 2017 sun. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "InfoViewController.h"

@interface DataProvider : NSObject <InfodataSource>

- (void)downloadDB;//数据库缓存到本地

@end
