//
//  GoldViewController.m
//  GoldCat
//
//  Created by apple on 16/1/16.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "GoldViewController.h"
#import "UILabel+titleLabel.h"
#import "MyTabBarController.h"
#import "TiXianTableViewController.h"
@interface GoldViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UIView *heardView;
@property(nonatomic,strong)NSString* titleStr;
@property(nonatomic,strong)UIView* underLine;
@property(nonatomic,assign)BOOL isClick;
@end

@implementation GoldViewController
#define buttonWidth ([UIScreen mainScreen].bounds.size.width-2)/3
-(UIView*)underLine
{
    if (!_underLine) {
        _underLine=[[UIView alloc]initWithFrame:CGRectMake(0, self.heardView.frame.size.height, buttonWidth+1, 1)];
         _underLine.backgroundColor=[UIColor redColor];
    }
    return _underLine;
}
-(id)initWithCoder:(NSCoder *)aDecoder
{
    if (self=[super initWithCoder:aDecoder]) {
        self.tabBarItem.image=[UIImage imageNamed:@"jinku_tab_normalr"];
        self.tabBarItem.selectedImage=[[UIImage imageNamed:@"jinku_tab_selected4"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        
        
        
        UILabel* label=[UILabel labelTextWithString:@"金库"];
        self.navigationItem.titleView=label;
        self.title=@"金库";
        
    
    }
    return self;
}



- (void)viewDidLoad {
    [super viewDidLoad];
  
    self.tableView.delegate=self;
    self.tableView.dataSource=self;
    self.tableView.tableHeaderView=self.heardView;
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    [self.heardView addSubview:self.underLine];
    self.isClick=NO;
    
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (self.isClick==NO) {
        return 5;
    }else
    {
        return 3;
    
    }
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
   
  
    
   UITableViewCell* cell=[tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (self.isClick==NO) {
    
    if (indexPath.row==0) {
        cell.textLabel.text=@"金F币共计: 1";
        
        
    }else if(indexPath.row==1)
    {
        cell.textLabel.text=@"银F币共计: 1";
    }else if(indexPath.row==2)
    {
        cell.textLabel.text=@"铜F币共计: 3";
    }else if(indexPath.row==3)
    {
        cell.textLabel.text=@"历史兑换: 0";
    }else
    {
        cell.textLabel.text=@"昨日获得: 0";
    }
    
    
       
    cell.textLabel.textColor=[UIColor lightGrayColor];
        
        
        
        return cell;
        
        
      
    }else
    {
        if (indexPath.row==0) {
            cell.textLabel.text=@"卡券共计:  1";
            
            
        }else if(indexPath.row==1)
        {
            cell.textLabel.text=@"历史兑换: 0";
        }else
        {
            cell.textLabel.text=@"昨日获得: 0";
        }
        return cell;
        
    }
    
}
- (IBAction)buttonClick:(UIButton*)sender {
    [UIView animateWithDuration:0.2 animations:^{
        
        self.underLine.frame=CGRectMake(sender.tag*(buttonWidth+1), self.heardView.frame.size.height, buttonWidth+1, 1);
        
    }];
    
    if (sender.tag==0) {
        self.titleStr=@"F币详情";
        self.isClick=NO;
        
        [self.tableView reloadData];
    
        
        
    }else if(sender.tag==1)
    {
        self.titleStr=@"卡券详情";
        self.isClick=YES;
        
        [self.tableView reloadData];
    }else
    {
        TiXianTableViewController* tixian=[TiXianTableViewController new];
   
        [self.navigationController pushViewController:tixian animated:YES];
    }

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
   
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    
      return 30;
   
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 40;
}

-(UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    
        UIView* heardView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 20)];
        heardView.backgroundColor=[UIColor clearColor];
        UILabel * label=[[UILabel alloc]initWithFrame:CGRectMake(10, 10, self.view.bounds.size.width-10, 20)];
        if (self.titleStr==nil) {
            label.text=@"F币详情";
        }else
        {
        label.text=self.titleStr;
        }
        label.font=[UIFont systemFontOfSize:15];
        label.textColor=[UIColor lightGrayColor];
        label.backgroundColor=[UIColor clearColor];
        [heardView addSubview:label];
        return heardView;
   

}
-(UIView*)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    UIView* footView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 50)];
    footView.backgroundColor=[UIColor clearColor];
    UILabel* label=[[UILabel alloc]initWithFrame:CGRectMake(10, 10, 100, 10)];
    label.text=@"小提示";
    label.backgroundColor=[UIColor clearColor];
    label.font=[UIFont systemFontOfSize:12];
    [footView addSubview:label];
    UILabel* titleLabel=[[UILabel alloc]initWithFrame:CGRectMake(10, 20, self.view.frame.size.width-20, 30)];
    titleLabel.backgroundColor=[UIColor clearColor];
    titleLabel.font=[UIFont systemFontOfSize:12];
    titleLabel.text=@"当您金F币达到1000时并在金库内满30天，您将享受1%的F币月收益。";
    titleLabel.numberOfLines=0;
    [footView addSubview:titleLabel];
    return footView;
}

@end
