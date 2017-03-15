Pod::Spec.new do |s|
  s.name      = "IDPRootViewGettable"
  s.version   = "0.1.0"
  s.summary   = "Getter property for UIViewController which help avoid code duplication"
  s.description  = "This is simple protocol and UIViewController extension which allow reducing code duplication when you use custom root view for UIViewController."
  s.homepage  = "https://github.com/artemch/RootViewGettable.git"
  s.license   = { :type => "New BSD", :file => "LICENSE" }
  s.author    = { "" => "" }
  s.source    = { :git => "https://github.com/artemch/RootViewGettable.git",
                  :tag => s.version.to_s }

  # Platform setup
  s.requires_arc          = true
  s.ios.deployment_target = '9.0'

  # Preserve the layout of headers in the Module directory
  s.header_mappings_dir   = 'Source'
  s.source_files          = 'Source/**/*.{swift,h,m,c,cpp}'

  s.dependency 'IDPCastable'
end
