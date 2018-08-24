//
//  JMHiddenNavigationVC.m
//  JMHiddenNavigationController
//
//  Created by 杨洁茂 on 2018/8/23.
//  Copyright © 2018年 杨洁茂. All rights reserved.
//

#import "JMHiddenNavigationVC.h"
#import "UINavigationController+JMHidden.h"
@interface JMHiddenNavigationVC ()<UINavigationControllerDelegate,UIGestureRecognizerDelegate>

@end

@implementation JMHiddenNavigationVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.delegate = self;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)navigationController:(UINavigationController *)navigationController willShowViewController:(UIViewController *)viewController animated:(BOOL)animated{
    
    [self setHiddenNavVCArr];
    
    BOOL isHiddenNav = NO;
    for (NSString *classStr in self.navigationController.hiddenVCNameArr) {
        if ([viewController isKindOfClass:NSClassFromString(classStr)]) {
            isHiddenNav = YES;
        }
    }
    [navigationController setNavigationBarHidden:isHiddenNav animated:YES];
    if (isHiddenNav) {
        self.navigationController.interactivePopGestureRecognizer.delegate = self;
    }
}

- (void)setHiddenNavVCArr{
    if (self.jm_isHiddenNav) {
        if (!self.navigationController.hiddenVCNameArr) {
            self.navigationController.hiddenVCNameArr = [NSArray array];
        }
        NSMutableArray *arr = [NSMutableArray arrayWithArray:self.navigationController.hiddenVCNameArr];
        [arr addObject:NSStringFromClass([self class])];
        self.navigationController.hiddenVCNameArr = [NSArray arrayWithArray:arr];
    }else{
        if (self.navigationController.hiddenVCNameArr) {
            NSMutableArray *arr = [NSMutableArray arrayWithArray:self.navigationController.hiddenVCNameArr];
            for (NSString *classNameStr in arr) {
                if ([classNameStr isEqualToString:NSStringFromClass([self class])]) {
                    [arr removeObject:classNameStr];
                    break;
                }
            }
            self.navigationController.hiddenVCNameArr = [NSArray arrayWithArray:arr];
        }
    }
}



@end
