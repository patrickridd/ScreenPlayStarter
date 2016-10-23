//
//  Character.h
//  Screenplay Starter
//
//  Created by Patrick Ridd on 10/22/16.
//  Copyright © 2016 PatrickRidd. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@interface Character : NSManagedObject

@property (nonatomic,strong) NSMutableString *name;
@property (nonatomic, strong) NSMutableString *basicDescription;


@end
