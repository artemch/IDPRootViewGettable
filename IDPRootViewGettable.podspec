Pod::Spec.new do |s|
  s.name      = "IDPRootViewGettable"
  s.version   = "0.1.0"
  s.summary   = "TODO: Add summary"
  s.description  = "TODO: Add description"
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
end
