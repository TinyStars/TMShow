//
//  RDVTabBarControllerDemo.m
//  TMShow
//
//  Created by 杜晓星 on 16/3/29.
//  Copyright © 2016年 杜晓星. All rights reserved.
//

#import "RDVTabBarControllerDemoHeader.h"


#import "RDVTabBarControllerDemo.h"

#import "DemosTableViewController.h"
#import "RDVSecondViewController.h"
#import "RDVThirdViewController.h"
#import "RDVTabBarItem.h"


@implementation RDVTabBarControllerDemo

+ (void)setupViewControllersWithRDVTabBarController:(RDVTabBarController*)tabBarController;
{
    DemosTableViewController *firstViewController = [[DemosTableViewController alloc] init];
    UIViewController *firstNavigationController = [[UINavigationController alloc]
                                                   initWithRootViewController:firstViewController];
    
    UIViewController *secondViewController = [[RDVSecondViewController alloc] init];
    UIViewController *secondNavigationController = [[UINavigationController alloc]
                                                    initWithRootViewController:secondViewController];
    
    UIViewController *thirdViewController = [[RDVThirdViewController alloc] init];
    UIViewController *thirdNavigationController = [[UINavigationController alloc]
                                                   initWithRootViewController:thirdViewController];
    
    [tabBarController setViewControllers:@[firstNavigationController, secondNavigationController,
                                           thirdNavigationController]];
    [self customizeTabBarForController:tabBarController];
}

+ (void)customizeTabBarForController:(RDVTabBarController *)tabBarController {
    UIImage *finishedImage = [UIImage imageNamed:RDVTabBarControllerDemoSrcName(@"tabbar_selected_background")];
    UIImage *unfinishedImage = [UIImage imageNamed:RDVTabBarControllerDemoSrcName(@"tabbar_normal_background")];
    NSArray *tabBarItemImages = @[@"first", @"second", @"third"];
    
    NSInteger index = 0;
    for (RDVTabBarItem *item in [[tabBarController tabBar] items]) {
        [item setBackgroundSelectedImage:finishedImage withUnselectedImage:unfinishedImage];
        NSString *selectedImageName = [NSString stringWithFormat:@"%@_selected",
                                       [tabBarItemImages objectAtIndex:index]];
        NSString *unselectedImageName = [NSString stringWithFormat:@"%@_normal",
                                         [tabBarItemImages objectAtIndex:index]];
        UIImage *selectedimage = [UIImage imageNamed:RDVTabBarControllerDemoSrcName(selectedImageName)];
        UIImage *unselectedimage = [UIImage imageNamed:RDVTabBarControllerDemoSrcName(unselectedImageName)];
        [item setFinishedSelectedImage:selectedimage withFinishedUnselectedImage:unselectedimage];
        
        index++;
    }
}

+ (void)customizeInterface {
    UINavigationBar *navigationBarAppearance = [UINavigationBar appearance];
    
    UIImage *backgroundImage = nil;
    NSDictionary *textAttributes = nil;
    
    if (NSFoundationVersionNumber > NSFoundationVersionNumber_iOS_6_1) {
        backgroundImage = [UIImage imageNamed:RDVTabBarControllerDemoSrcName(@"navigationbar_background_tall")];
        
        textAttributes = @{
                           NSFontAttributeName: [UIFont boldSystemFontOfSize:18],
                           NSForegroundColorAttributeName: [UIColor blackColor],
                           };
    } else {
#if __IPHONE_OS_VERSION_MIN_REQUIRED < __IPHONE_7_0
        backgroundImage = [UIImage imageNamed:RDVTabBarControllerDemoSrcName(@"navigationbar_background")];
        
        textAttributes = @{
                           UITextAttributeFont: [UIFont boldSystemFontOfSize:18],
                           UITextAttributeTextColor: [UIColor blackColor],
                           UITextAttributeTextShadowColor: [UIColor clearColor],
                           UITextAttributeTextShadowOffset: [NSValue valueWithUIOffset:UIOffsetZero],
                           };
#endif
    }
    
    [navigationBarAppearance setBackgroundImage:backgroundImage
                                  forBarMetrics:UIBarMetricsDefault];
    [navigationBarAppearance setTitleTextAttributes:textAttributes];
}

@end
