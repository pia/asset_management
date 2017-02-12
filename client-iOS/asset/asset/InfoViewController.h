//
//  InfoViewController.h
//  asset
//
//  Created by Pater Rechards on 2/12/17.
//  Copyright © 2017 sun. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol InfodataSource <NSObject>

@property (strong,nonatomic) NSMutableDictionary *dicInfo;

@required
- (void)receiveData;
- (void)parseData;

@end

//-------------------------------------------------------

@interface InfoViewController : UIViewController

@property (retain,nonatomic) NSString *_text;

@end
