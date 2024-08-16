//
//  BasicKey.h
//  BasicKey
//
//  Created by Ken on 15/8/24.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface BasicKey : NSObject

// REAL UDID
- (void) initRealUDID;
- (void) checkKeyForRealUDID:(NSString *)key;
- (void) showGetUdid:(NSString *)randomNumber;
- (void) handleRealUDID:(NSString *)randomNumber;
- (void) checkKeyWithComplete:(void (^)(void))completion;

// FAKE UDID
- (void) initFakeUDID;
- (void) checkKey:(NSString *)key;

// COMMON
- (void) setToken:(NSString *)token;
- (void) setRealUdidMode:(BOOL)isRealUDID;
- (void) paid:(void (^)(void))completion;
- (void) showMessage:(NSString *)title message:(NSString *)message shouldExit:(BOOL)shouldExit;
- (void) showMenuKey;
- (UIViewController *)topMostViewController;
@end

NS_ASSUME_NONNULL_END
