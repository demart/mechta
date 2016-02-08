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

@interface ExtraTableViewController ()

@end

@implementation ExtraTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
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
    
    if (indexPath.section == 0) {
        
        if (indexPath.row == 0) {
            [cell.menuItemTitle setText:@"О компании"];
        }
        
        if (indexPath.row == 1) {
            [cell.menuItemTitle setText:@"Наши магазины"];
        }

        if (indexPath.row == 2) {
            [cell.menuItemTitle setText:@"Сервис центры"];
        }

        if (indexPath.row == 3) {
            [cell.menuItemTitle setText:@"Акции"];
        }

        if (indexPath.row == 4) {
            [cell.menuItemTitle setText:@"Новости"];
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



/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
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
