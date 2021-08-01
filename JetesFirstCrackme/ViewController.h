//
//  ViewController.h
//  JetesFirstCrackme
//
//  Created by Kim David Hauser on 24.07.21.
//

#import <Cocoa/Cocoa.h>
#import "Foundation/NSString.h"

@interface ViewController : NSViewController

    @property (nonatomic, weak) IBOutlet NSButton *btnCheck;
    @property (nonatomic, weak) IBOutlet NSTextField *lblResult;
    @property (nonatomic, weak) IBOutlet NSTextView *txtLicense;
    @property (nonatomic, weak) IBOutlet NSTextField *txtName;
    
- (void)logMsg2Output: (NSString*)msg;
+ (NSString*)encodeStringTo64:(NSString*)fromString;
+ (NSString *) stringToHex:(NSString *)str;
@end

