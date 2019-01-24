//
//  Converter.h
//  samplerate
//
//  Created by Anders Borch on 24/01/2019.
//  Copyright © 2019 Reactify. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSUInteger, SrcType) {
    sincBest = 0,
    sincMedium = 1,
    sincFastest = 2,
    zeroOrderHold = 3,
    linear = 4
};

@interface SrcData : NSObject
@property(strong) NSData *input;
@property(strong) NSMutableData *output;
@property BOOL endOfInput;
@property double ratio;
@end

@interface Converter : NSObject

- (instancetype)initWithType:(SrcType)type;
- (int)process:(SrcData*)data;
- (void)dealloc;

@end

NS_ASSUME_NONNULL_END
