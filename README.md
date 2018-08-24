# JMHiddenNavigationController
iOS 隐藏导航相互跳转出现黑块,解决方案

关键代码

///导航代理 基类封装 在一个导航下导航公用
- (void)navigationController:(UINavigationController *)navigationController willShowViewController:(UIViewController *)viewController animated:(BOOL)animated{
    
    ///设置需要隐藏的导航类数组
    [self setHiddenNavVCArr];
    
    BOOL isHiddenNav = NO;
    for (NSString *classStr in self.navigationController.hiddenVCNameArr) {
        if ([viewController isKindOfClass:NSClassFromString(classStr)]) {
            isHiddenNav = YES;
        }
    }
    
    ///判断并隐藏导航
    [navigationController setNavigationBarHidden:isHiddenNav animated:YES];
    if (isHiddenNav) {
        ///打开左滑返回手势
        self.navigationController.interactivePopGestureRecognizer.delegate = self;
    }
    
}
