//
//  BFirstViewController.m
//  B-App
//
//  Created by zlbig on 2017/8/21.
//  Copyright © 2017年 zlbig. All rights reserved.
//

#import "BFirstViewController.h"
#import "BSecondViewController.h"

#import "Masonry.h"

@interface BFirstViewController ()

@end

@implementation BFirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"B-App";
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc] initWithTitle:@"Second" style:UIBarButtonItemStyleDone target:self action:@selector(rightItemClick:)];
    self.navigationItem.rightBarButtonItem = rightItem;
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setTitle:@"B-button" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(b_FirstButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    [button mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view.mas_centerX);
        make.centerY.equalTo(self.view.mas_centerY);
        make.width.equalTo(self.view.mas_width).multipliedBy(0.3);
        make.height.mas_equalTo(20);
    }];
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)rightItemClick:(UIBarButtonItem *)item {
    BSecondViewController *bSecondVC = [[BSecondViewController alloc] init];
    [self.navigationController pushViewController:bSecondVC animated:YES];
}

- (void)b_FirstButtonClick:(UIButton *)button {
    UIAlertController *alertContrller = [UIAlertController alertControllerWithTitle:@"提示" message:@"this is B-App!" preferredStyle:1];
    UIAlertAction *actionOK = [UIAlertAction actionWithTitle:@"ok" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
        
    }];
    [alertContrller addAction:actionOK];
    [self presentViewController:alertContrller animated:YES completion:nil];
}

@end
