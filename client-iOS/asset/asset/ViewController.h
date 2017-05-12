//
//  ViewController.h
//  asset
//
//  Created by pia on 09/02/2017.
//  Copyright © 2017 pia. All rights reserved.
//


#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UITextFieldDelegate>{
    UITextField *_searchTextbox;
}

@property (retain,nonatomic) UITextField *searchTextbox;
@property (copy,nonatomic) NSString *assetID;

@end

