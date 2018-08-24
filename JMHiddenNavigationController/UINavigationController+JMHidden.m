//
//  UINavigationController+JMHidden.m
//  JMHiddenNavigationController
//
//  Created by 杨洁茂 on 2018/8/23.
//  Copyright © 2018年 杨洁茂. All rights reserved.
//

#import "UINavigationController+JMHidden.h"
#import <objc/runtime.h>

@implementation UINavigationController (JMHidden)

static const char hiddenVCNameArrKey;

- (void)setHiddenVCNameArr:(NSArray *)hiddenVCNameArr{
    objc_setAssociatedObject(self, &hiddenVCNameArrKey, hiddenVCNameArr, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (NSArray *)hiddenVCNameArr{
    return objc_getAssociatedObject(self, &hiddenVCNameArrKey);
}

@end
