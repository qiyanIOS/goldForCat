//
//  FBViewController.m
//  GoldCat
//
//  Created by apple on 16/1/27.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "FBViewController.h"

@interface FBViewController ()
@property (weak, nonatomic) IBOutlet UIView *guidaoView;

@end

@implementation FBViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initGuiDaoView];
}
-(void)initGuiDaoView
{
    UIView* guidaoLineView=[[UIView alloc]initWithFrame:CGRectMake(0, 0,  self.view.frame.size.width/2, 2)];
    guidaoLineView.backgroundColor=[UIColor redColor];
    guidaoLineView.tag=1000;
    [self.guidaoView addSubview:guidaoLineView];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
   
}
- (IBAction)sender:(UIButton*)sender {
    [UIView animateWithDuration:0.3 animations:^{
        UIView* guidaoLineView=[self.view viewWithTag:1000];
        guidaoLineView.frame=CGRectMake(sender.tag* self.view.frame.size.width/2, 0, self.view.frame.size.width/2, 2);
        
        
        
    }];
}



@end
