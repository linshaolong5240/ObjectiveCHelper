//
//  QRCodeScanerViewController.m
//  ObjectiveCHelper
//
//  Created by Sauron on 2023/1/3.
//  Copyright © 2023 com.sauronpi. All rights reserved.
//

#import "QRCodeScanerViewController.h"
#import <ReactiveObjC/ReactiveObjC.h>
#import <AVFoundation/AVFoundation.h>
#import <Photos/Photos.h>
#import "QRCodeHelper.h"

@interface QRCodeScanerViewController () <AVCaptureMetadataOutputObjectsDelegate, UINavigationControllerDelegate, UIImagePickerControllerDelegate>

@property(nonatomic, assign) BOOL tempNavigationBarHidden;

@property(nonatomic, assign) AVAuthorizationStatus authorizationStatus;

@property(nonatomic, strong) AVCaptureSession *captureSession;

@property(nonatomic, strong) AVCaptureVideoPreviewLayer *previewLayer;

@property(nonatomic, strong) UIButton *flashlightButton;

@end

@implementation QRCodeScanerViewController

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        _tempNavigationBarHidden = NO;
        _authorizationStatus = AVAuthorizationStatusNotDetermined;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = UIColor.blackColor;
    [self configureView];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.tempNavigationBarHidden = self.navigationController.isNavigationBarHidden;
    [self.navigationController setNavigationBarHidden:YES];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [self.navigationController setNavigationBarHidden:self.tempNavigationBarHidden];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [self checkAuthorizationStatus];
    [self startCapture];
}

- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
    [self stopCapture];
}
- (void)configureView {
    UIButton *backButton = [UIButton buttonWithType:(UIButtonTypeCustom)];
    [backButton setImage:[UIImage systemImageNamed:@"chevron.left"] forState:(UIControlStateNormal)];
    [backButton addTarget:self action:@selector(backButtonOnClicked:event:) forControlEvents:(UIControlEventTouchUpInside)];
    [self.view addSubview:backButton];
    [backButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.mas_topLayoutGuideBottom);
            make.left.equalTo(self.view).inset(20);
    }];
    
    UIButton *flashlightButton = [UIButton buttonWithType:(UIButtonTypeCustom)];
    [flashlightButton setImage:[UIImage systemImageNamed:@"flashlight.off.fill"] forState:(UIControlStateNormal)];
    [flashlightButton setImage:[UIImage systemImageNamed:@"flashlight.on.fill"] forState:(UIControlStateSelected)];
    [flashlightButton addTarget:self action:@selector(flashlightButtonOnClicked:event:) forControlEvents:(UIControlEventTouchUpInside)];
    [self.view addSubview:flashlightButton];
    [flashlightButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.mas_bottomLayoutGuideTop).inset(30);
        make.left.equalTo(self.view).inset(56);
    }];
    self.flashlightButton = flashlightButton;
    
    
    UIButton *albumButton = [UIButton buttonWithType:(UIButtonTypeCustom)];
    [albumButton setImage:[UIImage systemImageNamed:@"photo"] forState:(UIControlStateNormal)];
    [albumButton addTarget:self action:@selector(albumButtonOnClicked:event:) forControlEvents:(UIControlEventTouchUpInside)];
    [self.view addSubview:albumButton];
    [albumButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(flashlightButton);
        make.right.equalTo(self.view).inset(56);
    }];
}

- (void)configureCapture {
    if (self.captureSession) {
        return;
    }
    
    AVCaptureSession *captureSession = [AVCaptureSession new];
    
    AVCaptureDevice *videoCaptureDevice = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
    if (!videoCaptureDevice) {
        [self showFailedAlert];
        return;
    }
    
    NSError *error = nil;
    AVCaptureDeviceInput *videoInput = [AVCaptureDeviceInput deviceInputWithDevice:videoCaptureDevice error:&error];
    if (error) {
        [SVProgressHUD showErrorWithStatus:error.description];
        return;
    }
    
    if ([captureSession canAddInput:videoInput]) {
        [captureSession addInput:videoInput];
    } else {
        [self showFailedAlert];
    }
    
    AVCaptureMetadataOutput *metadataOutput = [AVCaptureMetadataOutput new];
    if ([captureSession canAddOutput:metadataOutput]) {
        [captureSession addOutput:metadataOutput];
        [metadataOutput setMetadataObjectsDelegate:self queue:dispatch_get_main_queue()];
        metadataOutput.metadataObjectTypes = @[AVMetadataObjectTypeQRCode];
    } else {
        [self showFailedAlert];
        return;
    }
    AVCaptureVideoPreviewLayer *previewLayer = [AVCaptureVideoPreviewLayer layerWithSession:captureSession];
    previewLayer.frame = self.view.bounds;
    previewLayer.videoGravity = AVLayerVideoGravityResizeAspectFill;
    [self.view.layer insertSublayer:previewLayer atIndex:0];
    
    self.captureSession = captureSession;
    self.previewLayer = previewLayer;
    [self startCapture];
}

- (void)startCapture {
    if (self.captureSession && self.captureSession.isRunning == NO) {
        @weakify(self)
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
            @strongify(self)
            [self.captureSession startRunning];
        });
    }
}

- (void)stopCapture {
    if (self.captureSession && self.captureSession.isRunning == YES) {
        [self.captureSession stopRunning];
    }
}

- (void)checkAuthorizationStatus {
    self.authorizationStatus = [AVCaptureDevice authorizationStatusForMediaType:AVMediaTypeVideo];
    switch (self.authorizationStatus) {
    case AVAuthorizationStatusNotDetermined:
            [self requestAcess];
            break;
        case AVAuthorizationStatusRestricted:
        case AVAuthorizationStatusDenied:
            [self showPermissonAlert];
            break;
        case AVAuthorizationStatusAuthorized:
            [self configureCapture];
            break;
    }
}

- (void)requestAcess {
    @weakify(self)
    [AVCaptureDevice requestAccessForMediaType:AVMediaTypeVideo completionHandler:^(BOOL granted) {
        @strongify(self)
        @weakify(self)
        dispatch_sync(dispatch_get_main_queue(), ^{
            @strongify(self)
            [self requestAcessDone:granted];
        });
    }];
}

- (void)requestAcessDone:(BOOL)status {
    [self checkAuthorizationStatus];
}

- (void)backButtonOnClicked:(UIButton *)sender event:(UIControlEvents)event {
    if (self.navigationController) {
        [self.navigationController popViewControllerAnimated:YES];
    } else {
        [self dismissViewControllerAnimated:YES completion:nil];
    }
}

- (void)flashlightButtonOnClicked:(UIButton *)sender event:(UIControlEvents)event {
    AVCaptureDevice *device = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
    if (!device) {
        sender.enabled = NO;
        return;
    }
    
    BOOL lightOn = device.torchMode == AVCaptureTorchModeOn;
    NSError *error = nil;
    [device lockForConfiguration:&error];
    if (error) {
        return;
    }
    device.torchMode = lightOn ? AVCaptureTorchModeOff : AVCaptureTorchModeOn;
    sender.selected = lightOn ? NO : YES;
    [device unlockForConfiguration];
}

- (void)albumButtonOnClicked:(UIButton *)sender event:(UIControlEvents)event {
    PHAuthorizationStatus status = [PHPhotoLibrary authorizationStatus];
    if (status == PHAuthorizationStatusDenied || status == PHAuthorizationStatusRestricted) {
        [self showPermissonAlert];
        return;
    }
    
    UIImagePickerController *vc = [UIImagePickerController new];
    vc.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    vc.delegate = self;
    
    [self presentViewController:vc animated:YES completion:nil];
}

- (void)showPermissonAlert {
    UIAlertController *ac = [UIAlertController alertControllerWithTitle:@"Need permisson" message:@"Go to setting." preferredStyle:(UIAlertControllerStyleAlert)];
    [ac addAction:[UIAlertAction actionWithTitle:@"Cancell" style:(UIAlertActionStyleCancel) handler:nil]];
    [ac addAction:[UIAlertAction actionWithTitle:@"Go" style:(UIAlertActionStyleDefault) handler:^(UIAlertAction * _Nonnull action) {
        
        NSURL *url = [NSURL URLWithString:UIApplicationOpenSettingsURLString];
        if (url) {
            [UIApplication.sharedApplication openURL:url options:@{} completionHandler:nil];
        }
    }]];
    [self presentViewController:ac animated:YES completion:nil];
    self.captureSession = nil;
}

- (void)showFailedAlert {
    UIAlertController *ac = [UIAlertController alertControllerWithTitle:@"Scanning not supported" message:@"Your device does not support scanning a code from an item. Please use a device with a camera." preferredStyle:(UIAlertControllerStyleAlert)];
    [ac addAction:[UIAlertAction actionWithTitle:@"OK" style:(UIAlertActionStyleDefault) handler:nil]];
    
    [self presentViewController:ac animated:YES completion:nil];
    self.captureSession = nil;
}

// MARK: - AVCaptureMetadataOutputObjectsDelegate

- (void)captureOutput:(AVCaptureOutput *)output didOutputMetadataObjects:(NSArray<__kindof AVMetadataObject *> *)metadataObjects fromConnection:(AVCaptureConnection *)connection {
    AVMetadataObject *metadataObject = metadataObjects.firstObject;
    if (!metadataObject) {
        return;
    }
    AVMetadataMachineReadableCodeObject *readableObject = (AVMetadataMachineReadableCodeObject *)metadataObject;
    if (!readableObject) {
        return;
    }
    
    NSString *message = readableObject.stringValue;
    if (!message) {
        return;
    }
#if DEBUG
    NSLog(@"found message: %@", message);
#endif
#if DEBUG
        [SVProgressHUD showSuccessWithStatus:message];
#endif
    if (self.delegate && [self.delegate respondsToSelector:@selector(qrcodeScanerViewController:didDetect:)]) {
        [self.delegate qrcodeScanerViewController:self didDetect:message];
    }
}

// MARK: - UINavigationControllerDelegate

// MARK: - UIImagePickerControllerDelegate

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<UIImagePickerControllerInfoKey,id> *)info {
    UIImage *image = info[UIImagePickerControllerOriginalImage];
    if (!image) {
        return;
    }
    if (!image.CGImage) {
        return;
    }
    NSString *message = [QRCodeHelper detectQRCodeWithCGImage:image.CGImage accuracy:(QRCodeDetectorAccuracyLow)];
    if (!message) {
        [SVProgressHUD showInfoWithStatus:@"Not found"];
        return;
    }
#if DEBUG
    NSLog(@"found message: %@", message);
#endif
#if DEBUG
        [SVProgressHUD showSuccessWithStatus:message];
#endif
    if (self.delegate && [self.delegate respondsToSelector:@selector(qrcodeScanerViewController:didDetect:)]) {
        [self.delegate qrcodeScanerViewController:self didDetect:message];
    }
    
    [picker dismissViewControllerAnimated:YES completion:nil];
}

@end
