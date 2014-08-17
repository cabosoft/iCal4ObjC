Pod::Spec.new do |s|
  s.name         = "iCalObjCSDK"
  s.version      = "0.0.2"
  s.platform     = :ios, '6.0'
  s.summary      = "iCal4ObjC is a Objective-C implementation of the iCalendar specification as defined in [[http://tools.ietf.org/html/rfc2445][RFC2455]] for iOS and !MacOSX platforms such as iPhone and iPad. It supports to read or write the components of iCalendar in the stream easily."
  s.homepage     = "https://github.com/cabosoft/iCal4ObjC"
  s.author       = 'Satoshi Konno'
  s.source       = { :git => "https://github.com/cabosoft/iCal4ObjC.git", :branch => 'podspec-2.0' }
  s.source_files = "iCalObjCSDK/*.{h,m,mm}"
  s.requires_arc = true
end
