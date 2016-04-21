//
//  TiXianTableViewController.m
//  GoldCat
//
//  Created by apple on 16/1/23.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "TiXianTableViewController.h"
#import "UILabel+titleLabel.h"
@interface TiXianTableViewController ()

@end

@implementation TiXianTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    UILabel* label=[UILabel labelTextWithString:@"提现"];
    self.navigationItem.titleView=label;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    if (section==0) {
        return 3;
    }else
    {
        return 2;
    }
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    if (indexPath.section==0) {
        if (indexPath.row==0) {
            cell.textLabel.text=@"所有现金: 500元";
        }else if(indexPath.row==1)
        {
            cell.textLabel.text=@"现有金F币: 100=100元";
        }else{
            cell.textLabel.text=@"可提取总额: 600元";
        }
    }else
    {
        if (indexPath.row==0) {
            cell.textLabel.text=@"选择提取金额";
        }else
        {
            CGFloat w=([UIScreen mainScreen].bounds.size.width-25)/4;
            NSArray* array=@[@"1000元",@"2000元",@"3000元",@"5000元"];
            for (int i=0; i<array.count; i++) {
                UILabel* label=[[UILabel alloc]initWithFrame:CGRectMake(5+i*(w+5), 5, w, 30)];
                label.text=array[i];
                label.backgroundColor=[UIColor orangeColor];
                label.textAlignment=NSTextAlignmentCenter;
                UIView* lineView=[[UIView alloc]initWithFrame:CGRectMake(20, 40, self.view.frame.size.width-10, 1)];
                lineView.backgroundColor=[UIColor groupTableViewBackgroundColor];
                [cell.contentView addSubview:lineView];
                [cell.contentView addSubview:label];
            }
        }
    }
    
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 10;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    if (section==0) {
        return 0.1;
    }else
    {
        return 60;
    }
}
-(UIView*)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    if (section==1) {
        
    
    UIView* footView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 60)];
    footView.backgroundColor=[UIColor clearColor];
    UIButton* button=[UIButton buttonWithType:UIButtonTypeCustom];
    button.frame=CGRectMake(0, 0, 100, 30);
    button.center=footView.center;
    [button setTitle:@"一键提取" forState:UIControlStateNormal];
    button.backgroundColor=[UIColor orangeColor];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [footView addSubview:button];
    return footView;
    }else
    {
        return nil;
    }
}
@end
