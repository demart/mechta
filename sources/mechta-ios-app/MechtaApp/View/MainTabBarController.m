//
//  MainTabBarController.m
//  MechtaApp
//
//  Created by Artem Demidovich on 2/17/16.
//  Copyright © 2016 Aphion Software. All rights reserved.
//

#import "MainTabBarController.h"
#import "CityService.h"

@interface MainTabBarController ()

@end

@implementation MainTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}


- (void) viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    CityModel *model = [CityService getSelectedCityModel];
    if (model == nil && self.selectedIndex == 0) {
        [((UINavigationController*)self.selectedViewController).topViewController performSegueWithIdentifier:@"chooseCitySergue" sender:((UINavigationController*)self.selectedViewController).topViewController];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
