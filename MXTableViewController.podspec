#
# Be sure to run `pod lib lint MXTableViewController.podspec' to ensure this is a
# valid spec and remove all comments before submitting the spec.
#
# Any lines starting with a # are optional, but encouraged
#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = "MXTableViewController"
  s.version          = "1.0.0"
  s.summary          = "An abstration of UITableView and UITableViewController"
  s.description      = <<-DESC
                       MXTableViewController is a library to make the UITableView and UITableViewController implementation easier.
                       DESC
  s.homepage         = "https://github.com/Morbix/MXTableViewController"
  s.license          = 'MIT'
  s.author           = { "Henrique Morbin - HP Macbook Pro" => "morbin_@hotmail.com" }
  s.source           = { :git => "https://github.com/Morbix/MXTableViewController.git", :tag => s.version.to_s }
  s.social_media_url = 'https://facebook.com/hgmorbin'

  s.platform     = :ios, '7.0'
  s.requires_arc = true

  s.source_files = 'Pod/Classes'
  s.resource_bundles = {
    'MXTableViewController' => ['Pod/Assets/*.png']
  }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  s.frameworks = 'UIKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
