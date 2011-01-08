package GMS::Schema::Result::GroupContactChange;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

use strict;
use warnings;

use base 'DBIx::Class::Core';

__PACKAGE__->load_components("InflateColumn::DateTime", "InflateColumn::Object::Enum");

=head1 NAME

GMS::Schema::Result::GroupContactChange

=cut

__PACKAGE__->table("group_contact_changes");

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0
  sequence: 'group_contact_changes_id_seq'

=head2 group_id

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 0

=head2 contact_id

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 0

=head2 primary

  data_type: 'boolean'
  default_value: false
  is_nullable: 0

=head2 status

  data_type: 'enum'
  extra: {custom_type_name => "group_contact_status",list => ["invited","accepted","retired","active"]}
  is_nullable: 0

=head2 change_type

  data_type: 'enum'
  extra: {custom_type_name => "change_type",list => ["create","request","approve","admin"]}
  is_nullable: 0

=head2 changed_by

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 0

=cut

__PACKAGE__->add_columns(
  "id",
  {
    data_type         => "integer",
    is_auto_increment => 1,
    is_nullable       => 0,
    sequence          => "group_contact_changes_id_seq",
  },
  "group_id",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 0 },
  "contact_id",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 0 },
  "primary",
  { data_type => "boolean", default_value => \"false", is_nullable => 0 },
  "status",
  {
    data_type => "enum",
    extra => {
          custom_type_name => "group_contact_status",
          list => ["invited", "accepted", "retired", "active"],
        },
    is_nullable => 0,
  },
  "change_type",
  {
    data_type => "enum",
    extra => {
          custom_type_name => "change_type",
          list => ["create", "request", "approve", "admin"],
        },
    is_nullable => 0,
  },
  "changed_by",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 0 },
);
__PACKAGE__->set_primary_key("id");

=head1 RELATIONS

=head2 group_contact

Type: belongs_to

Related object: L<GMS::Schema::Result::GroupContact>

=cut

__PACKAGE__->belongs_to(
  "group_contact",
  "GMS::Schema::Result::GroupContact",
  { contact_id => "contact_id", group_id => "group_id" },
  {},
);

=head2 changed_by

Type: belongs_to

Related object: L<GMS::Schema::Result::Account>

=cut

__PACKAGE__->belongs_to(
  "changed_by",
  "GMS::Schema::Result::Account",
  { id => "changed_by" },
  {},
);


# Created by DBIx::Class::Schema::Loader v0.07002 @ 2011-01-08 18:54:24
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:uUAGzK9g0X0ikiJZX0aTkQ


# You can replace this text with custom code or comments, and it will be preserved on regeneration

__PACKAGE__->add_columns(
    '+change_type' => { is_enum => 1 },
    '+status' => { is_enum => 1 },
);

1;
