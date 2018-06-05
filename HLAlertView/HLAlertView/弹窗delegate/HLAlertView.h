//
//  HLAlertView.h
//  HLAlertView
//
//  Created by 郝靓 on 2018/6/5.
//  Copyright © 2018年 郝靓. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum : NSUInteger {
    AlertCauseButtonClick = 0,
    AlertSureButtonClick
} AlertButtonClickIndex;

#pragma mark - 协议
@class HLAlertView;
@protocol HLAlertViewDelegate<NSObject>
- (void)alertViewDidClickButtonWithIndex:(NSInteger)index;
@end



@interface HLAlertView : UIView

@property(nonatomic, weak) id <HLAlertViewDelegate> delegate;

- (instancetype)initWithTittle:(NSString *)tittle message:(NSString *)message sureButton:(NSString *)sureBtn;
- (void)show;

@end
