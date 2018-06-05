//
//  ViewController.m
//  HLAlertView
//
//  Created by 郝靓 on 2018/6/5.
//  Copyright © 2018年 郝靓. All rights reserved.
//

#import "ViewController.h"
#import "UIView+HLExtension.h"

#import "HLAlertView.h"

#import "HLAlertViewBlock.h"

#import "HLXibAlertView.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource,HLAlertViewDelegate>

@property(nonatomic, strong) UITableView * tableView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.tableView];
}



#pragma mark - UITableView DataSource
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellID"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cellID"];
    }
    switch (indexPath.row) {
        case 0:
            cell.textLabel.text = @"delegate回调弹窗";
            break;
        case 1:
            cell.textLabel.text = @"block回调弹窗";
            break;
        case 2:
            cell.textLabel.text = @"xib自定义弹窗";
            break;
        default:
            break;
    }
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 3;
}

#pragma mark - UITableView Delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    switch (indexPath.row) {
        case 0: // delegate点击回调弹窗
        {
            [self alertViewWithDelegate];
        }
            break;
            
        case 1: // Block点击回调弹窗
        {
            [self alertViewWithBlock];
        }
            break;
            
        case 2: // xib自定义弹窗
        {
            [self alertViewWithXib];
        }
            break;
            
        default:
            break;
    }
}
#pragma mark --- delegate回调弹窗
- (void)alertViewWithDelegate{
    HLAlertView * alertView = [[HLAlertView alloc] initWithTittle:@"这个是tittle" message:@"这个是message" sureButton:@"确认按钮标题"];
    alertView.delegate = self;
    [alertView show];
}

#pragma mark --- block回调弹窗
- (void)alertViewWithBlock{
    HLAlertViewBlock * alertView = [[HLAlertViewBlock alloc] initWithTittle:@"Block" message:@"Blokk" block:^(NSInteger index) {
        if (index == AlertSureButtonClick) {
            [self alertSureButtonClick];
        }else{
            [self alertCauseButtonClick];
        }
    }];
    [alertView show];
}

#pragma mark --- block回调弹窗
- (void)alertViewWithXib{
    
    [HLXibAlertView alertWithTittle:@"xib创建" message:@"message内容就是messagemessagemessage啊" block:^(NSInteger index) {
        if (index == XibAlertBlockSureButtonClick) {
            [self alertSureButtonClick];
        }else{
            [self alertCauseButtonClick];
        }
    }];
}
#pragma mark --- HLAlertViewDelegate
-(void)alertViewDidClickButtonWithIndex:(NSInteger)index{
    if (index == AlertSureButtonClick) {
        [self alertSureButtonClick];
    }else{
        [self alertCauseButtonClick];
    }
}

#pragma mark --- 弹窗点击事件
- (void)alertSureButtonClick{
    NSLog(@"点击了确认按钮");
}

- (void)alertCauseButtonClick{
    NSLog(@"点击了取消按钮");
}

- (UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 20, self.view.width, self.view.height - 20)];
        _tableView.dataSource = self;
        _tableView.delegate = self;
    }
    return _tableView;
}



@end
