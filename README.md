# Basic Key
[Server Key](https://key.getbasic.link) một sản phẩm của [GetBasic.link](https://getbasic.link/)

Tích hợp menu key được dùng để tiêm vào .IPA cho mục đích quản lý người dùng truy cập vào ứng dụng. Hỗ trợ build .dylib và .framework với [THEOS](https://theos.dev/).

Demo: https://testflight.apple.com/join/aR61BWFh 

# Installation

* Cài đặt [THEOS](https://theos.dev/) trên máy tính hoặc trên điện thoại của bạn.
* Tải Basic Key version mới nhất về tại mục [Release](https://github.com/nduykhanh/basic-key/releases) và giải nén.
* Đăng kí tài khoản tại [Basic key](https://key.getbasic.link/) và tạo package.
* Copy token của package và thay thế thông tin YOUR_TOKEN trong file [Tweak.xm](https://github.com/nduykhanh/basic-key/blob/main/Tweak.xm)
* Tuỳ chỉnh setRealUdidMode là true hoặc false tuỳ vào chế độ của package: true cho real udid và false cho fake udid
* Bên trong hàm paid có thể load thư viện bên thứ 3 như Mod Menu sau khi nhập key thành công. Không dùng giữ nguyên.
  
```c++
#import "API/BasicKey.h"
#import "Obfuscate.h"
#define timer(sec) dispatch_after(dispatch_time(DISPATCH_TIME_NOW, sec * NSEC_PER_SEC), dispatch_get_main_queue(), ^

static void didFinishLaunching(CFNotificationCenterRef center, void *observer, CFStringRef name, const void *object, CFDictionaryRef info) {
  BasicKey *API = [[BasicKey alloc] init];
  [API setToken:@"YOUR_TOKEN"]; // getbasic.linkxxxxxxxxxxx 
  [API setRealUdidMode:true];   // true: Real UDID | false: Fake UDID

  [API paid:^{
      // NSLog(@"Executing actions after login success");
      // [API showMessage:@"Basic Key" message:@"Start mod menu theos" shouldExit:NO];
  }];
}

%ctor {
  CFNotificationCenterAddObserver(CFNotificationCenterGetLocalCenter(), NULL, &didFinishLaunching, (CFStringRef)UIApplicationDidFinishLaunchingNotification, NULL, CFNotificationSuspensionBehaviorDeliverImmediately);
}

```
* Chạy lệnh để build .framwork (sử dụng Makefile hiện tại) hoặc .dylib (đổi tên file Makefile_dylib thành Makefile trước khi build)
```c++
make clean package
``` 
# ScreenShots

| Style	| Image	| Image	|
|:-------------:|:-------------:|:-------------:|
| Alert |<img src="https://github.com/user-attachments/assets/4db62396-536a-4100-8d96-fd7d159cb508" width="300"/> | <img src="https://github.com/user-attachments/assets/caef0062-ab40-45f6-bfc8-e112eaca4bc4" width="300"/> |
| Progress | <img src="https://github.com/user-attachments/assets/77e462d2-8ca8-4bcc-b1a7-dbca14981300" width="300"/> |  <img src="https://github.com/user-attachments/assets/77e462d2-8ca8-4bcc-b1a7-dbca14981300" width="300"/> |
| Menu key | <img src="https://github.com/user-attachments/assets/054fea0b-bba3-4b22-b3ad-893a81aadf3d" width="300"/> | <img src="https://github.com/user-attachments/assets/e5ac5b98-a533-4add-a72a-77758b677962" width="300"/> |





# Tác Giả BasicKey

Copyright By [Ken Nguyen](https://t.me/kennguyen02)
