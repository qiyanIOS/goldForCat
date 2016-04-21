//
//  MapViewController.m
//  GoldCat
//
//  Created by apple on 16/1/16.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "MapViewController.h"
#import "UILabel+titleLabel.h"
#import <BaiduMapAPI_Base/BMKBaseComponent.h>
#import <BaiduMapAPI_Map/BMKMapComponent.h>
@interface MapViewController ()<BMKMapViewDelegate>
@property(nonatomic,strong)BMKMapView* mapView;
@property(nonatomic,assign)NSInteger selectedBtn;
@property(nonatomic,strong)UIView* underLine;
@end

@implementation MapViewController
#define w    [UIScreen mainScreen].bounds.size.width/6

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self Init];
    [self BMKMapView];
    [self categoryBtn];
    
    
    
}
-(void)Init
{
    UILabel* label=[UILabel labelTextWithString:@"寻宝图"];
    self.navigationItem.titleView=label;
    
}
-(void)BMKMapView
{
    self.mapView=[[BMKMapView alloc]initWithFrame:self.view.bounds];
    self.mapView.zoomLevel=14;
    self.mapView.centerCoordinate=CLLocationCoordinate2DMake(34.29445, 108.9421);//显示西安地图；
    [self.view addSubview:self.mapView];
    BMKPointAnnotation* annotation = [[BMKPointAnnotation alloc]init];
    CLLocationCoordinate2D coor;
    coor.latitude = 34.29445;
    coor.longitude = 108.9421;
    annotation.coordinate = coor;
    
    annotation.title = @"淘金猫";
    annotation.subtitle = @"未央区海联大厦";
    [self.mapView addAnnotation:annotation];
    //关键代码 如下：
    [self.mapView selectAnnotation:annotation animated:YES];//这样就可以在初始化的时候将 气泡信息弹出
}

-(void)categoryBtn
{
    UIView* view=[[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 35)];
    view.backgroundColor=[UIColor lightGrayColor];
    NSArray* nameArray=@[@"所有",@"房产",@"家具",@"建材",@"餐饮",@"娱乐"];
    
    for (int i=0; i<nameArray.count; i++) {
        UIButton* button=[UIButton buttonWithType:UIButtonTypeCustom];
        button.frame=CGRectMake(i*w, 0, w, 35);
        [button setTitle:nameArray[i] forState:UIControlStateNormal];
        button.titleLabel.font=[UIFont systemFontOfSize:15];
        button.tag=i;
        [button addTarget:self action:@selector(move:) forControlEvents:UIControlEventTouchUpInside];
        button.selected=0;
        
        [view addSubview:button];
       
        
    
    }
    
    _underLine=[[UIView alloc]init];
    _underLine.backgroundColor=[UIColor redColor];
    _underLine.frame=CGRectMake(0, 32, w, 3);
    _underLine.layer.cornerRadius=3/2;
    [view addSubview:_underLine];
    [self.view addSubview:view];
}

-(void)move:(UIButton*)button
{
    
    [UIView animateWithDuration:0.2 animations:^{
        _underLine.frame=CGRectMake(button.tag*w, 32, w, 3);
        
    }];
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewWillAppear:(BOOL)animated
{
    
    
    [_mapView viewWillAppear];
    _mapView.delegate = self; // 此处记得不用的时候需要置nil，否则影响内存的释放
}
-(void)viewWillDisappear:(BOOL)animated
{
    
    [_mapView viewWillDisappear];
    _mapView.delegate = nil; // 不用时，置nil
}
@end
