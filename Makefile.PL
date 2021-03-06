#!/usr/bin/env perl
# IMPORTANT: if you delete this file your app will not work as
# expected.  You have been warned.
use inc::Module::Install;
use Module::Install::Catalyst; # Complain loudly if you don't have
                               # Catalyst::Devel installed or haven't said
                               # 'make dist' to create a standalone tarball.

name 'Galuga';
all_from 'lib/Galuga.pm';

requires 'Template::Declare';
requires 'DateTime::Format::SQLite';
requires 'DateTime::Format::DateParse';
requires 'Catalyst::Runtime' => '5.80022';
requires 'Catalyst::Plugin::ConfigLoader';
requires 'Catalyst::Plugin::Static::Simple';
requires 'Catalyst::Model::DBIC::Schema';
requires 'Catalyst::Action::RenderView';
requires 'CatalystX::Component::Traits' => '0.16';
requires 'Catalyst::Plugin::PageCache';
requires 'Catalyst::Plugin::Cache';
requires 'Cache::FileCache';
requires 'Catalyst::Plugin::Sitemap';
requires 'Catalyst::Plugin::VersionedURI';
requires 'Catalyst::View::Mason';
requires 'Moose';
requires 'namespace::autoclean';
requires 'Config::General'; # This should reflect the config file format you've chosen
                 # See Catalyst::Plugin::ConfigLoader for supported formats
test_requires 'Test::More' => '0.88';
catalyst;

install_script glob('script/*.pl');
auto_install;
WriteAll;
