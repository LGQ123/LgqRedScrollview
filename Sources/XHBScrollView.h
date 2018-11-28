//
//  XHBScrollView.h
//  HBDemo
//
//  Created by 小米 on 2018/10/13.
//  Copyright © 2018年 小米. All rights reserved.
//

#import <UIKit/UIKit.h>

@class PageInfoAdModel;
@protocol XHBScrollDelegate <NSObject>

@optional
-(void)open;

@end

@interface XHBScrollView : UIView

@property (nonatomic, strong) NSDate *RefreshDate;
@property (nonatomic, copy)  NSString *status;
@property (nonatomic, copy) PageInfoAdModel *adMode;
@property (nonatomic, weak) id<XHBScrollDelegate>delegate;

- (void)autoPage;


@end
