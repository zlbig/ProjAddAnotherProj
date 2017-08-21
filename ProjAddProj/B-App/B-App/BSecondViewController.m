//
//  BSecondViewController.m
//  B-App
//
//  Created by zlbig on 2017/8/21.
//  Copyright © 2017年 zlbig. All rights reserved.
//

#import "BSecondViewController.h"

#import "MBProgressHUD.h"
#import "Masonry.h"

@interface BSecondViewController ()

@end

@implementation BSecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"BSecond";
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIButton *buttonShow = [UIButton buttonWithType:UIButtonTypeCustom];
    [buttonShow setTitle:@"B-ShowHUD" forState:UIControlStateNormal];
    [buttonShow setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [buttonShow setBackgroundColor:[UIColor orangeColor]];
    [buttonShow addTarget:self action:@selector(b_showHUD:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:buttonShow];
    [buttonShow mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view.mas_centerX);
        make.centerY.equalTo(self.view.mas_centerY);
        make.width.equalTo(self.view.mas_width).multipliedBy(0.7);
        make.height.mas_equalTo(45);
    }];
    
    UIBarButtonItem *thirdItem = [[UIBarButtonItem alloc] initWithTitle:@"hideHUD" style:UIBarButtonItemStyleDone target:self action:@selector(b_hideHUD:)];
    self.navigationItem.rightBarButtonItem = thirdItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)b_showHUD:(UIButton *)button {
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
}

- (void)b_hideHUD:(UIBarButtonItem *)item {
    [MBProgressHUD hideHUDForView:self.view animated:YES];
}

@end
