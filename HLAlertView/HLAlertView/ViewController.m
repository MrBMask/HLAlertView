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

#import "PopViewController.h"

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
        case 3:
            cell.textLabel.text = @"透明控制器弹窗";
            break;

        default:
            break;
    }
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 4;
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
            
        case 3: // 透明控制器弹窗
        {
            [self presentClearViewController];
        }
            break;
            
        default:
            break;
    }
}
#pragma mark --- delegate回调弹窗
- (void)alertViewWithDelegate{
    HLAlertView * alertView = [[HLAlertView alloc] initWithTittle:@"提示" message:@"这个是通过delegate回调的弹窗" sureButton:@"确认按钮标题"];
    alertView.delegate = self;
    [alertView show];
}

#pragma mark --- block回调弹窗
- (void)alertViewWithBlock{
    HLAlertViewBlock * alertView = [[HLAlertViewBlock alloc] initWithTittle:@"提示" message:@"通过Block弹窗回调的弹窗" block:^(NSInteger index) {
        if (index == AlertSureButtonClick) {
            [self alertSureButtonClick];
        }else{
            [self alertCauseButtonClick];
        }
    }];
    [alertView show];
}

#pragma mark --- xib弹窗
- (void)alertViewWithXib{
    
    [HLXibAlertView alertWithTittle:@"xib创建" message:@"message内容就是messagemessagemessage啊" block:^(NSInteger index) {
        if (index == XibAlertBlockSureButtonClick) {
            [self alertSureButtonClick];
        }else{
            [self alertCauseButtonClick];
        }
    }];
}

#pragma mark --- xib弹窗
- (void)presentClearViewController{
    PopViewController * popVC = [[PopViewController alloc] init];
    UIColor * color = [UIColor blackColor];
    popVC.view.backgroundColor = [color colorWithAlphaComponent:0.85];
    popVC.modalPresentationStyle = UIModalPresentationOverCurrentContext;
    [self presentViewController:popVC animated:NO completion:nil];
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
