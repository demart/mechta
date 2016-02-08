//
//  CityService.m
//  MechtaApp
//
//  Created by Artem Demidovich on 2/5/16.
//  Copyright © 2016 Aphion Software. All rights reserved.
//

#import "CityService.h"
#import "UrlHelper.h"
#import "DataModelHelper.h"


@implementation CityService

static CityModel* cityModel;

static NSMutableArray *cities;


// Выбрать город
+ (void) selectCityModel:(CityModel*)model {
    // TODO: Persist
    cityModel = model;
}

// Возвращает выбранный город
+ (CityModel*) getSelectedCityModel {
    return cityModel;
}


+ (NSMutableArray*) getCities {
    return cities;
    
    /*
    NSMutableArray *cities = [[NSMutableArray alloc] init];
    [cities addObject:@"Астана"];
    [cities addObject:@"Алматы"];
    [cities addObject:@"Актау"];
    [cities addObject:@"Караганда"];
    [cities addObject:@"Кокшетау"];
    [cities addObject:@"Костанай"];
    [cities addObject:@"Павлодар"];
    [cities addObject:@"Петропавловск"];
    [cities addObject:@"Семей"];
    [cities addObject:@"Уральск"];
    [cities addObject:@"Усть-Каменогорск"];
    [cities addObject:@"Шымкент"];
    return cities;
     */
}


+ (CityModel*) getCityModelWithName:(NSString*)name {
    CityModel *model = [[CityModel alloc] init];
    model.name = name;
    
    return model;
}


// Загрузить города с сайта
+ (void) retrieveCities:(void (^)(ResponseWrapperModel *response))success onFailure:(void (^)(NSError *error))failure {
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:[[NSURL alloc] initWithString:[UrlHelper citiesUrl]] ];
    
    RKResponseDescriptor *responseWrapperDescriptor = [DataModelHelper buildResponseDescriptorForCities];
    
    RKObjectRequestOperation *objectRequestOperation = [[RKObjectRequestOperation alloc] initWithRequest:request responseDescriptors:@[ responseWrapperDescriptor ]];
    [objectRequestOperation setCompletionBlockWithSuccess:^(RKObjectRequestOperation *operation, RKMappingResult *mappingResult) {
        ResponseWrapperModel *response = (ResponseWrapperModel*)[mappingResult.array objectAtIndex:0];
        
        NSLog(@"Success: %i", response.success);
        NSLog(@"Data: %@", response.data);
        NSLog(@"Count: %i", response.count);
        NSLog(@"CountOfPages: %i", response.countOfPages);
        NSLog(@"CountOfProducts: %i", response.countOfProducts);
        
        if (response.success)
            cities = (NSMutableArray*)response.data;
        
        success(response);
        
    } failure:^(RKObjectRequestOperation *operation, NSError *error) {
        NSLog(@"Operation failed with error: %@", error);
        failure(error);
    }];
    
    [objectRequestOperation start];

}




@end
