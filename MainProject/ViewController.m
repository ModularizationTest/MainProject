//
//  ViewController.m
//  MainProject
//
//  Created by casa on 2016/12/10.
//  Copyright © 2016年 casa. All rights reserved.
//

#import "ViewController.h"
#import <HandyFrame/UIView+LayoutMethods.h>
#import "AViewController.h"
#import <A_Category/CTMediator+A.h>

@interface ViewController ()

@property (nonatomic, strong) UIButton *pushAViewControllerButton;

@end

@implementation ViewController

#pragma mark - life cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.pushAViewControllerButton];
}

- (void)viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];

    [self.pushAViewControllerButton sizeToFit];
    [self.pushAViewControllerButton centerEqualToView:self.view];
}

#pragma mark - event response

- (void)didTappedPushAViewControllerButton:(UIButton *)button {
    
    /*
     1. 首先使用CTMediator创建AViewController
     2. 调用A_Category中的分类方法，该分类会去A中找Target_A和Action_A，使用runtime运行，生成对应的VC，并返回。
     3. 呈现A页面。（A页面有一个按钮）
     4. 点击按钮，调用B_Category中的分类方法，同上，找到Target和Action，不过本Target和Action在主工程，相当于有的组件在主工程，有的在其他工程，但是同时都需要Category，同样需要Target。
     5. 执行成功，显示Hello World。
     */
    
//    AViewController *viewController = [[AViewController alloc] init];
    UIViewController *viewController = [[CTMediator sharedInstance] A_aViewControllerWithCallback:nil];
    [self.navigationController pushViewController:viewController animated:YES];
}

#pragma mark - getters and setters

- (UIButton *)pushAViewControllerButton {
    if (_pushAViewControllerButton == nil) {
        _pushAViewControllerButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_pushAViewControllerButton setTitle:@"push A view controller" forState:UIControlStateNormal];
        [_pushAViewControllerButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
        [_pushAViewControllerButton addTarget:self action:@selector(didTappedPushAViewControllerButton:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _pushAViewControllerButton;
}

@end
