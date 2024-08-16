#import "API/BasicKey.h"
#import "Obfuscate.h"
#define timer(sec) dispatch_after(dispatch_time(DISPATCH_TIME_NOW, sec * NSEC_PER_SEC), dispatch_get_main_queue(), ^

static void didFinishLaunching(CFNotificationCenterRef center, void *observer, CFStringRef name, const void *object, CFDictionaryRef info) {
  BasicKey *API = [[BasicKey alloc] init];
  [API setToken:@"getbasic.link-3063f69d71bb12897b997"];
  [API setRealUdidMode:true];

  [API paid:^{
      // NSLog(@"Executing actions after login success");
      [API showMessage:@"Basic Key" message:@"Start mod menu theos" shouldExit:NO];
  }];
}

%ctor {
  CFNotificationCenterAddObserver(CFNotificationCenterGetLocalCenter(), NULL, &didFinishLaunching, (CFStringRef)UIApplicationDidFinishLaunchingNotification, NULL, CFNotificationSuspensionBehaviorDeliverImmediately);
}
