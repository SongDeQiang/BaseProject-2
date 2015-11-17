//
//  BusRouteController.m
//  BaseProject
//
//  Created by songjianqiang on 15/11/15.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BusRouteController.h"
#import "BusStationViewModel.h"
#import <MBProgressHUD.h>
@interface BusRouteController ()<UITableViewDelegate,UITableViewDataSource,UITextFieldDelegate>
@property (nonatomic ,strong)UITextField *textView1;
@property (nonatomic ,strong)UITextField *textView2;
@property (nonatomic ,strong)UITableView *tableView;
@property (nonatomic ,strong)UILabel *label1;
@property (nonatomic ,strong)UILabel *label2;
@property (nonatomic ,strong)UIView *view1;
@property (nonatomic ,strong)BusStationViewModel *BSVM;
@property (nonatomic ,strong)UIButton *button;
@property (nonatomic ,strong)UIActivityIndicatorView *activtyView;
@end

@implementation BusRouteController
-(UIView *)view1
{
    if (!_view1) {
        _view1=[UIView new];
        [self.view addSubview:_view1];
        [_view1 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.left.right.mas_equalTo(0);
            make.bottom.mas_equalTo(self.tableView.mas_top).mas_equalTo(0);
        }];
        
        
        
    }
    return _view1;
}
-(UIActivityIndicatorView *)activtyView
{
    if (!_activtyView) {
        _activtyView=[[UIActivityIndicatorView alloc]initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
        [self.tableView addSubview:_activtyView];
        [_activtyView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.center.mas_equalTo(self.tableView.center).mas_equalTo(0);
        }];
        _activtyView.backgroundColor=[UIColor greenColor];
    }
    return _activtyView;
}
-(UITextField*)textView1
{
    if (!_textView1) {
        _textView1=[UITextField new];
        [self.view1 addSubview:_textView1];
        [_textView1 mas_makeConstraints:^(MASConstraintMaker *make) {
          
            make.top.mas_equalTo(self.view1.mas_top).mas_equalTo(5);
            make.right.mas_equalTo(self.view1.mas_right).mas_equalTo(-5);
            make.height.mas_equalTo(25);
        }];
        _textView1.delegate=self;
        _textView1.backgroundColor=[UIColor whiteColor];
         _textView1.placeholder=@"请输入";
    }
    return _textView1;
}
-(UITextField *)textView2
{
    if (!_textView2) {
        _textView2=[UITextField new];
        [self.view1 addSubview:_textView2];
        [_textView2 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.textView1.mas_bottom).mas_equalTo(5);
            make.right.mas_equalTo(self.view1.mas_right).mas_equalTo(-5);
            make.height.mas_equalTo(25);
        }];
    
        _textView2.delegate=self;
        _textView2.backgroundColor=[UIColor whiteColor];
        _textView2.placeholder=@"请输入";
        
    }
    return _textView2;
}

-(UILabel *)label1
{
    if (!_label1) {
        _label1=[UILabel new];
        
       
        [self.view1 addSubview:_label1];
        [_label1 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.view1.mas_top).mas_equalTo(8);
            make.left.mas_equalTo(self.view1.mas_left).mas_equalTo(5);
            make.right.mas_equalTo(self.textView1.mas_left).mas_equalTo(3);
            make.width.mas_equalTo(70);
        }];
        _label1.font=[UIFont systemFontOfSize:15.0];
        _label1.textColor=[UIColor blueColor];
        
    }
    return _label1;
}
-(UILabel *)label2
{
    if (!_label2) {
        _label2=[UILabel new];
        [self.view1 addSubview:_label2];
        [_label2 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.label1.mas_bottom).mas_equalTo(10);
            make.left.mas_equalTo(5);
            make.right.mas_equalTo(self.textView2.mas_left).mas_equalTo(3);
            make.width.mas_equalTo(70);
        }];
        _label2.font=[UIFont systemFontOfSize:15.0];
        _label2.textColor=[UIColor blueColor];

    }
    return _label2;
}
//-(BusStationViewModel *)BSVM
//{
//    if (!_BSVM) {
//        _BSVM=[[BusStationViewModel alloc]initWithCity:_city  StationName:_stationName Date:self.date];
//    }
//    return _BSVM;
//}
-(UITableView *)tableView
{
    if (!_tableView) {
        _tableView=[[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
        [self.view addSubview:_tableView];
        _tableView.tableFooterView=[UIView new];
        
        [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.view.mas_top).mas_equalTo(100);
            make.left.right.bottom.mas_equalTo(0);
            
        }];
//        _tableView.backgroundView=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"1420510116_DWSMLsAt"]];
        [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"Cell"];
        _tableView.delegate=self;
        _tableView.dataSource=self;
       
    }
    return _tableView;
}

-(instancetype)init
{
    if (self=[super init]) {
        self.title=@"路线查询";
    }
    return self;
}
+(NaviViewController *)navi
{
    static NaviViewController *navi=nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        BusRouteController *lvc=[BusRouteController new];
        navi=[[NaviViewController alloc]initWithRootViewController:lvc];
        navi.navigationBar.translucent=NO;
    });
    return navi;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.BSVM.rowNumeber;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"Cell"];
    cell.textLabel.text=[self.BSVM getLine_namesForRow:indexPath.row];
    self.isnil=[self.BSVM isNilForRow:indexPath.row];
    cell.textLabel.numberOfLines=0;
    return cell;
}
-(UIButton *)button
{
    if (!_button) {
        _button=[UIButton buttonWithType:0];
        [self.view1 addSubview:_button];
       
        
        [_button mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.mas_equalTo(0);
            make.bottom.mas_equalTo(self.view1.mas_bottom).mas_equalTo(3);
            make.size.mas_equalTo(CGSizeMake(80, 35));
            [_button bk_addEventHandler:^(id sender) {
                self.city=self.textView1.text;
                self.stationName=self.textView2.text;
                
                self.BSVM=[[BusStationViewModel alloc]initWithCity:self.city StationName:self.stationName Date:self.date];
               
                [self.BSVM getDataFromNetCompleteHandle:^(NSError *error) {
                    if (error) {
                        [self showErrorMsg:error.localizedDescription];
                    }else
                    {
                        [self.textView1 endEditing:YES];
                        [self.textView2 endEditing:YES];
                       [self showProgress];
                        
                       [self.tableView reloadData];
                        
                    }
                    self.textView1.text=@"";
                    self.textView2.text=@"";
                    
                }];
                
            } forControlEvents:UIControlEventTouchUpInside];
        }];
       
        [self hideProgress];

    }
    return _button;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.date=[self time];
    
    self.view1.backgroundColor=[UIColor greenColor];
//    UIImageView *imageView=[[UIImageView alloc]initWithImage:[UIImage imageNamed:"]];
//    [self.view1 addSubview:imageView];
//    [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.edges.mas_equalTo(0);
//    }];
    [self.button setBackgroundImage:[UIImage imageNamed:@"adchina_btnconfirm2"] forState:UIControlStateNormal];
    self.label2.text=@"输入站点";
    self.label1.text=@"输入城市";
 
    
    
 
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (NSString *)time
{
    
    
    
    NSDate *  senddate=[NSDate date];
    
    NSDateFormatter  *dateformatter=[[NSDateFormatter alloc] init];
    
    [dateformatter setDateFormat:@"YYYYMMddHHmmss"];
    NSString *  locationString=[dateformatter stringFromDate:senddate];
    return locationString;
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 70;
}

-(void)textFieldDidEndEditing:(UITextField *)textField
{
    [self.textView1 resignFirstResponder];
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
