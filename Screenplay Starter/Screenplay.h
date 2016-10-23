//
//  Screenplay.h
//  Screenplay Starter
//
//  Created by Patrick Ridd on 10/22/16.
//  Copyright © 2016 PatrickRidd. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <CoreData/CoreData.h>

@interface Screenplay : NSManagedObject

@property (nonatomic, strong) NSMutableString *title;
@property (nonatomic, strong) NSMutableString *description;

@property (nonatomic,strong) NSMutableArray *characters;
@property (nonatomic,strong) NSMutableArray *scenes;

@end

