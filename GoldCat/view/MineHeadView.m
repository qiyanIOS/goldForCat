//
//  MineHeadView.m
//  GoldCat
//
//  Created by apple on 16/1/26.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "MineHeadView.h"

@implementation MineHeadView

-(id)initWithFrame:(CGRect)frame
{
    if (self=[super initWithFrame:frame]) {
        
        UIImageView* imageView=[[UIImageView alloc]initWithFrame:frame];
        imageView.image=[UIImage imageNamed:@"wode_background"];
        imageView.contentMode=UIViewContentModeScaleAspectFit;
        imageView.userInteractionEnabled=YES;
        UIImageView* touImage=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 60, 60)];
        touImage.center=CGPointMake(10+30, self.center.y);
        touImage.image=[UIImage imageNamed:@"main_tab_icon"];
        touImage.contentMode=UIViewContentModeScaleAspectFit;
        UILabel* label=[[UILabel alloc]initWithFrame:CGRectMake(0, 0, 100, 30)];
        label.center=CGPointMake(touImage.center.x+30+10+50, self.center.y);
        label.text=@"淘金猫";
        UIButton* button=[UIButton buttonWithType:UIButtonTypeCustom];
        button.frame=CGRectMake(0, 0, 80, 30);
        button.center=CGPointMake(frame.size.width-20-40, self.center.y);
        [button setTitle:@"我的消息" forState:UIControlStateNormal];
        button.layer.borderColor=[UIColor redColor].CGColor;
        button.layer.borderWidth=1;
        button.layer.masksToBounds=YES;
        button.backgroundColor=[UIColor clearColor];
        button.titleLabel.font=[UIFont systemFontOfSize:14];
        
        [self addSubview:imageView];
        [imageView addSubview:label];
        [imageView addSubview:touImage];
        [imageView addSubview:button];
        
    }
    return self;
}

@end
