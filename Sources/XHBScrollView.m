//
//  XHBScrollView.m
//  HBDemo
//
//  Created by 小米 on 2018/10/13.
//  Copyright © 2018年 小米. All rights reserved.
//

#import "XHBScrollView.h"
#import "PageInfoModel.h"
#import "UIButton+YYWebImage.h"
#import "TVMHomeEvent.h"
#define Width [UIScreen mainScreen].bounds.size.width

#define random(r, g, b, a) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1]
#define randomColor random(arc4random_uniform(256), arc4random_uniform(256), arc4random_uniform(256), arc4random_uniform(256))

@interface XHBScrollView ()

@property (nonatomic, strong) UIImageView *viewTag1;
@property (nonatomic, strong) UIImageView *viewTag2;
@property (nonatomic, strong) UIImageView *viewTag3;
@property (nonatomic, strong) UIImageView *viewTag4;
@property (nonatomic, strong) UIImageView *viewTag5;
@property (nonatomic, strong) UIImageView *viewTag6;
@property (nonatomic, strong) UIImageView *viewTag7;


@property (nonatomic, strong) UIButton *openBtn1;
@property (nonatomic, strong) UIButton *openBtn2;
@property (nonatomic, strong) UIButton *openBtn3;
@property (nonatomic, strong) UIButton *openBtn4;
@property (nonatomic, strong) UIButton *openBtn5;
@property (nonatomic, strong) UIButton *openBtn6;
@property (nonatomic, strong) UIButton *openBtn7;

/**
 *  定时器
 */
@property (strong, nonatomic) CADisplayLink *timer;


@end

@implementation XHBScrollView

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        
        [self setUI];
    }
    return self;
}

- (void)setUI{
    
    
    
    
    _viewTag1 = [[UIImageView alloc] initWithFrame:CGRectMake(-400, ((Width*0.7)*3/2-(Width*0.2)*3/2)/2, Width*0.2, (Width*0.2)*3/2)];
    _viewTag1.alpha = 0;
    _viewTag1.tag = 1;
//    _viewTag1.layer.transform = CATransform3DMakeScale(0.4,0.4,1.0);
    _viewTag1.image = [UIImage imageNamed:@"RedPacket_BG"];
    _openBtn1 = [[UIButton alloc] initWithFrame:CGRectMake(Width*0.1-Width*0.2/6, (Width*0.2)/2, Width*0.2/3, Width*0.2/3)];
    _openBtn1.hidden = YES;
     [_openBtn1 setBackgroundImage:[UIImage imageNamed:@"Open_Btn"] forState:UIControlStateNormal];
    [_openBtn1 addTarget:self action:@selector(tap) forControlEvents:UIControlEventTouchUpInside];
    [_viewTag1 addSubview:_openBtn1];
    
    
    _viewTag2 = [[UIImageView alloc] initWithFrame:CGRectMake(-35, ((Width*0.8)*36/29-(Width*0.5)*36/29)/2, Width*0.5, (Width*0.5)*36/29)];
    _viewTag2.alpha = 0.5;
    _viewTag2.tag = 2;
//    _viewTag2.layer.transform = CATransform3DMakeScale(0.6,0.6,1.0);
    _viewTag2.image = [UIImage imageNamed:@"RedPacket_BG"];
    _openBtn2 = [[UIButton alloc] initWithFrame:CGRectMake(Width*0.2-Width*0.4/5, (Width*0.4)/2, Width*0.4/2.5, Width*0.4/2.5)];
    _openBtn2.hidden = YES;
     [_openBtn2 setBackgroundImage:[UIImage imageNamed:@"Open_Btn"] forState:UIControlStateNormal];
    [_openBtn2 addTarget:self action:@selector(tap) forControlEvents:UIControlEventTouchUpInside];
    [_viewTag2 addSubview:_openBtn2];
    
    
    _viewTag3 = [[UIImageView alloc] initWithFrame:CGRectMake(-15, ((Width*0.8)*36/29-(Width*0.65)*36/29)/2, Width*0.65, (Width*0.65)*36/29)];
    _viewTag3.alpha = 1;
    _viewTag3.tag = 3;
//    _viewTag3.layer.transform = CATransform3DMakeScale(0.8,0.8,1.0);
    _viewTag3.image = [UIImage imageNamed:@"RedPacket_BG"];
    _openBtn3 = [[UIButton alloc] initWithFrame:CGRectMake(Width*0.32-Width*0.65/5, (Width*0.65)/2.6, Width*0.65/2.5, Width*0.65/2.5)];
    _openBtn3.hidden = NO;
     [_openBtn3 setBackgroundImage:[UIImage imageNamed:@"Open_Btn"] forState:UIControlStateNormal];
    [_openBtn3 addTarget:self action:@selector(tap) forControlEvents:UIControlEventTouchUpInside];
    [_viewTag3 addSubview:_openBtn3];
    
    _viewTag4 = [[UIImageView alloc] initWithFrame:CGRectMake(Width/2-Width*0.4, 0, Width*0.8, (Width*0.8)*36/29)];
    _viewTag4.alpha = 1;
    _viewTag4.tag = 4;
//    _viewTag4.layer.transform = CATransform3DMakeScale(1.0,1.0,1.0);
    _viewTag4.image = [UIImage imageNamed:@"RedPacket_BG"];
    _openBtn4 = [[UIButton alloc] initWithFrame:CGRectMake(Width*0.4-Width*0.8/5, (Width*0.8)/2.6, Width*0.8/2.5, Width*0.8/2.5)];
    _openBtn4.hidden = NO;
     [_openBtn4 setBackgroundImage:[UIImage imageNamed:@"Open_Btn"] forState:UIControlStateNormal];
    [_openBtn4 addTarget:self action:@selector(tap) forControlEvents:UIControlEventTouchUpInside];
    [_viewTag4 addSubview:_openBtn4];
    
    
    _viewTag5 = [[UIImageView alloc] initWithFrame:CGRectMake(Width-Width*0.65+15, ((Width*0.8)*36/29-(Width*0.65)*36/29)/2, Width*0.65, (Width*0.65)*36/29)];
    _viewTag5.alpha = 1;
    _viewTag5.tag = 5;
//    _viewTag5.layer.transform = CATransform3DMakeScale(0.8,0.8,1.0);
    _viewTag5.image = [UIImage imageNamed:@"RedPacket_BG"];
    _openBtn5 = [[UIButton alloc] initWithFrame:CGRectMake(Width*0.33-Width*0.65/5, (Width*0.65)/2.6, Width*0.65/2.5, Width*0.65/2.5)];
    _openBtn5.hidden = NO;
     [_openBtn5 setBackgroundImage:[UIImage imageNamed:@"Open_Btn"] forState:UIControlStateNormal];
    [_openBtn5 addTarget:self action:@selector(tap) forControlEvents:UIControlEventTouchUpInside];
    [_viewTag5 addSubview:_openBtn5];
    
    
    _viewTag6 = [[UIImageView alloc] initWithFrame:CGRectMake(Width*0.5+35, ((Width*0.8)*36/29-(Width*0.5)*36/29)/2, Width*0.5, (Width*0.5)*36/29)];
    _viewTag6.alpha = 0.5;
    _viewTag6.tag = 6;
//    _viewTag6.layer.transform = CATransform3DMakeScale(0.6,0.6,1.0);
    _viewTag6.image = [UIImage imageNamed:@"RedPacket_BG"];
    _openBtn6 = [[UIButton alloc] initWithFrame:CGRectMake(Width*0.2-Width*0.4/5, (Width*0.4)/2, Width*0.4/2.5, Width*0.4/2.5)];
    _openBtn6.hidden = YES;
    [_openBtn6 setBackgroundImage:[UIImage imageNamed:@"Open_Btn"] forState:UIControlStateNormal];
    [_openBtn6 addTarget:self action:@selector(tap) forControlEvents:UIControlEventTouchUpInside];
    [_viewTag6 addSubview:_openBtn6];
    
    
    _viewTag7 = [[UIImageView alloc] initWithFrame:CGRectMake(Width+400, ((Width*0.7)*3/2-(Width*0.2)*3/2)/2, Width*0.2, (Width*0.2)*3/2)];
    _viewTag7.alpha = 0;
    _viewTag7.tag = 7;
//    _viewTag7.layer.transform = CATransform3DMakeScale(0.4,0.4,1.0);
    _viewTag7.image = [UIImage imageNamed:@"RedPacket_BG"];
    _openBtn7 = [[UIButton alloc] initWithFrame:CGRectMake(Width*0.1-Width*0.2/6, (Width*0.2)/2, Width*0.2/3, Width*0.2/3)];
    _openBtn7.hidden = YES;
    [_openBtn7 setBackgroundImage:[UIImage imageNamed:@"Open_Btn"] forState:UIControlStateNormal];
    [_openBtn7 addTarget:self action:@selector(tap) forControlEvents:UIControlEventTouchUpInside];
    [_viewTag7 addSubview:_openBtn7];
    
    [self addSubview:_viewTag1];
    [self addSubview:_viewTag7];
    [self addSubview:_viewTag6];
    [self addSubview:_viewTag2];
    [self addSubview:_viewTag3];
    [self addSubview:_viewTag5];
    [self addSubview:_viewTag4];
    
    [self bringSubviewToFront:_viewTag4];
    [self sendSubviewToBack:_viewTag7];
    UISwipeGestureRecognizer *left = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(handleSwipes:)];
    left.direction=UISwipeGestureRecognizerDirectionLeft;
    [self addGestureRecognizer:left];
    
    UISwipeGestureRecognizer *right = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(handleSwipes:)];
    right.direction=UISwipeGestureRecognizerDirectionRight;
    [self addGestureRecognizer:right];
    
    _viewTag1.userInteractionEnabled = YES;
    _viewTag2.userInteractionEnabled = YES;
    _viewTag3.userInteractionEnabled = YES;
    _viewTag4.userInteractionEnabled = YES;
    _viewTag5.userInteractionEnabled = YES;
    _viewTag6.userInteractionEnabled = YES;
    _viewTag7.userInteractionEnabled = YES;
    
    
}



-(void)handleSwipes:(UISwipeGestureRecognizer *)recognizer
{
    if ([self.status isEqualToString:@"stop"]) {
        return;
    }
    if(recognizer.direction==UISwipeGestureRecognizerDirectionLeft){
        NSLog(@"向左边滑动了!!!!!!");
        [self autoLeftPage];
    }
    if (recognizer.direction == UISwipeGestureRecognizerDirectionRight) {
        NSLog(@"向右边滑动了!!!!!!");
        [self autoRightPage];
    }
    if (recognizer.direction == UISwipeGestureRecognizerDirectionUp) {
        NSLog(@"向上边滑动了!!!!!!");
    }
    if (recognizer.direction == UISwipeGestureRecognizerDirectionDown) {
        NSLog(@"向下边滑动了!!!!!!");
    }
    
}

- (void)autoPage{
    if ([self.status isEqualToString:@"stop"]) {
        return;
    }
    NSDate *now = [NSDate date];
    NSTimeInterval interval = [now timeIntervalSinceDate:self.RefreshDate];
    if (interval < 3.f ) return;
    self.RefreshDate = now;
    [UIView animateWithDuration:0.5 animations:^{
        self.viewTag1.frame = CGRectMake(-35, ((Width*0.8)*36/29-(Width*0.5)*36/29)/2, Width*0.5, (Width*0.5)*36/29);
//        self.viewTag1.layer.transform = CATransform3DMakeScale(0.6,0.6,1.0);
        self.viewTag1.alpha = 0.5;
        self.viewTag1.tag  = 2;
        self.openBtn1.frame = CGRectMake(Width*0.2-Width*0.4/5, (Width*0.4)/2, Width*0.4/2.5, Width*0.4/2.5);
        self.openBtn1.hidden = YES;
        
        self.viewTag2.frame = CGRectMake(-15, ((Width*0.8)*36/29-(Width*0.65)*36/29)/2, Width*0.65, (Width*0.65)*36/29);
//        self.viewTag2.layer.transform = CATransform3DMakeScale(0.8,0.8,1.0);
        self.viewTag2.alpha = 1;
        self.viewTag2.tag = 3;
        self.openBtn2.frame = CGRectMake(Width*0.32-Width*0.65/5, (Width*0.65)/2.6, Width*0.65/2.5, Width*0.65/2.5);
        self.openBtn2.hidden = NO;
        
        self.viewTag3.frame = CGRectMake(Width/2-Width*0.4, 0, Width*0.8, (Width*0.8)*36/29);
//        self.viewTag3.layer.transform = CATransform3DMakeScale(1.0,1.0,1.0);
        self.viewTag3.alpha = 1;
        self.viewTag3.tag = 4;
        self.openBtn3.frame = CGRectMake(Width*0.4-Width*0.8/5, (Width*0.8)/2.6, Width*0.8/2.5, Width*0.8/2.5);
        self.openBtn3.hidden = NO;
        [self bringSubviewToFront:self.viewTag3];
        
        
        self.viewTag4.frame = CGRectMake(Width-Width*0.65+15, ((Width*0.8)*36/29-(Width*0.65)*36/29)/2, Width*0.65, (Width*0.65)*36/29);
//        self.viewTag4.layer.transform = CATransform3DMakeScale(0.8,0.8,1.0);
        self.viewTag4.alpha = 1;
        self.viewTag4.tag = 5;
        self.openBtn4.frame = CGRectMake(Width*0.33-Width*0.65/5, (Width*0.65)/2.6, Width*0.65/2.5, Width*0.65/2.5);
        self.openBtn4.hidden = NO;
        
        self.viewTag5.frame = CGRectMake(Width*0.5+35, ((Width*0.8)*36/29-(Width*0.5)*36/29)/2, Width*0.5, (Width*0.5)*36/29);
//        self.viewTag5.layer.transform = CATransform3DMakeScale(0.6,0.6,1.0);
        self.viewTag5.alpha = 0.5;
        self.viewTag5.tag = 6;
        self.openBtn5.frame = CGRectMake(Width*0.2-Width*0.4/5, (Width*0.4)/2, Width*0.4/2.5, Width*0.4/2.5);
        self.openBtn5.hidden = YES;
        
        self.viewTag6.frame = CGRectMake(Width+400, ((Width*0.7)*3/2-(Width*0.2)*3/2)/2, Width*0.2, (Width*0.2)*3/2);
//        self.viewTag6.layer.transform = CATransform3DMakeScale(0.4,0.4,1.0);
        self.viewTag6.alpha = 0;
        self.viewTag6.tag = 7;
        self.openBtn6.frame = CGRectMake(Width*0.1-Width*0.2/6, (Width*0.2)/2, Width*0.2/3, Width*0.2/3);
        self.openBtn6.hidden = YES;
        [self sendSubviewToBack:self.viewTag6];
        
        self.viewTag7.frame = CGRectMake(-400, ((Width*0.7)*3/2-(Width*0.2)*3/2)/2, Width*0.2, (Width*0.2)*3/2);
//        self.viewTag7.layer.transform = CATransform3DMakeScale(0.4,0.4,1.0);
        self.viewTag7.alpha = 0;
        self.viewTag7.tag = 1;
        self.openBtn7.frame = CGRectMake(Width*0.1-Width*0.2/6, (Width*0.2)/2, Width*0.2/3, Width*0.2/3);
        self.openBtn7.hidden = YES;
        [self sendSubviewToBack:self.viewTag7];
        
    } completion:^(BOOL finished) {
        for (UIImageView *subView in self.subviews) {
            switch (subView.tag) {
                case 1:
                    self.viewTag1 = subView;
                    self.openBtn1 = subView.subviews[0];
                    break;
                case 2:
                    self.viewTag2 = subView;
                    self.openBtn2 = subView.subviews[0];
                    break;
                case 3:
                    self.viewTag3 = subView;
                    self.openBtn3 = subView.subviews[0];
                    break;
                case 4:
                    self.viewTag4 = subView;
                    self.openBtn4 = subView.subviews[0];
                    break;
                case 5:
                    self.viewTag5 = subView;
                    self.openBtn5 = subView.subviews[0];
                    break;
                case 6:
                    self.viewTag6 = subView;
                    self.openBtn6 = subView.subviews[0];
                    break;
                case 7:
                    self.viewTag7 = subView;
                    self.openBtn7 = subView.subviews[0];
                    break;
                    
                default:
                    break;
            }
        }

        
    }];
    
}

- (void)autoRightPage{
        NSDate *now = [NSDate date];
        self.RefreshDate = now;
        [UIView animateWithDuration:0.5 animations:^{
        self.viewTag1.frame = CGRectMake(-35, ((Width*0.8)*36/29-(Width*0.5)*36/29)/2, Width*0.5, (Width*0.5)*36/29);
        //        self.viewTag1.layer.transform = CATransform3DMakeScale(0.6,0.6,1.0);
        self.viewTag1.alpha = 0.5;
        self.viewTag1.tag  = 2;
        self.openBtn1.frame = CGRectMake(Width*0.2-Width*0.4/5, (Width*0.4)/2, Width*0.4/2.5, Width*0.4/2.5);
        self.openBtn1.hidden = YES;
            
        self.viewTag2.frame = CGRectMake(-15, ((Width*0.8)*36/29-(Width*0.65)*36/29)/2, Width*0.65, (Width*0.65)*36/29);
        //        self.viewTag2.layer.transform = CATransform3DMakeScale(0.8,0.8,1.0);
        self.viewTag2.alpha = 1;
        self.viewTag2.tag = 3;
        self.openBtn2.frame = CGRectMake(Width*0.32-Width*0.65/5, (Width*0.65)/2.6, Width*0.65/2.5, Width*0.65/2.5);
        self.openBtn2.hidden = NO;
            
        self.viewTag3.frame = CGRectMake(Width/2-Width*0.4, 0, Width*0.8, (Width*0.8)*36/29);
        //        self.viewTag3.layer.transform = CATransform3DMakeScale(1.0,1.0,1.0);
        self.viewTag3.alpha = 1;
        self.viewTag3.tag = 4;
        self.openBtn3.frame = CGRectMake(Width*0.4-Width*0.8/5, (Width*0.8)/2.6, Width*0.8/2.5, Width*0.8/2.5);
        [self bringSubviewToFront:self.viewTag3];
        self.openBtn3.hidden = NO;
        
        self.viewTag4.frame = CGRectMake(Width-Width*0.65+15, ((Width*0.8)*36/29-(Width*0.65)*36/29)/2, Width*0.65, (Width*0.65)*36/29);
        //        self.viewTag4.layer.transform = CATransform3DMakeScale(0.8,0.8,1.0);
        self.viewTag4.alpha = 1;
        self.viewTag4.tag = 5;
        self.openBtn4.frame = CGRectMake(Width*0.33-Width*0.65/5, (Width*0.65)/2.6, Width*0.65/2.5, Width*0.65/2.5);
        self.openBtn4.hidden = NO;
            
        self.viewTag5.frame = CGRectMake(Width*0.5+35, ((Width*0.8)*36/29-(Width*0.5)*36/29)/2, Width*0.5, (Width*0.5)*36/29);
        //        self.viewTag5.layer.transform = CATransform3DMakeScale(0.6,0.6,1.0);
        self.viewTag5.alpha = 0.5;
        self.viewTag5.tag = 6;
        self.openBtn5.frame = CGRectMake(Width*0.2-Width*0.4/5, (Width*0.4)/2, Width*0.4/2.5, Width*0.4/2.5);
        self.openBtn5.hidden = YES;
        
        self.viewTag6.frame = CGRectMake(Width+400, ((Width*0.7)*3/2-(Width*0.2)*3/2)/2, Width*0.2, (Width*0.2)*3/2);
        //        self.viewTag6.layer.transform = CATransform3DMakeScale(0.4,0.4,1.0);
        self.viewTag6.alpha = 0;
        self.viewTag6.tag = 7;
        self.openBtn6.frame = CGRectMake(Width*0.1-Width*0.2/6, (Width*0.2)/2, Width*0.2/3, Width*0.2/3);
        [self sendSubviewToBack:self.viewTag6];
        self.openBtn6.hidden = YES;
            
        self.viewTag7.frame = CGRectMake(-400, ((Width*0.7)*3/2-(Width*0.2)*3/2)/2, Width*0.2, (Width*0.2)*3/2);
        //        self.viewTag7.layer.transform = CATransform3DMakeScale(0.4,0.4,1.0);
        self.viewTag7.alpha = 0;
        self.viewTag7.tag = 1;
        self.openBtn7.frame = CGRectMake(Width*0.1-Width*0.2/6, (Width*0.2)/2, Width*0.2/3, Width*0.2/3);
        [self sendSubviewToBack:self.viewTag7];
        self.openBtn7.hidden = YES;
    } completion:^(BOOL finished) {
        for (UIImageView *subView in self.subviews) {
            switch (subView.tag) {
                case 1:
                    self.viewTag1 = subView;
                    self.openBtn1 = subView.subviews[0];
                    break;
                case 2:
                    self.viewTag2 = subView;
                    self.openBtn2 = subView.subviews[0];
                    break;
                case 3:
                    self.viewTag3 = subView;
                    self.openBtn3 = subView.subviews[0];
                    break;
                case 4:
                    self.viewTag4 = subView;
                    self.openBtn4 = subView.subviews[0];
                    break;
                case 5:
                    self.viewTag5 = subView;
                    self.openBtn5 = subView.subviews[0];
                    break;
                case 6:
                    self.viewTag6 = subView;
                    self.openBtn6 = subView.subviews[0];
                    break;
                case 7:
                    self.viewTag7 = subView;
                    self.openBtn7 = subView.subviews[0];
                    break;
                    
                default:
                    break;
            }
        }

        
    
        
    }];
    
}

- (void)autoLeftPage{
    NSDate *now = [NSDate date];
    self.RefreshDate = now;
    [UIView animateWithDuration:0.5 animations:^{
        self.viewTag1.frame = CGRectMake(Width+400, ((Width*0.7)*3/2-(Width*0.2)*3/2)/2, Width*0.2, (Width*0.2)*3/2);
//        self.viewTag1.layer.transform = CATransform3DMakeScale(0.4,0.4,1.0);
        self.viewTag1.alpha = 0;
        self.viewTag1.tag  = 7;
        self.openBtn1.frame = CGRectMake(Width*0.1-Width*0.2/6, (Width*0.2)/2, Width*0.2/3, Width*0.2/3);
        [self sendSubviewToBack:self.viewTag1];
        self.openBtn1.hidden = YES;
        
        self.viewTag2.frame = CGRectMake(-400, ((Width*0.7)*3/2-(Width*0.2)*3/2)/2, Width*0.2, (Width*0.2)*3/2);
//        self.viewTag2.layer.transform = CATransform3DMakeScale(0.4,0.4,1.0);
        self.viewTag2.alpha = 0;
        self.viewTag2.tag = 1;
        self.openBtn2.frame = CGRectMake(Width*0.1-Width*0.2/6, (Width*0.2)/2, Width*0.2/3, Width*0.2/3);
        [self sendSubviewToBack:self.viewTag2];
        self.openBtn2.hidden = YES;
        
        self.viewTag3.frame = CGRectMake(-35, ((Width*0.8)*36/29-(Width*0.5)*36/29)/2, Width*0.5, (Width*0.5)*36/29);
//        self.viewTag3.layer.transform = CATransform3DMakeScale(0.6,0.6,1.0);
        self.viewTag3.alpha = 0.5;
        self.viewTag3.tag = 2;
        self.openBtn3.frame = CGRectMake(Width*0.2-Width*0.4/5, (Width*0.4)/2, Width*0.4/2.5, Width*0.4/2.5);
        self.openBtn3.hidden = YES;
        
        self.viewTag4.frame = CGRectMake(-15, ((Width*0.8)*36/29-(Width*0.65)*36/29)/2, Width*0.65, (Width*0.65)*36/29);
//        self.viewTag4.layer.transform = CATransform3DMakeScale(0.8,0.8,1.0);
        self.viewTag4.alpha = 1;
        self.viewTag4.tag = 3;
        self.openBtn4.frame = CGRectMake(Width*0.32-Width*0.65/5, (Width*0.65)/2.6, Width*0.65/2.5, Width*0.65/2.5);
        self.openBtn4.hidden = NO;
        
        self.viewTag5.frame = CGRectMake(Width/2-Width*0.4, 0, Width*0.8, (Width*0.8)*36/29);
//        self.viewTag5.layer.transform = CATransform3DMakeScale(1.0,1.0,1.0);
        self.viewTag5.alpha = 1;
        self.viewTag5.tag = 4;
        self.openBtn5.frame = CGRectMake(Width*0.4-Width*0.8/5, (Width*0.8)/2.6, Width*0.8/2.5, Width*0.8/2.5);
        [self bringSubviewToFront:self.viewTag5];
        self.openBtn5.hidden = NO;
        
        self.viewTag6.frame = CGRectMake(Width-Width*0.65+15, ((Width*0.8)*36/29-(Width*0.65)*36/29)/2, Width*0.65, (Width*0.65)*36/29);
//        self.viewTag6.layer.transform = CATransform3DMakeScale(0.8,0.8,1.0);
        self.viewTag6.alpha = 1;
        self.viewTag6.tag = 5;
        self.openBtn6.frame = CGRectMake(Width*0.33-Width*0.65/5, (Width*0.65)/2.6, Width*0.65/2.5, Width*0.65/2.5);
        self.openBtn6.hidden = NO;
        
        self.viewTag7.frame = CGRectMake(Width*0.5+35, ((Width*0.8)*36/29-(Width*0.5)*36/29)/2, Width*0.5, (Width*0.5)*36/29);
//        self.viewTag7.layer.transform = CATransform3DMakeScale(0.6,0.6,1.0);
        self.viewTag7.alpha = 0.5;
        self.viewTag7.tag = 6;
        self.openBtn7.frame = CGRectMake(Width*0.2-Width*0.4/5, (Width*0.4)/2, Width*0.4/2.5, Width*0.4/2.5);
        self.openBtn7.hidden = YES;
        
    } completion:^(BOOL finished) {
        for (UIImageView *subView in self.subviews) {
            switch (subView.tag) {
                case 1:
                    self.viewTag1 = subView;
                    self.openBtn1 = subView.subviews[0];
                    break;
                case 2:
                    self.viewTag2 = subView;
                    self.openBtn2 = subView.subviews[0];
                    break;
                case 3:
                    self.viewTag3 = subView;
                    self.openBtn3 = subView.subviews[0];
                    break;
                case 4:
                    self.viewTag4 = subView;
                    self.openBtn4 = subView.subviews[0];
                    break;
                case 5:
                    self.viewTag5 = subView;
                    self.openBtn5 = subView.subviews[0];
                    break;
                case 6:
                    self.viewTag6 = subView;
                    self.openBtn6 = subView.subviews[0];
                    break;
                case 7:
                    self.viewTag7 = subView;
                    self.openBtn7 = subView.subviews[0];
                    break;
                    
                default:
                    break;
            }
        }
        
    }];
    
}

- (void)setStatus:(NSString *)status {
    _status = status;
    if ([status isEqualToString:@"star"]) {
        [_openBtn7 setBackgroundImage:[UIImage imageNamed:@"Open_Btn"] forState:UIControlStateNormal];
        [_openBtn6 setBackgroundImage:[UIImage imageNamed:@"Open_Btn"] forState:UIControlStateNormal];
        [_openBtn5 setBackgroundImage:[UIImage imageNamed:@"Open_Btn"] forState:UIControlStateNormal];
        [_openBtn4 setBackgroundImage:[UIImage imageNamed:@"Open_Btn"] forState:UIControlStateNormal];
        [_openBtn3 setBackgroundImage:[UIImage imageNamed:@"Open_Btn"] forState:UIControlStateNormal];
        [_openBtn2 setBackgroundImage:[UIImage imageNamed:@"Open_Btn"] forState:UIControlStateNormal];
        [_openBtn1 setBackgroundImage:[UIImage imageNamed:@"Open_Btn"] forState:UIControlStateNormal];
    }
}


- (void)setAdMode:(PageInfoAdModel *)adMode {
    _adMode = adMode;
    if (![NSString isNilValue:adMode.image]) {
        [_openBtn1 yy_setBackgroundImageWithURL:[NSURL URLWithString:adMode.image] forState:UIControlStateNormal options: YYWebImageOptionShowNetworkActivity];
        [_openBtn2 yy_setBackgroundImageWithURL:[NSURL URLWithString:adMode.image] forState:UIControlStateNormal options: YYWebImageOptionShowNetworkActivity];
        [_openBtn3 yy_setBackgroundImageWithURL:[NSURL URLWithString:adMode.image] forState:UIControlStateNormal options: YYWebImageOptionShowNetworkActivity];
        [_openBtn4 yy_setBackgroundImageWithURL:[NSURL URLWithString:adMode.image] forState:UIControlStateNormal options: YYWebImageOptionShowNetworkActivity];
        [_openBtn5 yy_setBackgroundImageWithURL:[NSURL URLWithString:adMode.image] forState:UIControlStateNormal options: YYWebImageOptionShowNetworkActivity];
        [_openBtn6 yy_setBackgroundImageWithURL:[NSURL URLWithString:adMode.image] forState:UIControlStateNormal options: YYWebImageOptionShowNetworkActivity];
        [_openBtn7 yy_setBackgroundImageWithURL:[NSURL URLWithString:adMode.image] forState:UIControlStateNormal options: YYWebImageOptionShowNetworkActivity];
    }
    
}

- (void)tap{
    if ([NSString isNilValue:[TVMUserModel sharedInstance].tvmid]) {
        [[TVMUrlJumpHelper sharedInstance] presentLoginViewController];
    } else {
    
    if ([self.status isEqualToString:@"stop"]) {
        if (![NSString isNilValue:self.adMode.url]) {
            if ([self.adMode.url isEqualToString:@"appnews"]) {
                UITabBarController *tabBarViewController = (UITabBarController *)[UIApplication sharedApplication].delegate.window.rootViewController;
                [tabBarViewController setSelectedIndex:0];
            } else if ([self.adMode.url isEqualToString:@"appme"]){
                UITabBarController *tabBarViewController = (UITabBarController *)[UIApplication sharedApplication].delegate.window.rootViewController;
                [tabBarViewController setSelectedIndex:4];
            } else {
                [[TVMUrlJumpHelper sharedInstance] presentNewWebControllerWithURL:self.adMode.url forbidSlip:NO];
                
            }
            [TVMHomeEvent tvmHomeRedCoolClickWithParams:@{@"url":self.adMode.url}];
        }
        
        return;
    }
    if ([self.delegate respondsToSelector:@selector(open)]) {
        [self.delegate open];
    }
        
    }
    
}

@end
