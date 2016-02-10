//
//  ProductDetailTableViewController.m
//  MechtaApp
//
//  Created by Artem Demidovich on 2/5/16.
//  Copyright © 2016 Aphion Software. All rights reserved.
//

#import "ProductDetailTableViewController.h"
#import "ProductImageTableViewCell.h"

#import "Constants.h"
#import "ProductService.h"
#import "DejalActivityView.h"

#import "CityService.h"
#import "LocalStorageService.h"

#import "ProductSwitcherTableViewCell.h"
#import "ProductAvailableTableViewCell.h"
#import "ProductDescriptionTableViewCell.h"
#import "ProductCharacteristicGroupTableViewCell.h"
#import "ProductCharacteristicTableViewCell.h"
#import "ProductBasketTableViewCell.h"

#import "ShopDetailTableViewController.h"


/* Режим просмотра доступен где-то */
static int MODE_AVAILABILITY = 0;

/* Режим просмотра описания */
static int MODE_DESCRIPTION = 1;

/* Режим просмотра характеристик */
static int MODE_CHARACTERISTICS = 2;

static int STATIC_ROW_COUNT = 3;


@interface ProductDetailTableViewController ()

@property ProductModel *product;
@property int mode;

@property NSMutableDictionary *loadImageOperations;
@property NSOperationQueue *loadImageOperationQueue;

@end

@implementation ProductDetailTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.separatorColor = [UIColor clearColor];
    self.tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    
    self.loadImageOperationQueue = [[NSOperationQueue alloc] init];
    [self.loadImageOperationQueue setMaxConcurrentOperationCount:5];
    
    self.mode = MODE_AVAILABILITY;
    
    [DejalBezelActivityView activityViewForView:self.view withLabel:@"Подождите\nИдет загрузка..."];
    [self loadProduct];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


#pragma mark - Data loading


- (void) loadProduct {
    if (self.product == nil) {
        // TODO SHOW ERROR
        return;
    }
    
    CityModel *cityModel = [CityService getSelectedCityModel];
    
    [ProductService retrieveProductDetailWithId:self.product.numberOnSite inCategory:self.product.numberOnSiteCategory inCityId:cityModel.id onSuccess:^(ResponseWrapperModel *response) {
        if (response.success) {
            ProductModel *product = (ProductModel*)response.data;
            if (product != nil) {
                self.product = product;
                [self.tableView reloadData];
                [DejalBezelActivityView removeViewAnimated:YES];
            } else {
                [DejalBezelActivityView removeViewAnimated:NO];
                UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"Ошибка"
                                                                               message:@"Не удалось загрузить информацию о товаре."
                                                                        preferredStyle:UIAlertControllerStyleAlert];
                UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault
                                                                      handler:^(UIAlertAction * action) {}];
                [alert addAction:defaultAction];
                [self presentViewController:alert animated:YES completion:nil];
            }
            
        }
    } onFailure:^(NSError *error) {
        [DejalBezelActivityView removeViewAnimated:NO];
        UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"Ошибка"
                                                                       message:@"Не удалось загрузить  информацию о товаре."
                                                                preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault
                                                              handler:^(UIAlertAction * action) {}];
        [alert addAction:defaultAction];
        [self presentViewController:alert animated:YES completion:nil];
    }];
}


- (void) modeWasChanged:(UISegmentedControl*) segmentControl {
    self.mode = segmentControl.selectedSegmentIndex;
    [self.tableView reloadData];
}


- (void) setProductModel:(ProductModel*)model {
    self.product = model;
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (self.mode == MODE_AVAILABILITY) {
        if (self.product != nil && self.product.productAvailability != nil) {
            return STATIC_ROW_COUNT + [self.product.productAvailability count];
        } else {
            return STATIC_ROW_COUNT + 1; // Empty PRODUCT IS UNAVAILABLE
        }
    }
    
    if (self.mode == MODE_DESCRIPTION) {
            return STATIC_ROW_COUNT + 1; // Empty PRODUCT DESCRIPTION
    }

    if (self.mode == MODE_CHARACTERISTICS) {
        if (self.product != nil && self.product.characteristics != nil) {
            return STATIC_ROW_COUNT + [[self.product getCharacteristicsList] count];
        } else {
            return STATIC_ROW_COUNT; // Empty PRODUCT DESCRIPTION
        }
    }
    
    return STATIC_ROW_COUNT;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0) {
        ProductImageTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ProductImageCell"];
        if (!cell) {
            [tableView registerNib:[UINib nibWithNibName:@"ProductImageTableViewCell" bundle:nil]forCellReuseIdentifier:@"ProductImageCell"];
            cell = [tableView dequeueReusableCellWithIdentifier:@"ProductImageCell"];
        }
        
        [cell.productImagesPageControl setNumberOfPages: [[self.product distinctImageUrls] count]];
        [cell.productImagesScrollView sizeToFit];
        
        cell.productImagesScrollView.contentSize = CGSizeMake((self.tableView.frame.size.width) * (self.product.distinctImageUrls.count),cell.productImagesScrollView.frame.size.height);
        
        for (int i=0; i < [self.product distinctImageUrls].count; i++) {
            [cell loadPhoto:[self.product distinctImageUrls][i] position:i withFrame:self.tableView.frame  withOperations:self.loadImageOperations withOperationQueue:self.loadImageOperationQueue];
        }
        
        return cell;
    }
    
    
    if (indexPath.row == 1) {
        ProductBasketTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ProductBasketCell"];
        if (!cell) {
            [tableView registerNib:[UINib nibWithNibName:@"ProductBasketTableViewCell" bundle:nil]forCellReuseIdentifier:@"ProductBasketCell"];
            cell = [tableView dequeueReusableCellWithIdentifier:@"ProductBasketCell"];
        }
        [cell.productNameField setText:self.product.name];
        
        if (self.product.productAvailability != nil && [self.product.productAvailability count] > 0) {
            [cell.productPriceField setTextColor:[Constants SYSTEM_COLOR_PURPLE]];
            [cell.productPriceField setText:[[NSString alloc] initWithFormat:@"%@ тг.", [self.product formattedCost]]];
            
            [cell.addProductButton setEnabled:YES];
            [cell.addProductButton setBackgroundColor:[Constants SYSTEM_COLOR_PURPLE]];
        } else {
            [cell.productPriceField setTextColor:[UIColor grayColor]];
            [cell.productPriceField setText:@"Нет в наличии"];
            
            [cell.addProductButton setEnabled:NO];
            [cell.addProductButton setBackgroundColor:[UIColor grayColor]];
        }
        
        return cell;
    }
    
    if (indexPath.row == 2) {
        ProductSwitcherTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ProductSwitcherCell"];
        if (!cell) {
            [tableView registerNib:[UINib nibWithNibName:@"ProductSwitcherTableViewCell" bundle:nil]forCellReuseIdentifier:@"ProductSwitcherCell"];
            cell = [tableView dequeueReusableCellWithIdentifier:@"ProductSwitcherCell"];
        }
        
        cell.parentController = self;
        
        return cell;
    }
    
    
    // Доступно в магазинах
    if (self.mode == MODE_AVAILABILITY) {
        ProductAvailableInShopModel *availableInShop = [self.product productAvailability][indexPath.row - STATIC_ROW_COUNT];
     
        ProductAvailableTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ProductAvailableCell"];
        if (!cell) {
            [tableView registerNib:[UINib nibWithNibName:@"ProductAvailableTableViewCell" bundle:nil]forCellReuseIdentifier:@"ProductAvailableCell"];
            cell = [tableView dequeueReusableCellWithIdentifier:@"ProductAvailableCell"];
        }
        
        if (availableInShop.shop != nil) {
            [cell.shopNameField setText:availableInShop.shop.name];
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        } else {
            [cell.shopNameField setText:availableInShop.name];
            cell.accessoryType = UITableViewCellAccessoryNone;
        }
        [cell.shopAmountField setText:availableInShop.amount];

        
        return cell;
    }

    // Описание
    if (self.mode == MODE_DESCRIPTION) {
        
        ProductDescriptionTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ProductDescriptionCell"];
        if (!cell) {
            [tableView registerNib:[UINib nibWithNibName:@"ProductDescriptionTableViewCell" bundle:nil]forCellReuseIdentifier:@"ProductDescriptionCell"];
            cell = [tableView dequeueReusableCellWithIdentifier:@"ProductDescriptionCell"];
        }
        
        if (self.product.content != nil) {
            UIFont *font = [UIFont  systemFontOfSize:13.0];
            NSString* content = [NSString stringWithFormat:@"<html><style>body{font-family: '%@'; font-size:%fpx;}</style><body>%@</body></html>",
                                 [font fontName],
                                 13.0,
                                 self.product.content];
            
            NSAttributedString * attrStr = [[NSAttributedString alloc] initWithData:[content dataUsingEncoding:NSUnicodeStringEncoding] options:@{ NSDocumentTypeDocumentAttribute: NSHTMLTextDocumentType } documentAttributes:nil error:nil];
            [cell.productDescriptionField setAttributedText:attrStr];
        } else {
            [cell.productDescriptionField setText:@""];
        }
        
        
        
        return cell;
        
    }
    
    // Характеристики
    if (self.mode == MODE_CHARACTERISTICS) {
        NSMutableArray *array = [self.product getCharacteristicsList];
        NSInteger arrayIndex = indexPath.row - STATIC_ROW_COUNT;
        NSObject *characteristic = array[arrayIndex];
        
        if ([characteristic isKindOfClass:[ProductCharacteristicGroupModel class]]) {
            /// Group
            ProductCharacteristicGroupTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ProductCharacteristicGroupCell"];
            if (!cell) {
                [tableView registerNib:[UINib nibWithNibName:@"ProductCharacteristicGroupTableViewCell" bundle:nil]forCellReuseIdentifier:@"ProductCharacteristicGroupCell"];
                cell = [tableView dequeueReusableCellWithIdentifier:@"ProductCharacteristicGroupCell"];
            }
            
            ProductCharacteristicGroupModel *model = (ProductCharacteristicGroupModel*)characteristic;
            [cell.characteristicNameField setText:model.name];
            
            return cell;
        }

        if ([characteristic isKindOfClass:[ProductCharacteristicModel class]]) {
            /// KeyValue
            ProductCharacteristicTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ProductCharacteristicCell"];
            if (!cell) {
                [tableView registerNib:[UINib nibWithNibName:@"ProductCharacteristicTableViewCell" bundle:nil]forCellReuseIdentifier:@"ProductCharacteristicCell"];
                cell = [tableView dequeueReusableCellWithIdentifier:@"ProductCharacteristicCell"];
            }
            
            ProductCharacteristicModel *model = (ProductCharacteristicModel*)characteristic;
            [cell.characteristicKeyField setText:model.key];
            [cell.characteristicValueField setText:model.value];
            
            return cell;
        }
        
        return nil;
    }
    
    return nil;
}

-(void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (self.mode == MODE_AVAILABILITY && indexPath.row >= STATIC_ROW_COUNT) {
        if (self.product.productAvailability == nil || [self.product.productAvailability count] < 1)
            return;
        
        ProductAvailableInShopModel *model = self.product.productAvailability[indexPath.row - STATIC_ROW_COUNT];
        if (model != nil && model.shop != nil) {
            [self performSegueWithIdentifier:@"showShopDetailSergue" sender:self];
        } else {
            // SHOW SORRY MESSAGE
        }
    }
}

- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    // Photo
    if (indexPath.row == 0) {
        return 220;
    }
    

    if (indexPath.row == 1) {
        return 100;
    }

    // Switcher
    if (indexPath.row == 2) {
        return 50;
    }
    
    if (self.mode == MODE_DESCRIPTION) {
        UIFont *font = [UIFont  systemFontOfSize:14.0];
        NSString* content = [NSString stringWithFormat:@"<html><style>body{font-family: '%@'; font-size:%fpx;}</style><body>%@</body></html>",
                             [font fontName],
                             14.0,
                             self.product.content];
        
        NSAttributedString * attrStr = [[NSAttributedString alloc] initWithData:[content dataUsingEncoding:NSUnicodeStringEncoding] options:@{ NSDocumentTypeDocumentAttribute: NSHTMLTextDocumentType } documentAttributes:nil error:nil];
        
        CGFloat width = self.tableView.frame.size.width - 24; // whatever your desired width is
        CGRect rect = [attrStr boundingRectWithSize:CGSizeMake(width, 10000) options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading context:nil];
        
        CGSize labelHeighSizeKey = rect.size;
        
        return labelHeighSizeKey.height;
    }
    
    if (self.mode == MODE_AVAILABILITY) {
        return 35;
    }

    if (self.mode == MODE_CHARACTERISTICS) {
        CGSize maximumSize = CGSizeMake((self.tableView.frame.size.width-26)/2, 10000);
        NSObject *object = [self.product getCharacteristicsList][indexPath.row - STATIC_ROW_COUNT];
        if ([object isKindOfClass:[ProductCharacteristicModel class]]) {
        
        CGSize labelHeighSizeKey = [((ProductCharacteristicModel*)object).key sizeWithFont: [UIFont fontWithName:@"Helvetica" size:14.0f]
                                                            constrainedToSize:maximumSize
                                                                lineBreakMode:UILineBreakModeWordWrap];
        CGSize labelHeighSizeValue = [((ProductCharacteristicModel*)object).value sizeWithFont: [UIFont fontWithName:@"Helvetica" size:14.0f]
                                                                            constrainedToSize:maximumSize
                                                                                lineBreakMode:UILineBreakModeWordWrap];
            
            if (labelHeighSizeKey.height > labelHeighSizeValue.height) {
                return labelHeighSizeKey.height+8;
            } else {
                return labelHeighSizeValue.height+8;
            }
        }
        return 35;
        
    }
    
    return 44;
}



#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.destinationViewController isKindOfClass:[ShopDetailTableViewController class]]) {
        ShopDetailTableViewController *viewController = (ShopDetailTableViewController*)segue.destinationViewController;
        NSIndexPath *indexPath = self.tableView.indexPathForSelectedRow;
        ProductAvailableInShopModel *model = self.product.productAvailability[indexPath.row - STATIC_ROW_COUNT];
        [viewController setSelectedShopModel:model.shop];
    }
}

@end
