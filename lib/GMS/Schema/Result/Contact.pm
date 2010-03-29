package GMS::Schema::Result::Contact;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

use strict;
use warnings;

use base 'DBIx::Class::Core';


=head1 NAME

GMS::Schema::Result::Contact

=cut

__PACKAGE__->table("contacts");

=head1 ACCESSORS

=head2 id

  data_type: integer
  default_value: nextval('contacts_id_seq'::regclass)
  is_auto_increment: 1
  is_nullable: 0

=head2 account_id

  data_type: integer
  default_value: undef
  is_foreign_key: 1
  is_nullable: 0

=head2 name

  data_type: character varying
  default_value: undef
  is_nullable: 1
  size: 255

=head2 address_id

  data_type: integer
  default_value: undef
  is_foreign_key: 1
  is_nullable: 0

=head2 email

  data_type: character varying
  default_value: undef
  is_nullable: 0
  size: 255

=cut

__PACKAGE__->add_columns(
  "id",
  {
    data_type         => "integer",
    default_value     => "nextval('contacts_id_seq'::regclass)",
    is_auto_increment => 1,
    is_nullable       => 0,
  },
  "account_id",
  {
    data_type      => "integer",
    default_value  => undef,
    is_foreign_key => 1,
    is_nullable    => 0,
  },
  "name",
  {
    data_type => "character varying",
    default_value => undef,
    is_nullable => 1,
    size => 255,
  },
  "address_id",
  {
    data_type      => "integer",
    default_value  => undef,
    is_foreign_key => 1,
    is_nullable    => 0,
  },
  "email",
  {
    data_type => "character varying",
    default_value => undef,
    is_nullable => 0,
    size => 255,
  },
);
__PACKAGE__->set_primary_key("id");

=head1 RELATIONS

=head2 address

Type: belongs_to

Related object: L<GMS::Schema::Result::Address>

=cut

__PACKAGE__->belongs_to(
  "address",
  "GMS::Schema::Result::Address",
  { id => "address_id" },
  {},
);

=head2 account

Type: belongs_to

Related object: L<GMS::Schema::Result::Account>

=cut

__PACKAGE__->belongs_to(
  "account",
  "GMS::Schema::Result::Account",
  { id => "account_id" },
  {},
);

=head2 group_contacts

Type: has_many

Related object: L<GMS::Schema::Result::GroupContact>

=cut

__PACKAGE__->has_many(
  "group_contacts",
  "GMS::Schema::Result::GroupContact",
  { "foreign.contact_id" => "self.id" },
);


# Created by DBIx::Class::Schema::Loader v0.05000 @ 2010-02-04 23:06:54
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:vAxbPkPb+OWT+CZep0Cpbg


# You can replace this text with custom content, and it will be preserved on regeneration
1;
