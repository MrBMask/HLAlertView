//
//  HLXibAlertView.m
//  HLAlertView
//
//  Created by 郝靓 on 2018/6/5.
//  Copyright © 2018年 郝靓. All rights reserved.
//

#import "HLXibAlertView.h"

#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height

@interface HLXibAlertView()


@property (weak, nonatomic) IBOutlet UILabel *tittleLable;
@property (weak, nonatomic) IBOutlet UILabel *messageLable;


@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *message;


@end


@implementation HLXibAlertView

- (void)awakeFromNib{
    [super awakeFromNib];
    self.backgroundColor =  [UIColor colorWithWhite:0.5 alpha:0.85];
}

+ (void)alertWithTittle:(NSString *)tittle message:(NSString *)message block:(void (^)(NSInteger))block{
    
    HLXibAlertView * alertView = [[NSBundle mainBundle] loadNibNamed:@"HLXibAlertView" owner:nil options:nil].firstObject;
    
    alertView.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
    
    alertView.title = tittle;
    alertView.message = message;
    alertView.xibButtonBlock = block;
    
    UIWindow *keyWindow = [UIApplication sharedApplication].keyWindow;
    [keyWindow addSubview:alertView];
    
}
- (IBAction)processSureButton:(id)sender {
    if (self.xibButtonBlock) {
        self.xibButtonBlock(XibAlertBlockSureButtonClick);
    }
    [self removeFromSuperview];
    
}
- (IBAction)processCauseButton:(id)sender {
    if (self.xibButtonBlock) {
        self.xibButtonBlock(XibAlertBlockCauseButtonClick);
    }
    [self removeFromSuperview];
}




- (void)setTitle:(NSString *)title{
    _title = title;
    _tittleLable.text = title;
}

- (void)setMessage:(NSString *)message{
    _message = message;
    _messageLable.text = message;
}

@end







