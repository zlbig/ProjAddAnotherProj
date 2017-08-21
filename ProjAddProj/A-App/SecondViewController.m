//
//  SecondViewController.m
//  A-App
//
//  Created by zlbig on 2017/8/21.
//  Copyright © 2017年 zlbig. All rights reserved.
//

#import "SecondViewController.h"
#import <BFirstViewController.h>

@interface SecondViewController ()

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"Second";
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)s_buttonClick:(UIButton *)sender {
    BFirstViewController *firstVC = [[BFirstViewController alloc] init];
//    UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:firstVC];
//    [self presentViewController:navigationController animated:YES completion:nil];
    [self.navigationController pushViewController:firstVC animated:YES];
}

@end
