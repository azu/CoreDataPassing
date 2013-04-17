//
//  Created by azu on 12/07/27.
//


#import <Foundation/Foundation.h>


@interface CoreDataManager : NSObject

+ (CoreDataManager *)sharedManager;

- (void)saveContext;

- (NSManagedObjectContext *)managedObjectContext;

- (void)changeStoreFileName:(NSString *) storeFileName;
@end