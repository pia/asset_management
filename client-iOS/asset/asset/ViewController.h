//
//  ViewController.h
//  asset
//
//  Created by pia on 09/02/2017.
//  Copyright © 2017 pia. All rights reserved.
//

#define searchTextbox_x 33
#define searchTextbox_y (self.view.bounds.size.height-75)/2
#define searchTextbox_width self.view.bounds.size.width-66
#define searchTextbox_height 50

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UITextFieldDelegate>{
    UITextField *_searchTextbox;
}

@property (retain,nonatomic) UITextField *searchTextbox;
@property (copy,nonatomic) NSString *assetID;

@end

