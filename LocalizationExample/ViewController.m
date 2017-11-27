//
//  ViewController.m
//  LocalizationExample
//
//  Created by scfhao on 2017/11/27.
//  Copyright © 2017年 scfhao. All rights reserved.
//

#import "ViewController.h"
#import "SOLocalization.h"

@interface ViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UILabel *label;
@property (weak, nonatomic) IBOutlet UIButton *button;
@property (weak, nonatomic) IBOutlet UITextField *textField;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    UIBarButtonItem *change = [[UIBarButtonItem alloc]initWithTitle:@"" style:UIBarButtonItemStylePlain target:self action:@selector(changeLanguage:)];
    change.sol_title = @"Setting";
    self.navigationItem.rightBarButtonItem = change;
    
    self.label.sol_text = @"label";
    [self.button sol_setTitle:@"button" forState:UIControlStateNormal];
    
    self.textField.sol_placeholder = @"textField placeholder";
    
    self.navigationItem.sol_title = @"title";
}

- (void)changeLanguage:(UIBarButtonItem *)sender {
    [self performSegueWithIdentifier:@"push" sender:sender];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    cell.textLabel.sol_text = @"cell label";
    return cell;
}

@end
