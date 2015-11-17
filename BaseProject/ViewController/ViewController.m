//
//  ViewController.m
//  BaseProject
//
//  Created by jiyingxin on 15/10/22.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "ViewController.h"
#import "BigAreaViewMode.h"
#import "RoomPriceController.h"
@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic ,strong)UITableView *tableView;
@property (nonatomic ,strong)BigAreaViewMode *BVM;
@end

@implementation ViewController
-(id)initWithName:(NSString *)name
{
    if (self=[super init]) {
        self.name=name;
    }
    return self;
}
-(instancetype)init
{
    if (self=[super init]) {
        self.title=@"";
    }
    return self;
}
+(UINavigationController *)defaultNavi
{
    static UINavigationController *navi=nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        ViewController *vc=[ViewController new];
        navi=[[UINavigationController alloc]initWithRootViewController:vc];
    });
    return navi;
}
-(BigAreaViewMode *)BVM
{
    if (!_BVM) {
        _BVM=[[BigAreaViewMode alloc]initWith:self.date1 Name:self.name];
    }
    return _BVM;
}
-(UITableView *)tableView
{
    if (!_tableView) {
        _tableView=[[UITableView alloc]initWithFrame:CGRectZero style:0];
        [self.view addSubview:_tableView];
        _tableView.tableFooterView=[UIView new];
        [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"Cell"];
        _tableView.backgroundView=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"1420510115_JFAlhdBt-1"]];
        
        [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(0);
        }];
      
        _tableView.mj_header=[MJRefreshNormalHeader headerWithRefreshingBlock:^{
            
        
        [self.BVM getDataFromNetCompleteHandle:^(NSError *error) {
            [self.tableView reloadData];
            [self.tableView.mj_header endRefreshing];
        }];
        }];
        
    }
    return _tableView;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.tableView.delegate=self;
    self.tableView.dataSource=self;
    self.date1=[self time];
   
    [self.tableView.mj_header beginRefreshing];
}
- (NSString *)time
{
    
    
    
    NSDate *  senddate=[NSDate date];
    
    NSDateFormatter  *dateformatter=[[NSDateFormatter alloc] init];
    
    [dateformatter setDateFormat:@"YYYYMMddHHmmss"];
    NSString *  locationString=[dateformatter stringFromDate:senddate];
    return locationString;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    [self.tableView.mj_header beginRefreshing];
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.BVM.rowNumeber;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"Cell"];
    cell.textLabel.text=[self.BVM AreaForRow][indexPath.row];
    cell.accessoryType=UITableViewCellAccessoryDisclosureIndicator;
    cell.backgroundView=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"1420510115_JFAlhdBt-1"]];
    
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    RoomPriceController *rvc=[RoomPriceController new];
    rvc.city=self.name;
    rvc.cityarea=[self.BVM AreaForRow][indexPath.row];
    [self.navigationController pushViewController:rvc animated:YES];
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
