//
//  AppDelegate.m
//  GoldCat
//
//  Created by apple on 16/1/13.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "AppDelegate.h"
#import "LeadViewController.h"
#import "LoginViewController.h"
#import <BaiduMapAPI_Base/BMKBaseComponent.h>
@interface AppDelegate ()<BMKGeneralDelegate>

@end
BMKMapManager* _mapManager;
@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    //[NSThread sleepForTimeInterval:3.0];
    
    NSUserDefaults* settings1=[NSUserDefaults standardUserDefaults];
    NSString* key1=[NSString stringWithFormat:@"firstLaunch"];
    NSString* value=[settings1 objectForKey:key1];
    
    _window=[[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    _window.backgroundColor=[UIColor whiteColor];
    [_window makeKeyAndVisible];
    if(!value)
    {
        [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"firstLaunch"];
        NSLog(@"第一次启动");
        //如果是第一次启动的话,使用UserGuideViewController (用户引导页面) 作为根视图
        LeadViewController *lead = [[LeadViewController alloc] init];

        self.window.rootViewController = lead;
        
    }
    else
    {
        NSLog(@"不是第一次启动");
        //如果不是第一次启动的话,使用LoginViewController作为根视图
        LoginViewController *login = [[LoginViewController alloc] init];

        self.window.rootViewController=login;
    }
    
    //导航栏背景图
    [[UINavigationBar appearance]setBackgroundImage:[UIImage imageNamed:@"wallet_navBar_ios7"]forBarMetrics:UIBarMetricsDefault];
    //电池栏颜色
    [[UIApplication sharedApplication]setStatusBarStyle:UIStatusBarStyleLightContent];
    
   //百度地图
    _mapManager=[[BMKMapManager alloc]init];
    BOOL ret = [_mapManager start:@"ofz3GzYGB1jML2iVGaLR87F7" generalDelegate:self];
    if (!ret) {
        NSLog(@"manager start failed!");
    }

    
    
    
    return YES;
}
- (void)onGetNetworkState:(int)iError
{
    if (0 == iError) {
        NSLog(@"联网成功");
    }
    else{
        NSLog(@"onGetNetworkState %d",iError);
    }
    
}

- (void)onGetPermissionState:(int)iError
{
    if (0 == iError) {
        NSLog(@"授权成功");
    }
    else {
        NSLog(@"onGetPermissionState %d",iError);
    }
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    // Saves changes in the application's managed object context before the application terminates.
    
}



@end
