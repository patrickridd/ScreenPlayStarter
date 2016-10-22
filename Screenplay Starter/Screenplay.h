//
//  Screenplay.h
//  Screenplay Starter
//
//  Created by Patrick Ridd on 10/22/16.
//  Copyright © 2016 PatrickRidd. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Screenplay : NSObject

@property (nonatomic, copy) NSMutableString *title;
@property (nonatomic, copy) NSMutableString *description;

@property (nonatomic,copy) NSMutableArray *characters;



@end
