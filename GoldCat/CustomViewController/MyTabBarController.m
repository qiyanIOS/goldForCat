//
//  MyTabBarController.m
//  GoldCat
//
//  Created by apple on 16/1/18.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "MyTabBarController.h"
#import "GoldViewController.h"
#import "duiHuanViewController.h"
#import "MapViewController.h"
#import "FindViewController.h"
#import "MineViewController.h"
#import "MyTabBarController.h"
@interface MyTabBarController ()<UITabBarControllerDelegate>
@property(nonatomic,assign)BOOL selectedBtn;

@end

@implementation MyTabBarController


-(instancetype)init
{
    if (self==[super init]) {
        
//        self.selectedIndex=2;
//        self.selectedBtn=YES;
        
        UIStoryboard* sb=[UIStoryboard storyboardWithName:@"Storyboard" bundle:nil];
        
        GoldViewController* login=[sb  instantiateViewControllerWithIdentifier:@"gold"];
        duiHuanViewController* duiHuan=[sb instantiateViewControllerWithIdentifier:@"duiHuan"];
//        GoldViewController* login=[GoldViewController new];
        UINavigationController* loginNavi=[[UINavigationController alloc]initWithRootViewController:login];
        
//        duiHuanViewController* duiHuan=[duiHuanViewController new];
        UINavigationController* duiHuanNavi=[[UINavigationController alloc]initWithRootViewController:duiHuan];
        
        MapViewController* map=[MapViewController new];
        UINavigationController* mapNavi=[[UINavigationController alloc]initWithRootViewController:map];
        
        FindViewController* find=[FindViewController new];
        UINavigationController* findNavi=[[UINavigationController alloc]initWithRootViewController:find];
        
        MineViewController* mine=[MineViewController new];
        UINavigationController* mineNavi=[[UINavigationController alloc]initWithRootViewController:mine];
        
        
        
        self.viewControllers=@[loginNavi,duiHuanNavi,mapNavi,findNavi,mineNavi];
        self.selectedIndex=2;
        self.tabBar.tintColor=[UIColor redColor];

    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.selectedBtn=YES;

    self.delegate=self;
    self.button.selected=YES;
    
    [self setUp];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}
-(void)setUp
{
    UIImageView *img = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"tab_background"]];
    img.frame = CGRectMake(0,0,
                           self.tabBar.frame.size.width,                                             self.tabBar.frame.size.height);
    
    img.contentMode = UIViewContentModeScaleAspectFill;
    [[self  tabBar] insertSubview:img atIndex:0];
    
    [[UITabBar appearance] setBackgroundImage:[[UIImage alloc] init]];
   [[UITabBar appearance] setShadowImage:[[UIImage alloc] init]];
   _button = [[UIButton alloc]initWithFrame:CGRectMake(0.0, 0.0, 60, 60)];
    
    _button.center = CGPointMake(self.tabBar.center.x, self.tabBar.center.y-5);
//  
//    [button setBackgroundImage:[UIImage imageNamed:@"main_tab_icon"] forState:UIControlStateNormal];
    [_button setImage:[UIImage imageNamed:@"main_tab_icon"] forState:UIControlStateNormal];
    _button.backgroundColor=[UIColor clearColor];
    [_button addTarget:self action:@selector(passValuing) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_button];
  
}
-(void)passValuing
{
    self.selectedIndex=2;
    _button.selected=YES;
}
-(void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController
{
    if (self.selectedIndex==2) {
        self.button.selected=YES;
    }else
    {
        self.button.selected=NO;
    }
}
@end
