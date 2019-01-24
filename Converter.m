//
//  Converter.m
//  samplerate
//
//  Created by Anders Borch on 24/01/2019.
//  Copyright © 2019 Reactify. All rights reserved.
//

#import "Converter.h"
#import "samplerate.h"

@implementation SrcData
@end

@interface Converter ()

@property SRC_STATE* state;

@end

@implementation Converter

@synthesize state;
    
- (instancetype)initWithType: (SrcType)type {
    int error = 0;
    SRC_STATE* state = src_new(type, 1, &error);
    if (error) return nil;
    self = [super init];
    self.state = state;
    return self;
}

- (int)process:(SrcData*)data {
    if (data.output.length < data.input.length * data.ratio + sizeof(float)) {
        data.output.length = data.input.length * data.ratio + sizeof(float);
    }
    
    SRC_DATA src_data;
    src_data.data_in = data.input.bytes;
    src_data.input_frames = data.input.length / sizeof(float);
    src_data.data_out = data.output.mutableBytes;
    src_data.output_frames = data.output.length / sizeof(float);
    src_data.end_of_input = data.endOfInput;
    src_data.src_ratio = data.ratio;
    
    return src_process(self.state, &src_data);
}

- (void)dealloc {
    src_delete(self.state);
}

@end
