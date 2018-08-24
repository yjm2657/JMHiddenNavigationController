//
//  LeftVC.m
//  JMHiddenNavigationController
//
//  Created by 杨洁茂 on 2018/8/23.
//  Copyright © 2018年 杨洁茂. All rights reserved.
//

#import "LeftVC.h"
#import "SecondVC.h"
#import "UINavigationController+JMHidden.h"
@interface LeftVC ()

@property (nonatomic, strong) UIButton *pushBtn;

@end

@implementation LeftVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor yellowColor];
    self.title = @"根视图0000";
    self.jm_isHiddenNav = YES;
    
    [self.view addSubview:self.pushBtn];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
    SecondVC *secondVC = [[SecondVC alloc]init];
    secondVC.jm_isHiddenNav = YES;
    secondVC.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:secondVC animated:YES];
}



@end
