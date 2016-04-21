//
//  headView.m
//  GoldCat
//
//  Created by apple on 16/1/25.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "headView.h"
#import "UIButton+backGround.h"
@implementation headView
#define bigBtnW  [UIScreen mainScreen].bounds.size.width/3
#define smallBtnW [UIScreen mainScreen].bounds.size.width/5
-(id)initWithFrame:(CGRect)frame
{
    if (self=[super initWithFrame:frame]) {
        
   
    
        UIView * view=[[UIView alloc]initWithFrame:frame];
    [self addSubview:view];
        UIView* starBarView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 20)];
        starBarView.backgroundColor=[UIColor redColor];
        [view addSubview:starBarView];
        NSArray* bigBtnArray=@[@"发现福利",@"排行榜",@"猫友会"];
        for (int i=0; i<bigBtnArray.count; i++) {
            UIButton* bigBtn=[UIButton buttonWithType:UIButtonTypeCustom];
            bigBtn.frame=CGRectMake(i*bigBtnW, 20, bigBtnW, 44);
            [bigBtn setTitle:bigBtnArray[i] forState:UIControlStateNormal];
            [bigBtn setBackgroundColor:[UIColor redColor] forState:UIControlStateNormal];
            [bigBtn setBackgroundColor:[UIColor orangeColor] forState:UIControlStateSelected];
            bigBtn.tag=i;
            [bigBtn addTarget:self action:@selector(bigBtnClick:) forControlEvents:UIControlEventTouchUpInside];
            if (0==i) {
                bigBtn.selected=YES;
                self.selectedBtn=bigBtn;
            }
            
            [view addSubview:bigBtn];
        }
        NSArray* smallBtnArray=@[@"分类",@"红包",@"卡券",@"商品",@"爱心"];
        for (int i=0; i<smallBtnArray.count; i++) {
            UIButton* smallBtn=[UIButton buttonWithType:UIButtonTypeCustom];
            smallBtn.frame=CGRectMake(i*smallBtnW, 64, smallBtnW, 30);
            [smallBtn setTitle:smallBtnArray[i] forState:UIControlStateNormal];
            smallBtn.titleLabel.font=[UIFont systemFontOfSize:14];
            [smallBtn setBackgroundColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
            [smallBtn setBackgroundColor:[UIColor groupTableViewBackgroundColor] forState:UIControlStateSelected];
            [smallBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
            [smallBtn addTarget:self action:@selector(smallBtnClick:) forControlEvents:UIControlEventTouchUpInside];
            if (i==0) {
                smallBtn.selected=YES;
                self.smallSelectedBtn=smallBtn;
            }
            [view addSubview:smallBtn];
        }
       
         }
   
    return self;
}
-(void)bigBtnClick:(UIButton*)button
{
    
    self.selectedBtn.selected=NO;
    button.selected=YES;
    self.selectedBtn=button;
    
}
-(void)smallBtnClick:(UIButton*)button
{
    self.smallSelectedBtn.selected=NO;
    button.selected=YES;
    self.smallSelectedBtn=button;
}
@end
