//
//  PITool.m
//  asset
//
//  Created by sure on 16/05/2017.
//  Copyright © 2017 sun. All rights reserved.
//

#import "PITool.h"

@implementation PITool

@synthesize orderInt = _orderInt;
@synthesize orderStr = _orderStr;

- (void)writeToFile:(NSString *)str {
    NSLog(@"write to file! %@ ===",str);
    
    //获取次序
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    _orderStr = [defaults stringForKey:@"5"];
    
    //写文件
    [defaults setObject:str forKey:_orderStr];
    [defaults synchronize];
    
    //更新次序
    _orderInt = ([_orderStr intValue] + 1)%5;
    _orderStr = [[NSString alloc] initWithFormat:@"%d",_orderInt];
    [defaults setObject:_orderStr forKey:@"5"];
}

- (NSString *)getFromFile {
    //获取次序
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    _orderStr = [defaults stringForKey:@"5"];
    
    //读文件
    NSString *result = [[NSString alloc] init];
    result = [defaults stringForKey:_orderStr];
    
    //更新次序
    _orderInt = ([_orderStr intValue] + 1)%5;
    _orderStr = [[NSString alloc] initWithFormat:@"%d",_orderInt];
    [defaults setObject:_orderStr forKey:@"5"];
    
    return result;
}

- (void)copyToPasteboard:(NSString *)text {
    UIPasteboard *pasteboard = [UIPasteboard generalPasteboard];
    [pasteboard setString:text];
}

@end
