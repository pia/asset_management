//
//  DataProvider.m
//  asset
//
//  Created by Pater Rechards on 2/12/17.
//  Copyright © 2017 sun. All rights reserved.
//

#import "DataProvider.h"

@implementation DataProvider

@synthesize dicInfo;

- (void)receiveData {

}

- (void)parseData {
    dicInfo=[[NSMutableDictionary alloc] init];
    [dicInfo setValue:@"计算机" forKey:@"name"];
    [dicInfo setValue:@"1234567890" forKey:@"ID"];
    [dicInfo setValue:@"2016-01-01" forKey:@"date"];
    [dicInfo setValue:@"理工楼C404" forKey:@"place"];
    [dicInfo setValue:@"998" forKey:@"price"];
    [dicInfo setValue:@"张三" forKey:@"user"];
    [dicInfo setValue:@"计算机" forKey:@"name"];
    
}

@end