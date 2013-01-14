package DBHandler;

use strict;
use warnings;

use DBI;
use Carp qw/confess/;

sub new
{
	my ($class) = @_;
	my $dbh = DBI->connect(
		"dbi:SQLite:dbname=/usr/home/n6tadam/projects/stampcat/db/stamps.db",
		"",
		"",
		{RaiseError => 1},
	) or confess "Couldn't connect to database:  $DBI::errstr";

	bless {
		_dbh => $dbh,
		_query => undef,
		_stmt => undef,
		_results => undef,
	}, $class;
}

sub query
{
	my ($self, %args) = @_;
	my $query = $args{'query'};

	if ($query eq '' or !defined $query) {
		return;
	}

	$self->{'_stmt'} = $self->{'_dbh'}->prepare($query);
	if (!defined $self->{'_stmt'}) {
		confess "Unable to prepare DB query: <<$query>>: " .
			$DBI::errstr;
	}

	$self->{'_stmt'}->execute();
	$self->{'_results'} = $self->{'_stmt'}->fetchall_hashref('id');
}

sub results
{
	my ($self) = @_;

	return $self->{'_results'};
}

1;
