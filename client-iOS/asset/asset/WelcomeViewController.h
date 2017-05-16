//
//  WelcomeViewController.h
//  asset
//
//  Created by sure on 16/05/2017.
//  Copyright © 2017 sun. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WelcomeViewController : UIViewController<UITextFieldDelegate>{
    UITextField *_passwordInput;
    UITextField *_usrInput;
}

@property (retain,nonatomic) UITextField *passwordInput;
@property (retain,nonatomic) UITextField *usrInput;

@end
