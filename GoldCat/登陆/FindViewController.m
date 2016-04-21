//
//  FindViewController.m
//  GoldCat
//
//  Created by apple on 16/1/16.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "FindViewController.h"
#import "headView.h"
#import "FindTableViewCell.h"

@interface FindViewController ()<UITableViewDataSource,UITableViewDelegate>
@property(nonatomic,strong)UITableView* tableView;
@property(nonatomic,strong)headView* hdView;
@end

@implementation FindViewController
-(BOOL)prefersStatusBarHidden
{
    return YES;
}
-(UITableView*)tableView
{
    if (!_tableView) {
        _tableView=[[UITableView alloc]initWithFrame:CGRectMake(0,74, self.view.frame.size.width, self.view.frame.size.height-74)];
        _tableView.delegate=self;
        _tableView.dataSource=self;
        
    }
    return _tableView;
}
-(id)init
{
    if (self=[super init]) {
        self.tabBarItem.image=[UIImage imageNamed:@"faxian_tab_normal"];
        self.tabBarItem.selectedImage=[[UIImage imageNamed:@"faxian_tab_selected"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
         self.title=@"发现";
    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
   
    [self tableViewInit];
  
    
}

-(void)tableViewInit
{
    [self.view addSubview:self.tableView];
    //self.automaticallyAdjustsScrollViewInsets = NO;
    [self.tableView registerNib:[UINib nibWithNibName:@"FindTableViewCell" bundle:nil] forCellReuseIdentifier:@"cell"];
    _hdView=[[headView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 94)];

        [self.view addSubview:_hdView];
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 20;
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    FindTableViewCell * cell=[tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 180;
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
