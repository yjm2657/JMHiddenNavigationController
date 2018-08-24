//
//  SecondVC.m
//  JMHiddenNavigationController
//
//  Created by 杨洁茂 on 2018/8/23.
//  Copyright © 2018年 杨洁茂. All rights reserved.
//

#import "SecondVC.h"
#import "ThirdVC.h"

@interface SecondVC ()

@property (nonatomic, strong) UIButton *pushBtn;

@end

@implementation SecondVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor greenColor];
    self.title = @"视图2222";
    [self.view addSubview:self.pushBtn];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (UIButton *)pushBtn{
    if (!_pushBtn) {
        _pushBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _pushBtn.bounds = CGRectMake(0, 0, 100, 40);
        _pushBtn.center = self.view.center;
        [_pushBtn setTitle:@"跳转" forState:UIControlStateNormal];
        [_pushBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        _pushBtn.backgroundColor = [UIColor whiteColor];
        [_pushBtn addTarget:self action:@selector(pushBtnClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _pushBtn;
}

- (void)pushBtnClick{
    ThirdVC *thirdVC = [[ThirdVC alloc]init];
    thirdVC.jm_isHiddenNav = NO;
    [self.navigationController pushViewController:thirdVC animated:YES];
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
//    self.navigationController.navigationBar.hidden = YES;
//    [self.navigationController setNavigationBarHidden:YES animated:YES];
}



@end
