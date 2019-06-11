Pod::Spec.new do |s|
  s.name             = 'DevtorNotificationView'
  s.version          = '0.1.0'
  s.summary          = 'To display in-app notification message'
 
  s.description      = <<-DESC
To display in-app notification message
                       DESC
 
  s.homepage         = 'https://github.com/imfeemily/FantasticView'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Devtor' => 'ifeemily@gmail.com' }
  s.source           = { :git => 'https://github.com/imfeemily/FantasticView.git', :tag => s.version.to_s }
 
  s.ios.deployment_target = '10.0'
  s.source_files = 'DevtorNotification/*.{swift,plist}'
 
end