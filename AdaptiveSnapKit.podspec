Pod::Spec.new do |s|
  s.name = 'AdaptiveSnapKit'
  s.version = '5.0.1.5'
  s.license = 'MIT'
  s.summary = 'Harness the power of auto layout with a simplified, chainable, and compile time safe syntax.'
  s.homepage = 'https://github.com/rxvincent/AdaptiveSnapKit.git'
  s.authors = { 'Robert Payne' => 'robertpayne@me.com' }
  s.social_media_url = 'http://twitter.com/robertjpayne'
  s.source = { :git => 'https://github.com/rxvincent/AdaptiveSnapKit.git', :tag => '5.0.1.1'  }

  s.ios.deployment_target = '10.0'
  s.osx.deployment_target = '10.11'
  s.tvos.deployment_target = '10.0'

  s.source_files = 'Sources/*.swift'

  s.swift_version = '5.0'
end
