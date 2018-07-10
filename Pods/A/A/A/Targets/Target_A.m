//
//  Target_A.m
//  A
//
//  Created by casa on 2016/12/10.
//  Copyright © 2016年 casa. All rights reserved.
//

#import "Target_A.h"
#import "AViewController.h"

@implementation Target_A

- (UIViewController *)Action_viewController:(NSDictionary *)params
{
    AViewController *viewController = [[AViewController alloc] init];
    return viewController;
}

@end
