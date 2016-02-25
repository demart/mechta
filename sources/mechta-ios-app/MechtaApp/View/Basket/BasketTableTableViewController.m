//
//  BasketTableTableViewController.m
//  MechtaApp
//
//  Created by Artem Demidovich on 2/24/16.
//  Copyright © 2016 Aphion Software. All rights reserved.
//

#import "BasketTableTableViewController.h"
#import "Constants.h"

@interface BasketTableTableViewController ()

@end

@implementation BasketTableTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    self.tableView.separatorColor = [UIColor clearColor];
    [self showEmptySearchResultView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


- (void) showEmptySearchResultView {
    UIView *messageContainer = [[UIView alloc] initWithFrame:CGRectMake(0, 0,
                                                                        self.tableView.bounds.size.width,
                                                                        self.tableView.bounds.size.height)];
    UILabel *messageLbl = [[UILabel alloc] initWithFrame:CGRectMake(self.tableView.bounds.size.width*0.1, self.tableView.bounds.size.height*.4,
                                                                    self.tableView.bounds.size.width*0.8,
                                                                    self.tableView.bounds.size.height)];
    messageLbl.numberOfLines = 0;
    NSString *text = @"Корзина не реализована в прототипе.";
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    paragraphStyle.alignment = NSTextAlignmentCenter;
    NSDictionary *attributes = @{NSFontAttributeName: [UIFont systemFontOfSize:15.f],
                                 NSBaselineOffsetAttributeName: @0,
                                 NSParagraphStyleAttributeName: paragraphStyle};
    NSAttributedString *attributedText = [[NSAttributedString alloc] initWithString:text
                                                                         attributes:attributes];
    messageLbl.attributedText = attributedText;
    messageLbl.textColor = [Constants SYSTEM_COLOR_DARK_GREY];
    [messageLbl sizeToFit];
    [messageContainer addSubview:messageLbl];
    [messageContainer sizeToFit];
    self.tableView.backgroundView = messageContainer;
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 0;
}

/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
