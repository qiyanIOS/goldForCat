//
//  duiHuanViewController.m
//  GoldCat
//
//  Created by apple on 16/1/16.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "duiHuanViewController.h"
#import "UILabel+titleLabel.h"
#import "FBViewController.h"
#import "MyTabBarController.h"
@interface duiHuanViewController ()

@end
#define lineWandH  self.view.frame.size.width-80
@implementation duiHuanViewController

-(id)initWithCoder:(NSCoder *)aDecoder
{
    if (self=[super initWithCoder:aDecoder]) {
        self.tabBarItem.image=[UIImage imageNamed:@"duihuan_tab_normal"];
        self.tabBarItem.selectedImage=[[UIImage imageNamed:@"duihuan_tab_selected"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        UILabel* label=[UILabel labelTextWithString:@"兑换"];
        self.navigationItem.titleView=label;
        self.title=@"兑换";
    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
  
    UILabel* label=[UILabel labelTextWithString:@"兑换"];
    self.navigationItem.titleView=label;
    self.title=@"兑换";
    
    [self shiziView];
    
}
-(void)shiziView
{
    
    
    
    UIImageView* SimageView=[[UIImageView alloc]initWithFrame:CGRectMake(self.view.center.x, 50, 1, lineWandH)];
    
    
    UIImageView* HImageView=[[UIImageView alloc]initWithFrame:CGRectMake(0,0, lineWandH, 1)];
    HImageView.center=SimageView.center;
    HImageView.image=[UIImage imageNamed:@"listline"];
    SimageView.image=[UIImage imageNamed:@"listline"];
    
    [self.view addSubview:HImageView];
    [self.view addSubview:SimageView];
    NSArray* btnArray=@[@"fbi_icon",@"sales_icon",@"shangpin_icon",@"aixin_icon"];
    NSArray* labelArray=@[@"F币",@"卡券",@"商品",@"爱心"];
    CGFloat btnW=(self.view.frame.size.width-85)/2;
    for (int i=0; i<btnArray.count; i++) {
      
        UIView* btnView=[[UIView alloc]initWithFrame:CGRectMake(40+i%2*(btnW+5), 50+i/2*((self.view.frame.size.width-80)/2+10), btnW, (self.view.frame.size.width-80)/2-10)];
        btnView.backgroundColor=[UIColor clearColor];
        
        UIImageView* imageView=[[UIImageView alloc]initWithFrame:CGRectMake(20, 20, btnView.frame.size.width-40, btnView.frame.size.height-50)];
        imageView.image=[UIImage imageNamed:btnArray[i]];
        imageView.contentMode=UIViewContentModeScaleAspectFit;
        UILabel * label=[[UILabel alloc]initWithFrame:CGRectMake(imageView.frame.origin.x, imageView.frame.origin.y+imageView.frame.size.height+5, imageView.frame.size.width, 30)];
        label.text=labelArray[i];
        label.textAlignment=NSTextAlignmentCenter;
        
        UIButton* button=[UIButton buttonWithType:UIButtonTypeCustom];
        button.frame=CGRectMake(0, 0, btnW, (self.view.frame.size.width-80)/2-10);

        
        button.tag=i;
        [button addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
        [btnView addSubview:label];
        [btnView addSubview:button];
        [btnView addSubview:imageView];
        [self.view addSubview:btnView];
        
        
    }
    
    
}
-(void)btnClick:(UIButton*)button
{
    if (button.tag==0) {
        UIStoryboard* sb=[UIStoryboard storyboardWithName:@"Storyboard" bundle:nil];
        FBViewController* fbVc=[sb instantiateViewControllerWithIdentifier:@"fbvc"];
        
        
        
        [self.navigationController pushViewController:fbVc animated:YES];
    }
   
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
