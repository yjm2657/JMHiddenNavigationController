//
//  BaseTabBarController.m
//  JMHiddenNavigationController
//
//  Created by 杨洁茂 on 2018/8/23.
//  Copyright © 2018年 杨洁茂. All rights reserved.
//

#import "BaseTabBarController.h"
#import "LeftVC.h"
#import "RightVC.h"
//#import "JMNavigationController.h"
#import "UINavigationController+JMHidden.h"
@interface BaseTabBarController ()

@end

@implementation BaseTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (instancetype)init{
    if (self = [super init]) {
        [self setup];
    }
    return self;
}

- (void)setup{
    LeftVC *leftVC = [[LeftVC alloc]init];
    UINavigationController *leftNav = [[UINavigationController alloc]initWithRootViewController:leftVC];
    leftNav.tabBarItem = [[UITabBarItem alloc]initWithTabBarSystemItem:UITabBarSystemItemMore tag:0];
    [self addChildViewController:leftNav];
    
    RightVC *rightVC = [[RightVC alloc]init];
    UINavigationController *rightNav = [[UINavigationController alloc]initWithRootViewController:rightVC];
    rightNav.tabBarItem = [[UITabBarItem alloc]initWithTabBarSystemItem:UITabBarSystemItemMore tag:1];
    [self addChildViewController:rightNav];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
