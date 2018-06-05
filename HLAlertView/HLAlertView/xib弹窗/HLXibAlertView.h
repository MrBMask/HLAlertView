//
//  HLXibAlertView.h
//  HLAlertView
//
//  Created by 郝靓 on 2018/6/5.
//  Copyright © 2018年 郝靓. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum : NSUInteger {
    XibAlertBlockCauseButtonClick = 0,
    XibAlertBlockSureButtonClick
} XibAlertBlockButtonClickIndex;


@interface HLXibAlertView : UIView
@property(nonatomic, copy) void (^xibButtonBlock) (NSInteger index);

+ (void)alertWithTittle:(NSString *)tittle message:(NSString *)message block:(void (^)(NSInteger))block;


@end
