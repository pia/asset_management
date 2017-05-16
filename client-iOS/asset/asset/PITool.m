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
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    _orderStr = [[NSString alloc] initWithFormat:@"%d",1];
    int a = [_orderStr intValue];
    _orderStr = [[NSString alloc] initWithFormat:@"%d",a];
    [defaults setObject:str forKey:_orderStr];
    [defaults synchronize];
    
    
}

- (void)getFromFile:(NSString *)str {
    NSString *rec;
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    rec = [defaults stringForKey:str];
    NSLog(@"daddy is here: %@",rec);
}

@end
