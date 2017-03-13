Pod::Spec.new do |s|
  s.name             = "ScheduleUIKit"
  s.version          = "0.1.0"
  s.summary          = "Helper for implementing UI like TV schedule."

  s.homepage         = "https://github.com/rb-de0/ScheduleUIKit"
  s.license          = 'MIT'
  s.author           = { "rb_de0" => "rebirth.de0@gmail.com" }
  s.source           = { :git => "https://github.com/rb-de0/ScheduleUIKit.git", :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/rb_de0'

  s.platform     = :ios, '9.0'
  s.requires_arc = true

  s.source_files = 'Sources/**/*.swift'
end
