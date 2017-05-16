//
//  PITool.h
//  asset
//
//  Created by sure on 16/05/2017.
//  Copyright © 2017 sun. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PITool : NSObject {
    int _orderInt;
    NSString *_orderStr;
}

@property (strong, nonatomic) NSString *orderStr;
@property  int orderInt;

- (void)writeToFile:(NSString *)str;    //资产编号
- (void)getFromFile:(NSString *)order;  //nsdefault中次序

@end
