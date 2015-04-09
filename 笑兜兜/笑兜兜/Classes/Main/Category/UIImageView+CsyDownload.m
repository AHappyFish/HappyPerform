//
//  UIImageView+CsyDownload.m
//  Qiubai
//
//  Created by csy on 8/1/14.
//  Copyright (c) 2014 Csy. All rights reserved.
//

#import "UIImageView+CsyDownload.h"
#import "UIImageView+WebCache.h"

@implementation UIImageView (CsyDownload)

- (void)setImageWithURLString:(NSString *)urlString placeholderImage:(UIImage *)placeholder
{
    NSURL *url = [NSURL URLWithString:urlString];
    
    [self sd_setImageWithURL:url placeholderImage:placeholder];
    
}

@end
