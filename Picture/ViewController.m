//
//  ViewController.m
//  Picture
//
//  Created by zhoubiwen on 2020/5/6.
//  Copyright © 2020 zhoubiwen. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (nonatomic, strong) UIScrollView *bgScrollV;//背景scrollV

@property (nonatomic, strong) UIImageView *imageV;//背景scrollV

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor orangeColor];
    _bgScrollV = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 200, 375, 375)];
    //        _bgScrollV.bounces = NO;
    _bgScrollV.showsVerticalScrollIndicator = NO;
    _bgScrollV.contentSize = CGSizeMake(375, 850);
    _bgScrollV.layer.cornerRadius = 14;
    _bgScrollV.layer.masksToBounds = YES;
    
    [self.view addSubview:_bgScrollV];
    _imageV = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 375, 710)];
    _imageV.image = [UIImage imageNamed:@"hfjdsfdhjf"];
    [_bgScrollV addSubview:_imageV];
    
    
    
    UILabel * label = [[UILabel alloc] initWithFrame:CGRectMake(0, 710, 375, 140)];
    label.backgroundColor = UIColor.redColor;
    label.text = @"1234444";
    [_bgScrollV addSubview:label];
    
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    UIImage * image = [self getViewimageAtH:850];
    UIImageWriteToSavedPhotosAlbum(image, nil , nil, nil);
    _imageV.image = image;
    
}
#pragma mark - 生成图片
-(UIImage *)getViewimageAtH:(CGFloat)h{
    UIImage* viewImage = nil;
    UIScrollView *scrollView = _bgScrollV;
    UIGraphicsBeginImageContextWithOptions(CGSizeMake(scrollView.contentSize.width, h), NO, [UIScreen mainScreen].scale);
    {
        CGPoint savedContentOffset = scrollView.contentOffset;
        CGRect savedFrame = scrollView.frame;
        scrollView.contentOffset = CGPointZero;
        scrollView.frame = CGRectMake(0, 0, scrollView.contentSize.width, h);
        scrollView.contentOffset = CGPointZero;
        CGContextRef ctx = UIGraphicsGetCurrentContext();
        [scrollView.layer renderInContext:ctx];
        viewImage = UIGraphicsGetImageFromCurrentImageContext();
        scrollView.contentOffset = savedContentOffset;
        scrollView.frame = savedFrame;
    }
    UIGraphicsEndImageContext();
    if (viewImage != nil) {
        return viewImage;
    }
    return nil;
    
}
@end
