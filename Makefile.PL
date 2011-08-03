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
requires 'DateTime::Format::Flexible';
requires 'Catalyst::Runtime' => '5.80022';
requires 'Catalyst::Plugin::ConfigLoader';
requires 'Catalyst::Plugin::Static::Simple';
requires 'Catalyst::Plugin::Compress::Gzip';
requires 'Catalyst::Model::DBIC::Schema';
requires 'Catalyst::Action::RenderView';
requires 'Catalyst::View::Mason';
requires 'HTML::Mason';
requires 'CatalystX::Component::Traits' => '0.16';
requires 'Catalyst::Plugin::PageCache';
requires 'Catalyst::Plugin::Cache';
requires 'Catalyst::Plugin::SubRequest';
requires 'Cache::FileCache';
requires 'Catalyst::Plugin::Sitemap';
requires 'Catalyst::Plugin::VersionedURI';
requires 'File::Slurp';
requires 'LWP::Simple';
requires 'JSON';
requires 'XML::Feed';
requires 'XML::Atom::SimpleFeed';
requires 'Catalyst::View::Mason';
requires 'Moose';
requires 'namespace::autoclean';
requires 'String::Truncate' => '1.100570';
requires 'URI::Escape';

# Also needed for script/populate_blog.pl
requires 'File::chdir';
requires 'XXX';
requires 'autodie';
requires 'Digest::MD5';
requires 'YAML';
requires 'SQL::Translator' => '0.11006';
requires 'Text::Markdown';

# For script/galuga_fastcgi_server.sh
requires 'FCGI';
requires 'FCGI::ProcManager';

requires 'Config::General'; # This should reflect the config file format you've chosen
                 # See Catalyst::Plugin::ConfigLoader for supported formats
test_requires 'Test::More' => '0.88';
test_requires 'Test::WWW::Mechanize::Catalyst';
catalyst;

install_script glob('script/*.pl');
auto_install;
WriteAll;
