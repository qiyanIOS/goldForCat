//
//  LeadViewController.m
//  GoldCat
//
//  Created by apple on 16/1/13.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "LeadViewController.h"
#import "LoginViewController.h"
@interface LeadViewController ()
@property(nonatomic,strong)UIScrollView* scrollView;
@property(nonatomic,strong)UIButton* button;
@end

@implementation LeadViewController
//懒加载scrollView
-(UIScrollView*)scrollView
{
    if (!_scrollView) {
        _scrollView=[[UIScrollView alloc]initWithFrame:self.view.bounds];
        _scrollView.bounces=NO;//设置边缘不能滑动
       
        [self.view addSubview:_scrollView];
        
    }
    return _scrollView;
}

-(UIButton*)button
{
    
    if (!_button)
    {
        _button=[UIButton buttonWithType:UIButtonTypeSystem];
        [_button setTitle:@"开始体验" forState:UIControlStateNormal];
        _button.backgroundColor=[UIColor clearColor];
        [_button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        _button.frame=CGRectMake(0, 0, 100, 40);
        _button.center=CGPointMake(3.5*self.view.frame.size.width, self.view.frame.size.height-60);
        _button.layer.cornerRadius=5;
        _button.layer.borderColor=[UIColor whiteColor].CGColor;
        _button.layer.borderWidth=1;
        
        
        [_button addTarget:self action:@selector(click) forControlEvents:UIControlEventTouchUpInside];
        
        
    }
    return _button;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
   
    [self initScrollView];
    
    NSUserDefaults * setting = [NSUserDefaults standardUserDefaults];
    NSString * key = [NSString stringWithFormat:@"firstLaunch"];
    [setting setObject:[NSString stringWithFormat:@"false"] forKey:key];
    
     self.automaticallyAdjustsScrollViewInsets = NO;
   
}
-(void)initScrollView
{
    NSArray* imageArray=@[@"guide_index_one",@"guide_index_two",@"guide_index_three",@"guide_index_four"];
    for (int i=0; i<imageArray.count; i++) {
        UIImageView* imageView=[[UIImageView alloc]init];      imageView.image=[UIImage imageNamed:[NSString stringWithFormat:@"guide_%d",i+1]];
        imageView.frame=CGRectMake(i*self.view.frame.size.width, 0, self.view.frame.size.width, self.view.frame.size.height);
        [self.scrollView addSubview:imageView];
        UIImageView* indexImage=[[UIImageView alloc]init];
        indexImage.image=[UIImage imageNamed:imageArray[i]];
        indexImage.frame=CGRectMake(0, 60, self.view.frame.size.width, 6);
        indexImage.contentMode= UIViewContentModeScaleAspectFit;
        [imageView addSubview:indexImage];

    }
    self.scrollView.contentSize=CGSizeMake(imageArray.count*self.view.frame.size.width, 0);
    self.scrollView.pagingEnabled=YES;
    self.scrollView.showsHorizontalScrollIndicator=NO;
    [self.scrollView addSubview:self.button];
    
}

-(void)click
{
    
    LoginViewController* loginVc=[LoginViewController new];
    [self presentViewController:loginVc animated:YES completion:nil];
}
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden=YES;
    
    
}
-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    self.navigationController.navigationBarHidden=NO;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
