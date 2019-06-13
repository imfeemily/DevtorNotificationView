Pod::Spec.new do |s|
  s.name             = 'DevtorNotificationView'
  s.version          = '0.1.3'
  s.summary          = 'To display in-app notification message'
 
  s.description      = <<-DESC
To display in-app notification message, it is Awesome!
                       DESC
 
  s.homepage         = 'https://github.com/imfeemily/DevtorNotificationView'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Devtor' => 'ifeemily@gmail.com' }
  s.source           = { :git => 'https://github.com/imfeemily/DevtorNotificationView.git', :tag => s.version.to_s }
 
  s.framework = 'UIKit'
  s.ios.deployment_target = '10.0'
  s.source_files = 'DevtorNotification/**/*{.swift}'
s.resources = 'DevtorNotification/**/*.{png,jpeg,jpg,storyboard,xib,xcassets}'
  s.swift_version = '5.0'
 
end