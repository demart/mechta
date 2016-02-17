//
//  LocalStorageService.h
//  MechtaApp
//
//  Created by Artem Demidovich on 2/8/16.
//  Copyright © 2016 Aphion Software. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

// Ключ для хранения токена авторизации
static NSString* AUTH_TOKEN = @"settings.auth.token";

// Ключ для хранения логина пользователя
static NSString* AUTH_LOGIN = @"settings.auth.login";

// Ключ для хранения токена для получения PUSH
static NSString* PUSH_TOKEN = @"settings.push.token";

// Ключ для хранения токена выбранного города
static NSString* SELECTED_CITY_KEY = @"settings.selected.city";


@interface LocalStorageService : NSObject


// Сохраняет параметр в локальных настройках приложениния
+(void) setSettingsKey:(NSString*)key withObject:(NSObject*) value;

// Возвращает сохраненное значение в локальных настройках приложения
+(NSObject*) getSettingsValueByKey:(NSString*)key;


// Сохраняет картинки в локальном хранилище
+(void)saveImageToLocalCache:(NSString *)imageName withData:(UIImage*)uiImage;

// Достает картинки из локального хранилища
+(NSData *)loadImageFromLocalCache:(NSString *)imageName;



@end
