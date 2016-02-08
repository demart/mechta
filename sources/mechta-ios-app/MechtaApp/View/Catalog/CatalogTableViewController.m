//
//  CatalogTableViewController.m
//  MechtaApp
//
//  Created by Artem Demidovich on 2/5/16.
//  Copyright © 2016 Aphion Software. All rights reserved.
//

#import "CatalogTableViewController.h"
#import "CatalogTableViewCell.h"

#import "CitiesTableViewController.h"

#import "CityService.h"

#import "CatalogService.h"

#import "ProductsTableViewController.h"
#import "DejalActivityView.h"

@interface CatalogTableViewController ()

@property long parentCategoryId;
@property NSMutableArray *categories;

@end

@implementation CatalogTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    //self.catalogItems = [CatalogService getCategoriesWithParent:self.selectedCatalog];
}

-(void) viewWillAppear:(BOOL)animated {
    
    // Загружаем выбранный город
    CityModel *cityModel = [CityService getSelectedCityModel];
    if (cityModel == nil) {
        [self.cityChoiceButton setTitle:@"Выберите город"];
    } else {
        [self.cityChoiceButton setTitle:cityModel.name];
    }
    
    
    // Загружаем категории
    [self loadCategories];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - Loading data

-(void) loadCategories {
    NSMutableArray *categories = [CatalogService getCategoriesByParentId:self.parentCategoryId];
    if (categories != nil) {
        self.categories = categories;
        [self.tableView reloadData];
    } else {
        
        [DejalBezelActivityView activityViewForView:self.view withLabel:@"Подождите\nИдет загрузка..."];
        [CatalogService retrieveCategoriesWithParentId:self.parentCategoryId onSuccess:^(ResponseWrapperModel *response) {
            if (response.success) {
                self.categories = [CatalogService getCategoriesByParentId:self.parentCategoryId];
                [self.tableView reloadData];
                [DejalBezelActivityView removeViewAnimated:YES];
            } else {
                [DejalBezelActivityView removeViewAnimated:NO];
                // SHOW ERROR
                UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"Ошибка"
                                                                               message:@"Не удалось загрузить категории."
                                                                        preferredStyle:UIAlertControllerStyleAlert];
                UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault
                                                                      handler:^(UIAlertAction * action) {}];
                [alert addAction:defaultAction];
                [self presentViewController:alert animated:YES completion:nil];
            }
        } onFailure:^(NSError *error) {
            [DejalBezelActivityView removeViewAnimated:NO];
            // SHOW ERROR
            UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"Ошибка"
                                                                           message:@"Не удалось загрузить категории."
                                                                    preferredStyle:UIAlertControllerStyleAlert];
            UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault
                                                                  handler:^(UIAlertAction * action) {}];
            [alert addAction:defaultAction];
            [self presentViewController:alert animated:YES completion:nil];
        }];
        
    }
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (self.categories != nil)
        return [self.categories count];
    return 0;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    CatalogTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CatalogCell"];
    if (!cell) {
        [tableView registerNib:[UINib nibWithNibName:@"CatalogTableViewCell" bundle:nil]forCellReuseIdentifier:@"CatalogCell"];
        cell = [tableView dequeueReusableCellWithIdentifier:@"CatalogCell"];
    }
    
    CategoryModel *model = self.categories[indexPath.row];
    [cell.catalogNameField setText:model.name];
    
    return cell;
}


-(void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    CategoryModel *model = self.categories[indexPath.row];
    if (model.hasChildren == YES) {
        [self performSegueWithIdentifier:@"showCategorySergue" sender:self];
    } else {
        [self performSegueWithIdentifier:@"showProductsSergue" sender:self];
    }
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


-(CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 60;
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // IF CITY -> SHOW SELECTED CITY
    if ([segue.destinationViewController isKindOfClass:[CitiesTableViewController class]]) {
        // TODO
    }
    
    if ([segue.destinationViewController isKindOfClass:[ProductsTableViewController class]]) {
        //ProductsTableViewController *viewController = (ProductsTableViewController*)segue.destinationViewController;
        // NSIndexPath *indexPath = self.tableView.indexPathForSelectedRow;
        NSLog(@"Products was selected...");
    }
    
    if ([segue.destinationViewController isKindOfClass:[CatalogTableViewController class]]) {
        CatalogTableViewController *viewController = (CatalogTableViewController*)segue.destinationViewController;
        NSIndexPath *indexPath = self.tableView.indexPathForSelectedRow;
        CategoryModel *model = self.categories[indexPath.row];
        viewController.parentCategoryId = model.id;
        NSLog(@"Show children of the selected category...");
    }
    
    
}


- (IBAction)cityChoiceButtonAction:(UIBarButtonItem *)sender {
    [self performSegueWithIdentifier:@"chooseCitySergue" sender:nil];
}
@end
