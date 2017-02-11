//
//  ViewController.h
//  asset
//
//  Created by sun on 09/02/2017.
//  Copyright © 2017 sun. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UITextFieldDelegate>{
    UITextField *_searchTextbox;
}

@property (retain,nonatomic) UITextField *searchTextbox;

@end

