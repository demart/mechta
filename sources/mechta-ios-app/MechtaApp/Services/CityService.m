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
#import "LocalStorageService.h"


@implementation CityService

static CityModel* cityModel;

static NSMutableArray *cities;

static NSMutableArray *cityShops;

static NSMutableArray *serviceCenters;

// Выбрать город
+ (void) selectCityModel:(CityModel*)model {
    // TODO: Persist
    //cityModel = model;
    
    NSData *encodedObject = [NSKeyedArchiver archivedDataWithRootObject:model];
    [LocalStorageService setSettingsKey:SELECTED_CITY_KEY withObject:encodedObject];
}

// Возвращает выбранный город
+ (CityModel*) getSelectedCityModel {
    NSData *data = (NSData*)[LocalStorageService getSettingsValueByKey:SELECTED_CITY_KEY];
    CityModel *model = (CityModel*)[NSKeyedUnarchiver unarchiveObjectWithData:data];
    return model;
    
    //return cityModel;
}


// Возвращает загруженные города и магазины
+ (NSMutableArray*) getCities {
    return cities;
}

// Возвращает загруженные города и магазины
+ (NSMutableArray*) getCityShops {
    return cityShops;
}


+ (CityModel*) getCityModelWithName:(NSString*)name {
    CityModel *model = [[CityModel alloc] init];
    model.name = name;
    
    return model;
}


// Загрузить города с сайта
+ (void) retrieveCities:(void (^)(ResponseWrapperModel *response))success onFailure:(void (^)(NSError *error))failure {
    [CityService retrieveCityShops:success onFailure:failure];
}

// загрузить магазины города
+ (void) retrieveCityShops:(void (^)(ResponseWrapperModel *response))success onFailure:(void (^)(NSError *error))failure {
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:[[NSURL alloc] initWithString:[UrlHelper cityShopsUrl]] ];
    
    RKResponseDescriptor *responseWrapperDescriptor = [DataModelHelper buildResponseDescriptorForCityShops];
    
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
        
        if (response.success)
            cityShops = (NSMutableArray*)response.data;
        
        CityModel *model = [self getSelectedCityModel];
        if (model == nil) {
            [self selectCityModel:cities[0]];
        } else {
            // Update existing city after load from Server
            for (CityModel *loadedModel in cities) {
                if (model.id == loadedModel.id) {
                    [self selectCityModel:loadedModel];
                    break;
                }
            }
        }
        
        success(response);
        
    } failure:^(RKObjectRequestOperation *operation, NSError *error) {
        NSLog(@"Operation failed with error: %@", error);
        failure(error);
    }];
    
    [objectRequestOperation start];
}


// загрузить список сервис центров
+ (void) retrieveCityServiceCenters:(void (^)(ResponseWrapperModel *response))success onFailure:(void (^)(NSError *error))failure {
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:[[NSURL alloc] initWithString:[UrlHelper cityServiceCentersUrl]] ];
    
    RKResponseDescriptor *responseWrapperDescriptor = [DataModelHelper buildResponseDescriptorForCityServiceCenters];
    
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
        
        if (response.success)
            serviceCenters = (NSMutableArray*)response.data;
        
        CityModel *model = [self getSelectedCityModel];
        if (model == nil) {
            [self selectCityModel:cities[0]];
        } else {
            // Update existing city after load from Server
            for (CityModel *loadedModel in cities) {
                if (model.id == loadedModel.id) {
                    [self selectCityModel:loadedModel];
                    break;
                }
            }
        }
        
        success(response);
        
    } failure:^(RKObjectRequestOperation *operation, NSError *error) {
        NSLog(@"Operation failed with error: %@", error);
        failure(error);
    }];
    
    [objectRequestOperation start];
}

+ (void) retrieveCityAnnouncementsWithType:(long)type withPage:(long)page inCityId:(long)cityId onSuccess:(void (^)(ResponseWrapperModel *response))success onFailure:(void (^)(NSError *error))failure {
    
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:[[NSURL alloc] initWithString:[UrlHelper announcementsUrlWithType:type andPage:page inCityId:cityId]] ];
    
    RKResponseDescriptor *responseWrapperDescriptor = [DataModelHelper buildResponseDescriptorForAnnouncements];
    
    RKObjectRequestOperation *objectRequestOperation = [[RKObjectRequestOperation alloc] initWithRequest:request responseDescriptors:@[ responseWrapperDescriptor ]];
    [objectRequestOperation setCompletionBlockWithSuccess:^(RKObjectRequestOperation *operation, RKMappingResult *mappingResult) {
        ResponseWrapperModel *response = (ResponseWrapperModel*)[mappingResult.array objectAtIndex:0];
        
        NSLog(@"Success: %i", response.success);
        NSLog(@"Data: %@", response.data);
        NSLog(@"Count: %i", response.count);
        NSLog(@"CountOfPages: %i", response.countOfPages);
        NSLog(@"CountOfProducts: %i", response.countOfProducts);
        
        success(response);
        
    } failure:^(RKObjectRequestOperation *operation, NSError *error) {
        NSLog(@"Operation failed with error: %@", error);
        failure(error);
    }];
    
    [objectRequestOperation start];
}

@end
