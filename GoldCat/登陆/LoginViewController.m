//
//  LoginViewController.m
//  GoldCat
//
//  Created by apple on 16/1/13.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "LoginViewController.h"
#import "UILabel+titleLabel.h"
//#import "GoldViewController.h"
//#import "duiHuanViewController.h"
//#import "MapViewController.h"
//#import "FindViewController.h"
//#import "MineViewController.h"
//#import "MyTabBarController.h"
#import "MyTabBarController.h"

@interface LoginViewController ()<UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *useTextField;
@property (weak, nonatomic) IBOutlet UITextField *passWordTextField;
@property (weak, nonatomic) IBOutlet UIView *zhuView;

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.hidesBackButton=YES;
    UILabel* label=[UILabel labelTextWithString:@"登陆"];
    self.navigationItem.titleView=label;
    
    [self textfieldDelegate];
    
}
-(void)textFieldDidBeginEditing:(UITextField *)textField
{
   
    
    int offset = self.zhuView.frame.origin.y+self.zhuView.frame.size.height - (self.view.frame.size.height - 216);//键盘高度216
    NSLog(@"%d",offset);
    
    NSTimeInterval animationDuration = 0.30f;
    [UIView beginAnimations:@"ResizeForKeyboard" context:nil];
    [UIView setAnimationDuration:animationDuration];
    
    //将视图的Y坐标向上移动offset个单位，以使下面腾出地方用于软键盘的显示
    if(offset > 0)
        self.view.frame = CGRectMake(0.0f, -offset, self.view.frame.size.width, self.view.frame.size.height);
    
    [UIView commitAnimations];
}
-(void)resumeView
{
    NSTimeInterval animationDuration=0.30f;
    [UIView beginAnimations:@"ResizeForKeyboard" context:nil];
    [UIView setAnimationDuration:animationDuration];
    float width = self.view.frame.size.width;
    float height = self.view.frame.size.height;
    //如果当前View是父视图，则Y为20个像素高度，如果当前View为其他View的子视图，则动态调节Y的高度
//    float Y = 20.0f;
    CGRect rect=CGRectMake(0.0f,0,width,height);
    self.view.frame=rect;
    [UIView commitAnimations];
}


- (IBAction)nextOnKeyboard:(id)sender {
    
    if (sender == self.useTextField) {
        [self.passWordTextField becomeFirstResponder];
    }else if (sender == self.passWordTextField){
        [self hidenKeyboard];
    }
    
}
-(void)hidenKeyboard
{
    [self.useTextField resignFirstResponder];
    [self.passWordTextField resignFirstResponder];
    [self resumeView];
}
-(void)textfieldDelegate
{
    //指定本身为代理
    self.useTextField.delegate = self;
    self.passWordTextField.delegate = self;
    //指定编辑时键盘的return键类型
    self.useTextField.returnKeyType = UIReturnKeyNext;
    self.passWordTextField.returnKeyType = UIReturnKeyDefault;
    
    //注册键盘响应事件方法
    [self.useTextField addTarget:self action:@selector(nextOnKeyboard:) forControlEvents:UIControlEventEditingDidEndOnExit];
    [self.passWordTextField addTarget:self action:@selector(nextOnKeyboard:) forControlEvents:UIControlEventEditingDidEndOnExit];
    
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
    [self resumeView];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}
- (IBAction)goIn:(id)sender {

//    GoldViewController* login=[GoldViewController new];
//        UINavigationController* loginNavi=[[UINavigationController alloc]initWithRootViewController:login];
//    
//    duiHuanViewController* duiHuan=[duiHuanViewController new];
//    UINavigationController* duiHuanNavi=[[UINavigationController alloc]initWithRootViewController:duiHuan];
//    
//    MapViewController* map=[MapViewController new];
//    UINavigationController* mapNavi=[[UINavigationController alloc]initWithRootViewController:map];
//    
//    FindViewController* find=[FindViewController new];
//    UINavigationController* findNavi=[[UINavigationController alloc]initWithRootViewController:find];
//    
//    MineViewController* mine=[MineViewController new];
//    UINavigationController* mineNavi=[[UINavigationController alloc]initWithRootViewController:mine];
    
    
  MyTabBarController* tabBar=[[MyTabBarController alloc]init];
//    tabBar.viewControllers=@[loginNavi,duiHuanNavi,mapNavi,findNavi,mineNavi];
    
    [self presentViewController:tabBar animated:YES completion:nil];
    
    
    
    
}


@end
