//
//  ExtraTableViewController.m
//  MechtaApp
//
//  Created by Artem Demidovich on 2/8/16.
//  Copyright © 2016 Aphion Software. All rights reserved.
//

#import "ExtraTableViewController.h"
#import "ExtraHeaderTableViewCell.h"
#import "ExtraMenuItemTableViewCell.h"
#import "Constants.h"
#import "ShopsViewController.h"
#import "AnnouncementsTableViewController.h"

@interface ExtraTableViewController ()

@end

@implementation ExtraTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //self.tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    //[self.tableView setSeparatorInset:UIEdgeInsetsZero];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0) {
        return 5;
    }
    
    if (section == 1) {
        return 11;
    }
    
    return 0;
}


- (UIView*) tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    ExtraHeaderTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ExtraHeaderCell"];
    if (!cell) {
        [tableView registerNib:[UINib nibWithNibName:@"ExtraHeaderTableViewCell" bundle:nil]forCellReuseIdentifier:@"ExtraHeaderCell"];
        cell = [tableView dequeueReusableCellWithIdentifier:@"ExtraHeaderCell"];
    }
    
    if (section == 0) {
        [cell.headerTitle setText:@"Компания"];
    }
    
    if (section == 1) {
        [cell.headerTitle setText:@"Как купить?"];
    }
    return cell;
}

-(CGFloat) tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 44;
}




- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ExtraMenuItemTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ExtraMenuItemCell"];
    if (!cell) {
        [tableView registerNib:[UINib nibWithNibName:@"ExtraMenuItemTableViewCell" bundle:nil]forCellReuseIdentifier:@"ExtraMenuItemCell"];
        cell = [tableView dequeueReusableCellWithIdentifier:@"ExtraMenuItemCell"];
    }

    [cell.menuItemTitle setTextColor:[Constants SYSTEM_COLOR_LIGHT_GREY]];
    if (indexPath.section == 0) {
        
        if (indexPath.row == 0) {
            [cell.menuItemTitle setText:@"О компании"];
        }
        
        if (indexPath.row == 1) {
            [cell.menuItemTitle setText:@"Наши магазины"];
            [cell.menuItemTitle setTextColor:[UIColor darkGrayColor]];
        }

        if (indexPath.row == 2) {
            [cell.menuItemTitle setText:@"Сервис центры"];
            [cell.menuItemTitle setTextColor:[UIColor darkGrayColor]];
        }

        if (indexPath.row == 3) {
            [cell.menuItemTitle setText:@"Акции"];
            [cell.menuItemTitle setTextColor:[UIColor darkGrayColor]];
        }

        if (indexPath.row == 4) {
            [cell.menuItemTitle setText:@"Новости"];
            [cell.menuItemTitle setTextColor:[UIColor darkGrayColor]];
        }
    }
    
    if (indexPath.section == 1) {
        
        if (indexPath.row == 0) {
            [cell.menuItemTitle setText:@"Начальные условия"];
        }
        
        if (indexPath.row == 1) {
            [cell.menuItemTitle setText:@"Доставка"];
        }
        
        if (indexPath.row == 2) {
            [cell.menuItemTitle setText:@"Оплата"];
        }
        
        if (indexPath.row == 3) {
            [cell.menuItemTitle setText:@"Обмен и возврат товара"];
        }
        
        if (indexPath.row == 4) {
            [cell.menuItemTitle setText:@"Возврат денег"];
        }
        
        if (indexPath.row == 5) {
            [cell.menuItemTitle setText:@"Оптовым и корпоративным покупателям"];
        }
        
        if (indexPath.row == 6) {
            [cell.menuItemTitle setText:@"Товары на заказ"];
        }
        
        if (indexPath.row == 7) {
            [cell.menuItemTitle setText:@"Подарочные сертификаты"];
        }
        
        if (indexPath.row == 8) {
            [cell.menuItemTitle setText:@"Подарочные карты"];
        }
        
        if (indexPath.row == 9) {
            [cell.menuItemTitle setText:@"Мечта Мобайл Сервис"];
        }
        
        if (indexPath.row == 10) {
            [cell.menuItemTitle setText:@"Бонус-карта"];
        }
        
    }
    
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0 && indexPath.row == 1) {
        [self performSegueWithIdentifier:@"showShopsSergue" sender:self];
    }
    if (indexPath.section == 0 && indexPath.row == 2) {
        [self performSegueWithIdentifier:@"showServiceCentersSergue" sender:self];
    }
    if (indexPath.section == 0 && indexPath.row == 3) {
        [self performSegueWithIdentifier:@"showAnnouncementsSergue" sender:self];
    }
    if (indexPath.section == 0 && indexPath.row == 4) {
        [self performSegueWithIdentifier:@"showAnnouncementsSergue" sender:self];
    }
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if ([[segue destinationViewController] isKindOfClass:[AnnouncementsTableViewController class]]) {
        NSIndexPath *indexPath = self.tableView.indexPathForSelectedRow;
        AnnouncementsTableViewController *viewController = [segue destinationViewController];
        if (indexPath.section == 0) {
            if (indexPath.row == 3) {
                [viewController setAnnouncementMode:ANNOUNCEMENT_MODE_ACTIONS];
            }
        
            if (indexPath.row == 4) {
                [viewController setAnnouncementMode:ANNOUNCEMENT_MODE_NEWS];
            }
        }
    }
}


@end
