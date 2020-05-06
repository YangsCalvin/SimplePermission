//
//  SimplePermissionViewController.m
//  SimplePermission
//
//  Created by Calvin on 2020/4/29.
//  Copyright © 2020 Calvin. All rights reserved.
//

#import "SimplePermissionViewController.h"
#import "SimplePermissionTableViewCell.h"
#import "SimplePermission.h"

@interface SimplePermissionViewController ()<UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, strong) UIButton *bottomButton;

@property (nonatomic, strong) NSMutableArray *tempPermissions;

@end


static NSString *const cellReuseIdentifier = @"SimplePermissionTableViewCell";
@implementation SimplePermissionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _tempPermissions = [NSMutableArray arrayWithArray:self.permissions];
    // Do any additional setup after loading the view.
    [self setupUI];
    
    [self setupTableView];
}

- (void)setupUI{
    //背景色
    if (@available(iOS 13.0, *)) {
        self.view.backgroundColor = [UIColor systemBackgroundColor];
    } else {
        self.view.backgroundColor = [UIColor whiteColor];
    }
    
    if (@available(iOS 11.0, *)) {
        self.navigationController.navigationBar.prefersLargeTitles = YES;
        self.navigationController.navigationItem.largeTitleDisplayMode =  UINavigationItemLargeTitleDisplayModeAutomatic;
    } else {
        // Fallback on earlier versions
    }
    
    self.title = @"需要的权限";
}

- (void)setupTableView{
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    self.tableView.translatesAutoresizingMaskIntoConstraints = NO;
    
    [self.view addSubview:self.tableView];
    
    NSLayoutConstraint *t_left = [NSLayoutConstraint constraintWithItem:self.tableView attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeLeft multiplier:1.0 constant:0];
    
    NSLayoutConstraint *t_right = [NSLayoutConstraint constraintWithItem:self.tableView attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeRight multiplier:1.0 constant:0];
    
    NSLayoutConstraint *t_top = [NSLayoutConstraint constraintWithItem:self.tableView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeTopMargin multiplier:1.0 constant:0];

    NSLayoutConstraint *t_bottom = [NSLayoutConstraint constraintWithItem:self.tableView attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeBottom multiplier:1.0 constant:-78];

    [self.view addConstraints:@[t_left,t_right,t_top,t_bottom]];
    
    self.bottomButton.translatesAutoresizingMaskIntoConstraints = NO;
    
    [self.view addSubview:self.bottomButton];
    
    NSLayoutConstraint *b_left = [NSLayoutConstraint constraintWithItem:self.bottomButton attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeLeft multiplier:1.0 constant:15];
    
    NSLayoutConstraint *b_right = [NSLayoutConstraint constraintWithItem:self.bottomButton attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeRight multiplier:1.0 constant:-15];
    
    NSLayoutConstraint *b_top = [NSLayoutConstraint constraintWithItem:self.bottomButton attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.tableView attribute:NSLayoutAttributeBottom multiplier:1.0 constant:5];
    
    NSLayoutConstraint *b_bottom = [NSLayoutConstraint constraintWithItem:self.bottomButton attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeBottom multiplier:1.0 constant:-15];
    
    [self.view addConstraints:@[b_left,b_right,b_top,b_bottom]];
}

#pragma mark - 请求权限
- (void)requestPermissions{
    
    if(self.tempPermissions.count){
        
        NSDictionary *dict = self.tempPermissions.firstObject;
        [self.tempPermissions removeObjectAtIndex:0];
        
        NSNumber *typeNum = [dict objectForKey:@"type"];
        
        SimplePermissionType type = [typeNum integerValue];
        
        [SimplePermission authorizeWithType:type completion:^(BOOL granted, BOOL firstTime) {
           
            [self requestPermissions];
        }];
        
    }else{
        [self.navigationController dismissViewControllerAnimated:YES completion:nil];
    }
}

#pragma mark - Lazy load
- (UIButton *)bottomButton{
    if(!_bottomButton){
        _bottomButton = [UIButton buttonWithType:UIButtonTypeSystem];
        _bottomButton.backgroundColor = [UIColor systemBlueColor];
        [_bottomButton setTitle:@"立即开启" forState:UIControlStateNormal];
        _bottomButton.titleLabel.font = [UIFont systemFontOfSize:16 weight:UIFontWeightMedium];
        if (@available(iOS 13.0, *)) {
            [_bottomButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        } else {
            [_bottomButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        }
        [_bottomButton addTarget:self action:@selector(requestPermissions) forControlEvents:UIControlEventTouchUpInside];
        _bottomButton.layer.cornerRadius = 12;
    }
    return _bottomButton;;
}

- (UITableView *)tableView{
    
    if(!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        if (@available(iOS 11.0, *)) {
            _tableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
        } else {
            self.automaticallyAdjustsScrollViewInsets = NO;
        }
        _tableView.allowsMultipleSelection = YES;
        [_tableView setAllowsMultipleSelection:YES];
        [_tableView registerNib:[UINib nibWithNibName:cellReuseIdentifier bundle:[NSBundle mainBundle]] forCellReuseIdentifier:cellReuseIdentifier];
    }
    return _tableView;
}

#pragma mark - TableView DataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return self.permissions.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NSDictionary *dict = [self.permissions objectAtIndex:indexPath.row];
    
    SimplePermissionTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellReuseIdentifier forIndexPath:indexPath];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    cell.iconImageView.image = [dict valueForKey:@"iconImage"];
    cell.nameLabel.text = [dict valueForKey:@"name"];
    cell.describeLabel.text = [dict valueForKey:@"describe"];
    cell.selectedImageView.image = [dict valueForKey:@"selectedImage"];
    
    return cell;
}

#pragma mark - TableView Delegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
//    [tableView deselectRowAtIndexPath:indexPath animated:YES];
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
