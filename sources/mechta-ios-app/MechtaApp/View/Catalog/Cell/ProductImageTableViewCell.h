//
//  ProductImageTableViewCell.h
//  MechtaApp
//
//  Created by Artem Demidovich on 2/9/16.
//  Copyright © 2016 Aphion Software. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ProductImageTableViewCell : UITableViewCell<UIScrollViewDelegate>

@property (weak, nonatomic) IBOutlet UIScrollView *productImagesScrollView;
@property (weak, nonatomic) IBOutlet UIPageControl *productImagesPageControl;

-(void) loadPhoto:(NSString*) imageUrl position:(NSInteger) offset withFrame:(CGRect) frame withOperations:(NSMutableDictionary*)loadImageOperations withOperationQueue:(NSOperationQueue*)loadImageOperationQueue;

@end
