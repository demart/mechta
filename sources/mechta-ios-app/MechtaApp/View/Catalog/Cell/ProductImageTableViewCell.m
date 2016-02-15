//
//  ProductImageTableViewCell.m
//  MechtaApp
//
//  Created by Artem Demidovich on 2/9/16.
//  Copyright © 2016 Aphion Software. All rights reserved.
//

#import "ProductImageTableViewCell.h"
#import "LocalStorageService.h"

@implementation ProductImageTableViewCell

- (void)awakeFromNib {
    self.productImagesScrollView.delegate = self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

-(void) loadPhoto:(NSString*) imageUrl position:(NSInteger) offset withFrame:(CGRect) frame  withOperations:(NSMutableDictionary*)loadImageOperations withOperationQueue:(NSOperationQueue*)loadImageOperationQueue {
    UIImage *loadedImage =(UIImage *)[LocalStorageService  loadImageFromLocalCache:imageUrl];
    if (loadedImage != nil) {
        [self buildImageFrame:loadedImage position:offset withFrame:frame];
    } else {
        NSBlockOperation *loadImageOperation = [[NSBlockOperation alloc] init];
        __weak NSBlockOperation *weakOperation = loadImageOperation;
        [loadImageOperation addExecutionBlock:^(void){
            UIImage *image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:imageUrl]]];
            [[NSOperationQueue mainQueue] addOperationWithBlock:^(void) {
                if (! weakOperation.isCancelled) {
                    [self buildImageFrame:image position:offset withFrame:frame];
                    [LocalStorageService  saveImageToLocalCache:imageUrl withData:image];
                    [loadImageOperations removeObjectForKey:imageUrl];
                }
            }];
        }];
        
        [loadImageOperations setObject: loadImageOperation forKey:imageUrl];
        if (loadImageOperation) {
            [loadImageOperationQueue addOperation:loadImageOperation];
        }
    }
}


static NSInteger ImageWidth = 304;
static NSInteger ImageHeigth = 155;

-(void) buildImageFrame:(UIImage*) image position:(NSInteger) offset withFrame:(CGRect) frame {
    CGRect imageFrame;
    imageFrame.origin.x = (frame.size.width - 16) * offset;
//    imageFrame.origin.x = self.productImagesScrollView.frame.size.width * offset;
    imageFrame.origin.y = 0;
    imageFrame.size.width = frame.size.width;
//    imageFrame.size.width = self.productImagesScrollView.frame.size.width;
//    imageFrame.size.height = self.productImagesScrollView.frame.size.height;
    imageFrame.size.height = self.frame.size.height-16;
    //imageFrame.size.height = frame.size.width / ImageWidth * ImageHeigth;
    
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:imageFrame];
    imageView.image = image;
    imageView.tag = offset;
    [imageView setContentMode:UIViewContentModeScaleAspectFit];
    
    /*
    UITapGestureRecognizer *restaurantImageTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tappedRestaurantImage:)];
    [restaurantImageTap setNumberOfTouchesRequired:1];
    [imageView setUserInteractionEnabled:YES];
    [imageView addGestureRecognizer:restaurantImageTap];
    */
    
    [self.productImagesScrollView addSubview:imageView];
}


- (void)scrollViewDidScroll:(UIScrollView *)sender {
    CGFloat pageWidth = self.productImagesScrollView.frame.size.width;
    int page = floor((self.productImagesScrollView.contentOffset.x - pageWidth / 2) / pageWidth) + 1;
    self.productImagesPageControl.currentPage = page;
}

@end
