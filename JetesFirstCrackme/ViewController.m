//
//  ViewController.m
//  JetesFirstCrackme
//
//  Created by Kim David Hauser on 24.07.21.
//

#import "ViewController.h"

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    // Do any additional setup after loading the view.
}


- (void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];

    // Update the view, if already loaded.
}

- (void)logMsg2Output: (NSString*)msg{
//    if(!doLog){
//        return;
//    }
//    if(showHeaderCols){
//        _txtOutputNG.string = [NSString stringWithFormat:@"%@======================================================================", _txtOutputNG.string];
//    }
    _txtLicense.string = [NSString stringWithFormat:@"%@\n%@", _txtLicense.string, msg];
//   if(showHeaderCols){
//       _txtOutputNG.string = [NSString stringWithFormat:@"%@\n======================================================================\n", _txtOutputNG.string];
//    }
    [_txtLicense scrollRangeToVisible: NSMakeRange(_txtLicense.string.length, 0)];
//    [_txtLicense flashScrollers];
}

- (IBAction)buttonPressed:(id)sender {
    printf("HELLO WOLLLD!!!\n");
    _lblResult.stringValue = @"HELLO WORLD";
    
    
    NSString *nameString = _txtName.stringValue;// [ViewController stringToHex: @"JeteDonner"];
    
    NSString *nameHex = [ViewController stringToHex: nameString];
    
    NSString *dateString = @"2021-07-24";
    NSString *dateHex = [ViewController stringToHex: dateString];
//    _txtLicense.string = [ViewController stringToHex: @"JeteDonner"];
    
    [self logMsg2Output: [NSString stringWithFormat:@"Hex 4 name: %@ (%@)", nameHex, nameString]];
    [self logMsg2Output: [NSString stringWithFormat:@"Hex 4 date: %@ (%@)", dateHex, dateString]];
    NSString *together = [NSString stringWithFormat:@"%@%@", nameHex, dateHex];
    [self logMsg2Output: [NSString stringWithFormat:@"Together: %@ (length: %d)", together, together.length]];
    
    NSString *cntrl = @"";
    int i = 0;
    for (i = 0; i < together.length; i++) {
        if(i % 2 == 0){
            cntrl = [NSString stringWithFormat:@"%@%d", cntrl, i];
        }else{
            cntrl = [NSString stringWithFormat:@"%@%c", cntrl, i + 0x40];
        }
//        cntrl = [NSString stringWithFormat:@"%@%d", cntrl, (i % 2 == 0 ? i : i + 0x40)];
    }
//    cntrl = [NSString stringWithFormat:@"%@%d", cntrl, i];
//    cntrl = [NSString stringWithFormat:@"%@%d", cntrl, cntrl.length];
    
    [self logMsg2Output: [NSString stringWithFormat:@"Control string: %@", cntrl]];
    
    NSString *cntrlHex = [ViewController stringToHex: cntrl];
    [self logMsg2Output: [NSString stringWithFormat:@"Hex 4 cntrl: %@ (%d)", cntrlHex, cntrlHex.length]];
    
    NSString *AllTogether = [NSString stringWithFormat:@"%@%@", together, cntrlHex];
    [self logMsg2Output: [NSString stringWithFormat:@"AllTogether: %@ (length: %d)", AllTogether, AllTogether.length]];
    NSString *base64 = [ViewController encodeStringTo64:AllTogether];
    [self logMsg2Output: [NSString stringWithFormat:@"Base64: %@ (length: %d)", base64, base64.length]];
}


+ (NSString*)encodeStringTo64:(NSString*)fromString
{
//    NSData *plainData = [fromString dataUsingEncoding:NSUTF8StringEncoding];
//    NSString *base64String;
//    if ([plainData respondsToSelector:@selector(base64EncodedStringWithOptions:)]) {
//        base64String = [plainData base64EncodedStringWithOptions:kNilOptions];  // iOS 7+
//    } else {
//        base64String = [plainData base64Encoding];                              // pre iOS7
//    }
    NSData *encodeData = [fromString dataUsingEncoding:NSUTF8StringEncoding];
    NSString *base64String = [encodeData base64EncodedStringWithOptions:0];

    return base64String;
}

+ (NSString *) stringToHex:(NSString *)str
{
    NSUInteger len = [str length];
    unichar *chars = malloc(len * sizeof(unichar));
    [str getCharacters:chars];

    NSMutableString *hexString = [[NSMutableString alloc] init];

    for(NSUInteger i = 0; i < len; i++ )
    {
        // [hexString [NSString stringWithFormat:@"%02x", chars[i]]]; /*previous input*/
        [hexString appendFormat:@"%02x", chars[i]]; /*EDITED PER COMMENT BELOW*/
    }
    free(chars);

//    return [hexString autorelease];
    return hexString;
}

@end
