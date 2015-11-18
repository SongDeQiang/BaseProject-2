//
//  LeftViewController.m
//  BaseProject
//
//  Created by songjianqiang on 15/11/14.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "LeftViewController.h"
#import "SupportCityViewMode.h"
#import "ViewController.h"
#import "RoomPriceController.h"
#import "ViewController.h"

@interface LeftViewController ()<UITableViewDelegate,UITableViewDataSource,UITextFieldDelegate>
@property (nonatomic ,strong)SupportCityViewMode *SCM;


@property (nonatomic ,strong)UISearchController *searchController;
@property (nonatomic ,strong)NSIndexPath *indexpath;

@property (nonatomic ,strong)UITextField *textView1;
@property (nonatomic ,strong)UITextField *textView2;

@property (nonatomic ,strong)UILabel *label1;
@property (nonatomic ,strong)UILabel *label2;
@property (nonatomic ,strong)UIView*view1;
@property (nonatomic ,strong)UIButton *button;

@end



@implementation LeftViewController

-(instancetype)init
{
    if (self=[super init]) {
        self.title=@"各地房价";
        
    }
    return self;
}
+(NaviViewController *)navi
{
    
    static NaviViewController *navi=nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        LeftViewController *lvc=[LeftViewController new];
        navi=[[NaviViewController alloc]initWithRootViewController:lvc];
        navi.navigationBar.translucent=NO;
    });
    
    return navi;
    
}
-(SupportCityViewMode *)SCM
{
    if (!_SCM) {
        
        _SCM=[[SupportCityViewMode alloc]initWithDate:self.date];
        
      
    }
    return _SCM;
}
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
                
                RoomPriceController *rvc=[RoomPriceController new];
                if (self.textView1.text.length>0&&self.textView2.text.length==0) {
                    ViewController *vc=[ViewController new];
                    vc.name=self.textView1.text;
                    [self.navigationController pushViewController:vc animated:YES];
                }else if(self.textView1.text.length>0&&self.textView2.text.length>0){
                    rvc.city=self.textView1.text;
                    rvc.cityarea=self.textView2.text;
                    [self.navigationController pushViewController:rvc animated:YES];
                }
                
                } forControlEvents:UIControlEventTouchUpInside];
                  }];
             [self hideProgress];
        
    }
    return _button;
}

-(UITableView *)tableView
{
    if (!_tableView) {
        _tableView=[[UITableView alloc]initWithFrame:CGRectZero style:0];
        [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"Cell"];
        [self.view addSubview:_tableView];
        self.tableView.backgroundView=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"1420510116_GtPhiwkW"]];
        [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.left.right.mas_equalTo(0);
           make.top.mas_equalTo(self.view.mas_top).mas_equalTo(100);
        }];
        _tableView.delegate=self;
        _tableView.dataSource=self;
        _tableView.backgroundView=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"1420510116_GtPhiwkW"]];
        _tableView.mj_header=[MJRefreshNormalHeader headerWithRefreshingBlock:^{
            [self.SCM getDataFromNetCompleteHandle:^(NSError *error) {
                
                [self.tableView reloadData];
               
                
                [self.tableView.mj_header endRefreshing];
                
            }];
        }];
        
    }
    return _tableView;
}
- (NSString *)time
{
    
    
    
    NSDate *  senddate=[NSDate date];
    
    NSDateFormatter  *dateformatter=[[NSDateFormatter alloc] init];
    
    [dateformatter setDateFormat:@"YYYYMMddHHmmss"];
    NSString *  locationString=[dateformatter stringFromDate:senddate];
    return locationString;
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
self.date=[self time];
    self.view1.backgroundColor=kRGBColor(239, 232, 211);
    [self.button setBackgroundImage:[UIImage imageNamed:@"adchina_btnconfirm2"] forState:UIControlStateNormal];
    self.label1.text=@"输入城市";
    self.label2.text=@"输入区县";
    [self.tableView.mj_header beginRefreshing];
    
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.SCM.rowNumber;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"Cell"];
    cell.textLabel.text=[self.SCM WithForRow][indexPath.row];
    cell.backgroundView=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"1420510115_JFAlhdBt-1"]];
    cell.accessoryType=UITableViewCellAccessoryDisclosureIndicator;
    
    self.indexpath=indexPath;
    return cell;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    ViewController *vc=[ViewController new];
    vc.name=[self.SCM WithForRow][indexPath.row];
    
    [self.navigationController pushViewController:vc animated:YES];
    
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
