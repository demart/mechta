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

@interface CatalogTableViewController ()

@property NSString *selectedCatalog;
@property NSMutableArray *catalogItems;

@end

@implementation CatalogTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    self.catalogItems = [CatalogService getCategoriesWithParent:self.selectedCatalog];
}

-(void) viewWillAppear:(BOOL)animated {
    [self.cityChoiceButton setTitle:[CityService getSelectedCity]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.catalogItems count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    CatalogTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CatalogCell"];
    if (!cell) {
        [tableView registerNib:[UINib nibWithNibName:@"CatalogTableViewCell" bundle:nil]forCellReuseIdentifier:@"CatalogCell"];
        cell = [tableView dequeueReusableCellWithIdentifier:@"CatalogCell"];
    }
    
    CategoryModel *model = self.catalogItems[indexPath.row];
    [cell.catalogNameField setText:model.name];
    
    return cell;
}


-(void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    CategoryModel *model = self.catalogItems[indexPath.row];
    
    if (model.hasChildren == YES) {
        
        [self performSegueWithIdentifier:@"showCategorySergue" sender:self];
        
        //CatalogTableViewController *subCatalog = [[CatalogTableViewController alloc] init];
        //[subCatalog setSelectedCatalog: model.name];
        //[self.navigationController pushViewController:subCatalog animated:YES];
        
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
        //CitiesTableViewController *viewController = (CitiesTableViewController*)segue.destinationViewController;
        
       // NSIndexPath *indexPath = self.tableView.indexPathForSelectedRow;
        NSLog(@"Cities was selected...");
    }
    
    if ([segue.destinationViewController isKindOfClass:[ProductsTableViewController class]]) {
        //ProductsTableViewController *viewController = (ProductsTableViewController*)segue.destinationViewController;
        // NSIndexPath *indexPath = self.tableView.indexPathForSelectedRow;
        NSLog(@"Products was selected...");
    }
    
    if ([segue.destinationViewController isKindOfClass:[CatalogTableViewController class]]) {
        CatalogTableViewController *viewController = (CatalogTableViewController*)segue.destinationViewController;
        NSIndexPath *indexPath = self.tableView.indexPathForSelectedRow;
        CategoryModel *model = self.catalogItems[indexPath.row];
        viewController.selectedCatalog = model.name;
        NSLog(@"Products was selected...");
    }
    
    
}


- (IBAction)cityChoiceButtonAction:(UIBarButtonItem *)sender {
    [self performSegueWithIdentifier:@"chooseCitySergue" sender:nil];
}
@end
