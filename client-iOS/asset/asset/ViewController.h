//
//  ViewController.h
//  asset
//
//  Created by pia on 09/02/2017.
//  Copyright © 2017 pia. All rights reserved.
//


#import <UIKit/UIKit.h>
#import <FlatUIKit.h>

@interface ViewController : UIViewController<UITextFieldDelegate>{
    FUITextField *_searchTextbox;
}

@property (retain,nonatomic) FUITextField *searchTextbox;
@property (copy,nonatomic) NSString *assetID;

@end

