//
//  ScanViewController.h
//  asset
//
//  Created by pia on 10/04/2017.
//  Copyright © 2017 pia. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>


@interface ScanViewController : UIViewController

@property (retain, nonatomic) AVCaptureSession *session;
@property (retain, nonatomic) AVCaptureVideoPreviewLayer *preview;

@end
