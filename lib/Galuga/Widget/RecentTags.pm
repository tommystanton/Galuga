package Galuga::Widget::RecentTags;

use strict;
use warnings;

use Template::Declare::Tags;
use base 'Template::Declare';

template widget => sub {
    my $self = shift;
    my %arg  = @_;
    my $c    = $arg{c};

    div {
        attr { class => 'widget tags_listing' };
        h3 { 'Recent tags' };
        ul {
            attr { id => 'recent_tags' };
            map { show( 'tag', %arg, tag => $_ ) }
              sort { lc( $a->tag ) cmp lc( $b->tag ) }
              $self->get_tags( $arg{c} );
        };

        p {
            attr { align => 'right', };
            a {
                attr { href => $c->uri_for('/tags') } 'all tags';
            }

        }
    }

    script { outs_raw <<'END_SCRIPT';
$(function(){
    var li = $('#recent_tags').tagcloud({
        type: "list",
        colormin: "AB0404",
        colormax: "AB0404"
    }).find('li');

    li.css('padding-right', '3px' );
});
END_SCRIPT
    }

};

template 'tag' => sub {
    my ( $self, %arg ) = @_;

    li {
        attr {
            value => $arg{tag}->get_column('nbr_entries'),
            title => $arg{tag}->tag
        };
        a {
            attr { href => $arg{c}->uri_for( '/tag', $arg{tag}->tag ) };
            $arg{tag}->tag;
        }
    }
};

sub get_tags {
    my ( $self, $c ) = @_;

    my @tags = $c->model('DB::Entries')->search(
        {},
        {   order_by => { '-desc' => 'created' },
            rows     => 5
        } )->search_related( 'tags', {} )->all;

    return $c->model('DB::Tags')->search(
        { tag => { 'IN' => [ map { $_->tag } @tags ] }, },
        {   group_by => 'tag',
            order_by => 'tag',
            select   => [ 'tag', { count => 'entry_path' } ],
            as       => [qw/ tag nbr_entries /],
        } )->all;
}

1;
