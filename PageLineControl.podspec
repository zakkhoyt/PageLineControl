
Pod::Spec.new do |s|
  s.name         = "PageLineControl"
  s.version      = "1.0.2"
  s.summary      = "A line style page control with a very similar API to UIPageControl."
  s.author        = { "Zakk Hoyt" => "vaporwarewolf@gmail.com" }
  s.homepage      = "http://github.com/zakkhoyt/PageLineControl"
  s.platforms = { :ios => 9.0
                }
  s.license = { :type => 'MIT',
                :text =>  <<-LICENSE
                  Copyright 2017. Zakk hoyt.
                          LICENSE
              }
  s.source       = { :git => 'https://github.com/zakkhoyt/PageLineControl.git',
                    :tag =>  "#{s.version}" }
  s.source_files  = 'PageLineControl/**/*.{swift}'
  s.requires_arc = true
  s.ios.deployment_target = '9.0'
end
