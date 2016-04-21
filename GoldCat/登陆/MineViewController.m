//
//  MineViewController.m
//  GoldCat
//
//  Created by apple on 16/1/16.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "MineViewController.h"
#import "UILabel+titleLabel.h"
#import "MineHeadView.h"
@interface MineViewController ()<UITableViewDataSource,UITableViewDelegate>
@property(nonatomic,strong)UITableView* tableView;
@property(nonatomic,strong)MineHeadView* headView;
@end

@implementation MineViewController
-(id)init
{
    if (self=[super init]) {
        self.tabBarItem.image=[UIImage imageNamed:@"wode_tab_normal"];
        self.tabBarItem.selectedImage=[[UIImage imageNamed:@"wode_tab_selected"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
         self.title=@"我的";
        UILabel* label=[UILabel labelTextWithString:@"我的"];
        self.navigationItem.titleView=label;
    }
    return self;
}
-(UITableView*)tableView
{
    if (!_tableView) {
        _tableView=[[UITableView alloc]initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height-64) style:UITableViewStyleGrouped];
     
        _tableView.delegate=self;
        _tableView.dataSource=self;
    }
    return _tableView;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initTableView];
 
    
}
-(void)initTableView
{
    [self.view addSubview:self.tableView];
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    _headView=[[MineHeadView alloc]initWithFrame:CGRectMake(0, -5, self.view.frame.size.width, 150)];
    self.tableView.tableHeaderView=_headView;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
   
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 3;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section==0) {
        return 3;
    }else if(section==1)
    {
        return 2;
    }else
    {
        return 3;
    }
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell* cell=[tableView dequeueReusableCellWithIdentifier:@"cell"];
    UIImageView* cellImageView=[[UIImageView alloc]initWithFrame:CGRectMake(10, 10, 20, 20)];
    
    cell.imageView.contentMode=UIViewContentModeScaleAspectFit;
   
    cell.textLabel.font=[UIFont systemFontOfSize:15];
    if (indexPath.section==0) {
        if (indexPath.row==0) {

            cellImageView.image=[UIImage imageNamed:@"yinhangkaee"];
            cell.imageView.image=cellImageView.image;
            cell.textLabel.text=@"银行卡";
            
        }else if(indexPath.row==1)
        {
            cell.imageView.image=[UIImage imageNamed:@"tongxunluee"];
            cell.textLabel.text=@"通讯录";
        }else{
            cell.imageView.image=[UIImage imageNamed:@"zfbee"];
            cell.textLabel.text=@"转赠F币";
        }
    }else if(indexPath.section==1)
    {
        if (indexPath.row==0) {
            cell.imageView.image=[UIImage imageNamed:@"yaoqingee"];
            cell.textLabel.text=@"邀请";
            
        }else
        {
            cell.imageView.image=[UIImage imageNamed:@"setee"];
            cell.textLabel.text=@"设置";
        }
            
    }else
    {
        if (indexPath.row==0) {
            cell.imageView.image=[UIImage imageNamed:@"xiangceee"];
            cell.textLabel.text=@"相册";
        }else if(indexPath.row==1)
        {
            cell.imageView.image=[UIImage imageNamed:@"biaoqingee"];
           cell.textLabel.text=@"表情";
            
        }else
        {
            cell.imageView.image=[UIImage imageNamed:@"renzhengee"];
            cell.textLabel.text=@"收藏";
        }
    }
    cell.accessoryType=1;
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 10;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0.01;
}
@end
