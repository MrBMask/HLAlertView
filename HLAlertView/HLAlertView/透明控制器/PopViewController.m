//
//  PopViewController.m
//  HLAlertView
//
//  Created by 郝靓 on 2018/6/11.
//  Copyright © 2018年 郝靓. All rights reserved.
//

#import "PopViewController.h"

@interface PopViewController ()

@end

@implementation PopViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
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
- (IBAction)processSureButton:(id)sender {
    [self dismissViewControllerAnimated:NO completion:nil];
}
- (IBAction)processCauserButton:(id)sender {
    [self dismissViewControllerAnimated:NO completion:nil];
}

@end
