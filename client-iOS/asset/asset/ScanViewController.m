//
//  ScanViewController.m
//  asset
//
//  Created by pia on 10/04/2017.
//  Copyright © 2017 pia. All rights reserved.
//

#import "ScanViewController.h"
#import "InfoViewController.h"

#define viewHeight self.view.frame.size.height
#define viewWidth self.view.frame.size.width

@interface ScanViewController ()<AVCaptureMetadataOutputObjectsDelegate>
{
    UIImageView *scanLine;
    NSTimer *timer;
}
@end

@implementation ScanViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor=[UIColor whiteColor];
    //执行开始扫描方法
    [self startReading];
    
    //添加扫描框
    UIImageView *scanView = [[UIImageView alloc] init];
    scanView.bounds = CGRectMake(0, 0, viewWidth, viewWidth);
    scanView.center = CGPointMake(viewWidth/2, viewHeight/2);
    scanView.contentMode = UIViewContentModeScaleAspectFit;
    UIImage *scanImage = [UIImage imageNamed:@"scanView.png"];
    scanView.image = scanImage;
    [self.view addSubview:scanView];
    
    //添加移动扫描条
    scanLine = [[UIImageView alloc] initWithFrame:CGRectMake(0, (viewHeight-viewWidth)/2, 2, viewWidth)];
    scanLine.image = [UIImage imageNamed:@"scanLine"];
    [self.view addSubview:scanLine];
    timer = [NSTimer scheduledTimerWithTimeInterval:1.0/50 target:self selector:@selector(scanLineMoving) userInfo:nil                         repeats:YES];
    

}

//开始扫描
- (void)startReading{
//    CGFloat viewWidth = self.view.frame.size.width;
//    CGFloat viewHeight = self.view.frame.size.height;
    
    //获取摄像设备
    AVCaptureDevice *device = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
    //创建输入流
    AVCaptureDeviceInput *input = [AVCaptureDeviceInput deviceInputWithDevice:device error:nil];
    //创建输出流
    AVCaptureMetadataOutput *output = [[AVCaptureMetadataOutput alloc] init];
    //设置扫描感应区域
    [output setRectOfInterest:CGRectMake((viewHeight-viewWidth)/2/viewHeight, 0, viewWidth/viewHeight, 1)];
    //设置代理，在主线程里刷新
    [output setMetadataObjectsDelegate:self queue:dispatch_get_main_queue()];
    //初始化连接对象
    _session = [[AVCaptureSession alloc] init];
    //高质量采集率
    [_session setSessionPreset:AVCaptureSessionPresetHigh];
    //增加输入流
    [_session addInput:input];
    //增加输出流
    [_session addOutput:output];
    //设置扫码支持的编码格式（条形码和二维码）
    output.metadataObjectTypes = @[AVMetadataObjectTypeQRCode,AVMetadataObjectTypeEAN13Code,AVMetadataObjectTypeEAN8Code, AVMetadataObjectTypeCode128Code];
    //设置扫描预览图层
    self.preview = [AVCaptureVideoPreviewLayer layerWithSession:_session];
    //设置扫描图层的属性
    self.preview.videoGravity = AVLayerVideoGravityResizeAspectFill;
    //设置扫描图层的大小
    self.preview.frame = self.view.layer.bounds;
    //将扫描图层添加到主视图的图层上面
    [self.view.layer insertSublayer:self.preview atIndex:0];
    //开始扫描
    [_session startRunning];
}

//移动扫描条
- (void)scanLineMoving{
    if (scanLine.frame.origin.x >= self.view.frame.size.width) scanLine.frame = CGRectMake(0, scanLine.frame.origin.y, scanLine.frame.size.width, scanLine.frame.size.height);
    CGFloat x = scanLine.frame.origin.x;
    scanLine.frame = CGRectMake(x + 5, scanLine.frame.origin.y, scanLine.frame.size.width, scanLine.frame.size.height);
}


//当扫描到条码或二维码，即执行此方法
#pragma mark - AVCaptureMetadataOutputObjectsDelegate method
- (void) captureOutput:(AVCaptureOutput *)captureOutput didOutputMetadataObjects:(NSArray *)metadataObjects fromConnection:(AVCaptureConnection *)connection{
    if (metadataObjects.count>0) {
        //停止扫描
        [_session stopRunning];
        
        AVMetadataMachineReadableCodeObject *metadataObject = [metadataObjects objectAtIndex:0];
        NSLog(@"%@",metadataObject.stringValue);
        
        [self.preview removeFromSuperlayer];
        //重新扫描
        [self startReading];
        
        //切换视图
        InfoViewController *infoView=[[InfoViewController alloc] init];
        infoView._text=metadataObject.stringValue;
        [self.navigationController pushViewController:infoView animated:YES];

    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
//http://vlin2014.blog.163.com/blog/static/23338000120156564033555/
