Pod::Spec.new do |s|
  s.name           = 'Parse-ReactiveCocoa'
  s.version        = '0.1.1'
  s.summary        = 'Extensions to use Parse with ReactiveCocoa'
  s.license 	   = 'MIT'
  s.description    = 'Collection of Categories to use Parse with ReactiveCocoa'
  s.homepage       = 'https://github.com/gertjanleemans/Parse-ReactiveCocoa'
  s.authors        = {'Gertjan Leemans' => 'gertjan@digitalisma.com'}
  s.source         = { :git => 'https://github.com/gertjanleemans/Parse-Reactivecocoa.git', :tag => '0.1.1' }
  s.source_files   = '*.{h,m}'  
  s.platform       = :ios, '7.0'
  s.requires_arc = true
  s.dependency 'Parse', '~> 1.7'
  s.dependency 'ReactiveCocoa', '~> 2.5'
  s.xcconfig = { 'FRAMEWORK_SEARCH_PATHS' => '"${PODS_ROOT}/Parse"' }
end


